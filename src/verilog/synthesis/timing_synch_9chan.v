`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:09:55 08/20/2009 
// Design Name: 
// Module Name:    timing_synch 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
// Clock in 2.16MHz and trigger onto the 357 domain and count 2.16 edges
// from the trigger.  edge_sel == 1 => count rising edges, else falling
//
// Once trig_out_delay edges are counted, output amp trigger for 1.4us (3 cyc.)
// 
// Once trig_del is reached, take adc pwer down low for >5us (20 cyc.)
// On the last of these cycles, start counting 357 cycles (sample count)
// After sample_hold_off cycles, take store_strb high for 165 cycles of 357
// When store strobe goes high, count the cycles and when equal to the bunch
// positions output the bunch strobe
// 
// Keeping powerdown low, wait 2 cycles after sampling, take adc_align_en high
//		for 560 cycles (>250us)
//
// Finally take adc_powerdown high again 
//
// 
//
//////////////////////////////////////////////////////////////////////////////////
module timing_synch(
	clk357,
	rst,
	clk2_16,
	clk2_16_edge_sel,
	trig,
	trig_delay,
	sample_hold_off,
	p1_b1_pos,
	p1_b2_pos,
	p1_b3_pos,
	p2_b1_pos,
	p2_b2_pos,
	p2_b3_pos,
	p3_b1_pos,
	p3_b2_pos,
	p3_b3_pos,
	trig_out_delay,
	trig_out_delay2,
	amp_trig,
	amp_trig2,
	store_strb,
	p1_bunch_strb,
	p2_bunch_strb,
	p3_bunch_strb,
	adc_powerdown,
	adc_align_en,
	trig_led_strb,
	clk2_16_led_strb
);

input 		clk357;
input 		rst;
input 		clk2_16;
input			clk2_16_edge_sel;
input 		trig;
input [11:0] trig_delay;
input [6:0] sample_hold_off;
input [7:0] p1_b1_pos;
input [7:0] p1_b2_pos;
input [7:0] p1_b3_pos;
input [7:0] p2_b1_pos;
input [7:0] p2_b2_pos;
input [7:0] p2_b3_pos;
input [7:0] p3_b1_pos;
input [7:0] p3_b2_pos;
input [7:0] p3_b3_pos;
input [6:0] trig_out_delay;
input [6:0] trig_out_delay2;
output 		amp_trig;
output 		amp_trig2;
output 		store_strb;
output 		p1_bunch_strb;
output 		p2_bunch_strb;
output 		p3_bunch_strb;
output 		adc_powerdown;
output 		adc_align_en;
output		trig_led_strb;
output		clk2_16_led_strb;

// Registers
reg amp_trig;
reg amp_trig2;
reg store_strb;
reg adc_powerdown;
reg adc_align_en;
reg p1_bunch_strb;
reg p2_bunch_strb;
reg p3_bunch_strb;

// Internal wires
wire ring_clk_edge;
wire trig_edge;

// For synchronisation
reg trig_a;
reg trig_b;
reg clk2_16_a;
reg clk2_16_b;

//Synchronise trigger and ring clock
always @(posedge clk357 or posedge rst) begin
	if (rst) begin
		trig_a <= 0;
		trig_b <= 0;
		clk2_16_a <= 0;
		clk2_16_b <= 0;
	end else begin
		clk2_16_a <= clk2_16;
		clk2_16_b <= clk2_16_a;
		trig_a <= trig;
		trig_b <= trig_a;	
	end
end

//Calculate the important timing parameters and register to improve timing
reg [16:0] end_amp_trig_del;
reg [16:0] end_amp_trig_del2;
reg [16:0] trig_out_delay_a;
reg [16:0] trig_out_delay2_a;
reg [16:0] start_samp_del;
reg [16:0] end_samp_del;
reg [16:0] start_align_del;
reg [16:0] end_align_del;
reg [16:0] trig_delay_a;

reg [11:0] trig_out_delay_tot, trig_out_delay2_tot, trig_out_delay_int;//trig_out_delay2_int;
always @(posedge clk357) begin
	trig_out_delay_tot <= trig_out_delay_int + trig_out_delay;
	trig_out_delay2_tot <= trig_out_delay_int + trig_out_delay2;
	trig_out_delay_int <= trig_delay - 11'd192;
	//trig_out_delay2_int <= trig_delay - 11'd192;
	trig_out_delay_a   <= trig_out_delay_tot;
	trig_out_delay2_a  <= trig_out_delay2_tot;
	end_amp_trig_del 	<= trig_out_delay_tot + 3;
	end_amp_trig_del2 <= trig_out_delay2_tot + 3;
	start_samp_del 	<= trig_delay + 20;
	end_samp_del 		<= trig_delay + 22;
	start_align_del 	<= trig_delay + 24;
	end_align_del 		<= trig_delay + 584;
	trig_delay_a 		<= trig_delay;
end

//Watch for ring clock edges
assign ring_clk_edge = clk2_16_edge_sel ? (clk2_16_a & ~clk2_16_b) : (~clk2_16_a & clk2_16_b);
//Watch for trigger rising edge
assign trig_edge = trig_a & ~trig_b;

reg [16:0] trig_count;
reg triggered;
reg sample_en;
reg amp_trig_0, amp_trig2_0, adc_align_en_0;

always @(posedge clk357 or posedge rst) begin
	if (rst) begin
		trig_count <= 0;
		triggered <= 0;
		amp_trig_0 <= 0;
		amp_trig2_0 <= 0;
		adc_powerdown <= 1;
		adc_align_en_0 <= 0;
		sample_en <= 0;
	end else begin
		//Wait for the trigger edge
		if (~triggered) begin
			trig_count <= 0;
			triggered <= trig_edge;
		end else begin
			//Trigger edge detected.  Begin counting ring clock cycles
			if (ring_clk_edge) begin 
				trig_count <= trig_count + 1;
			end
			
			//Output the amp trigger when ready
			if (trig_count == trig_out_delay_a)	amp_trig_0 <= 1;
			if (trig_count == end_amp_trig_del) amp_trig_0 <= 0;		
			if (trig_count == trig_out_delay2_a)	amp_trig2_0 <= 1;
			if (trig_count == end_amp_trig_del2)   amp_trig2_0 <= 0;	
			
			//Output the adc control signals when ready
			case(trig_count)
				trig_delay_a:		adc_powerdown <= 0;
				start_samp_del:	sample_en <= 1;
				end_samp_del:		sample_en <= 0;
				start_align_del:	adc_align_en_0 <= 1;
				end_align_del: begin
					adc_align_en_0 <= 0;
					adc_powerdown <= 1;
					triggered <= 0;
				end
			endcase

		end
	end
end

// Pipeline for timing
always @(posedge clk357) begin
	adc_align_en <= adc_align_en_0;
	amp_trig <= amp_trig_0;
	amp_trig2 <= amp_trig2_0;
end

// Count 357 cycles.  This is done seperately for each ADC group
// to duplicate the count register and aid timing
// Store_strb is generated in the P1 loop
reg [8:0] start_store;
reg [8:0] end_store;
reg [8:0] p1_b1_abs_pos;
reg [8:0] p1_b2_abs_pos;
reg [8:0] p1_b3_abs_pos;
reg [8:0] p2_b1_abs_pos;
reg [8:0] p2_b2_abs_pos;
reg [8:0] p2_b3_abs_pos;
reg [8:0] p3_b1_abs_pos;
reg [8:0] p3_b2_abs_pos;
reg [8:0] p3_b3_abs_pos;
reg [8:0] p1_b1_abs_pos_a;
reg [8:0] p1_b2_abs_pos_a;
reg [8:0] p1_b3_abs_pos_a;
reg [8:0] p2_b1_abs_pos_a;
reg [8:0] p2_b2_abs_pos_a;
reg [8:0] p2_b3_abs_pos_a;
reg [8:0] p3_b1_abs_pos_a;
reg [8:0] p3_b2_abs_pos_a;
reg [8:0] p3_b3_abs_pos_a;
reg [8:0] p1_sample_count;
reg [8:0] p2_sample_count;
reg [8:0] p3_sample_count;
reg p1_counting, p2_counting, p3_counting;
// Calculate important p1 values to aid timing and pipeline
always @(posedge clk357) begin
	start_store <= sample_hold_off;
	end_store <= sample_hold_off + 164;
	p1_b1_abs_pos <= p1_b1_pos + sample_hold_off;
	p1_b2_abs_pos <= p1_b2_pos + sample_hold_off;
	p1_b3_abs_pos <= p1_b3_pos + sample_hold_off;
	p1_b1_abs_pos_a <= p1_b1_abs_pos;
	p1_b2_abs_pos_a <= p1_b2_abs_pos;
	p1_b3_abs_pos_a <= p1_b3_abs_pos;
end
always @(posedge clk357 or posedge rst) begin
	if (rst) begin
		p1_sample_count <= 0;
		store_strb <= 0;
		p1_counting <= 0;
	end else begin
		//Reset bunch strobes each cycle
		p1_bunch_strb <= 0;		
		if ((sample_en) && (~p1_counting)) begin
			p1_counting <= 1;
		end else begin
			if (p1_counting) begin
				p1_sample_count <= p1_sample_count + 1;
				case(p1_sample_count)
					start_store: begin
//						p1_sample_count <= p1_sample_count + 1;
						store_strb <= 1;
					end
					p1_b1_abs_pos_a: begin
//						p1_sample_count <= p1_sample_count + 1;
						p1_bunch_strb <= 1;
					end
					p1_b2_abs_pos_a: begin
//						p1_sample_count <= p1_sample_count + 1;
						p1_bunch_strb <= 1;
					end
					p1_b3_abs_pos_a: begin
//						p1_sample_count <= p1_sample_count + 1;
						p1_bunch_strb <= 1;
					end			
					end_store: begin
						store_strb <= 0;
//						p1_sample_count <= p1_sample_count + 1;
					end
					511: begin
						p1_counting <= 0;
						p1_sample_count <= 0;
					end
//					default:		p1_sample_count <= p1_sample_count + 1;
				endcase
			end				
		end
	end
end
// Calculate important p2 values to aid timing and pipeline
always @(posedge clk357) begin
	end_store <= sample_hold_off + 164;
	p2_b1_abs_pos <= p2_b1_pos + sample_hold_off;
	p2_b2_abs_pos <= p2_b2_pos + sample_hold_off;
	p2_b3_abs_pos <= p2_b3_pos + sample_hold_off;
	p2_b1_abs_pos_a <= p2_b1_abs_pos;
	p2_b2_abs_pos_a <= p2_b2_abs_pos;
	p2_b3_abs_pos_a <= p2_b3_abs_pos;
end
always @(posedge clk357 or posedge rst) begin
	if (rst) begin
		p2_sample_count <= 0;
		p2_counting <= 0;
	end else begin
		//Reset bunch strobes each cycle
		p2_bunch_strb <= 0;		
		if ((sample_en) && (~p2_counting)) begin
			p2_counting <= 1;
		end else begin
			if (p2_counting) begin
				p2_sample_count <= p2_sample_count + 1;
				case(p2_sample_count)
//					start_store: begin
//						p2_sample_count <= p2_sample_count + 1;
//						store_strb <= 1;
//					end
					p2_b1_abs_pos_a: begin
//						p2_sample_count <= p2_sample_count + 1;
						p2_bunch_strb <= 1;
					end
					p2_b2_abs_pos_a: begin
//						p2_sample_count <= p2_sample_count + 1;
						p2_bunch_strb <= 1;
					end
					p2_b3_abs_pos_a: begin
//						p2_sample_count <= p2_sample_count + 1;
						p2_bunch_strb <= 1;
					end			
//					end_store: 	store_strb <= 0;
					511: begin
						p2_counting <= 0;
						p2_sample_count <= 0;
					end
//					default:		p2_sample_count <= p2_sample_count + 1;
				endcase
			end				
		end
	end
end
// Calculate important p3 values to aid timing
always @(posedge clk357) begin
	end_store <= sample_hold_off + 164;
	p3_b1_abs_pos <= p3_b1_pos + sample_hold_off;
	p3_b2_abs_pos <= p3_b2_pos + sample_hold_off;
	p3_b3_abs_pos <= p3_b3_pos + sample_hold_off;
	p3_b1_abs_pos_a <= p3_b1_abs_pos;
	p3_b2_abs_pos_a <= p3_b2_abs_pos;
	p3_b3_abs_pos_a <= p3_b3_abs_pos;
end
always @(posedge clk357 or posedge rst) begin
	if (rst) begin
		p3_sample_count <= 0;
		p3_counting <= 0;
	end else begin
		//Reset bunch strobes each cycle
		p3_bunch_strb <= 0;		
		if ((sample_en) && (~p3_counting)) begin
			p3_counting <= 1;
		end else begin
			if (p3_counting) begin
				p3_sample_count <= p3_sample_count + 1;
				case(p3_sample_count)
//					start_store: begin
//						p3_sample_count <= p3_sample_count + 1;
//						store_strb <= 1;
//					end
					p3_b1_abs_pos_a: begin
//						p3_sample_count <= p3_sample_count + 1;
						p3_bunch_strb <= 1;
					end
					p3_b2_abs_pos_a: begin
//						p3_sample_count <= p3_sample_count + 1;
						p3_bunch_strb <= 1;
					end
					p3_b3_abs_pos_a: begin
//						p3_sample_count <= p3_sample_count + 1;
						p3_bunch_strb <= 1;
					end			
//					end_store: 	store_strb <= 0;
					511: begin
						p3_counting <= 0;
						p3_sample_count <= 0;
					end
//					default:		p3_sample_count <= p3_sample_count + 1;
				endcase
			end				
		end
	end
end

// Send a 32 cycle strobe to light an LED on each trigger edge
reg [4:0] trig_led_count;
reg		 trig_led_strb;
always @(posedge clk357 or posedge rst) begin
	if (rst) begin
		trig_led_count <= 0;
		trig_led_strb <= 0;
	end else begin
		case (trig_led_count)
			5'd0: if (trig_edge) trig_led_count <= 5'd1;
			5'd1: begin
				trig_led_strb <= 1;
				trig_led_count <= trig_led_count + 1;
			end
			5'd31: begin
				trig_led_strb <= 0;
				trig_led_count <= 0;
			end
			default: trig_led_count <= trig_led_count + 1;
		endcase
	end
end

// Send a 32 cycle strobe to light an LED on each ring clock edge
reg [4:0] clk2_16_led_count;
reg		 clk2_16_led_strb;
always @(posedge clk357 or posedge rst) begin
	if (rst) begin
		clk2_16_led_count <= 0;
		clk2_16_led_strb <= 0;
	end else begin
		case (clk2_16_led_count)
			5'd0: if (ring_clk_edge) clk2_16_led_count <= 5'd1;
			5'd1: begin
				clk2_16_led_strb <= 1;
				clk2_16_led_count <= clk2_16_led_count + 1;
			end
			5'd31: begin
				clk2_16_led_strb <= 0;
				clk2_16_led_count <= 0;
			end
			default: clk2_16_led_count <= clk2_16_led_count + 1;
		endcase
	end
end

endmodule
