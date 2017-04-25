`timescale 1ns / 1ps


///////////////// ** trim_dac_ctrl ** ////////////////////////////////////////
//
// Logic to control the LTC2624-1 trim DACs
//
// The 9 12-bit DAC outputs are stored in a LUT.  Note the LUT is nominally 16 lots of
// 14-bit values: ignore the higher addresses and the MS 2 bits of each entry
//
// The LUT is loaded via the uart_decoder in the same way as the FB gain luts
//
// The FONT 5 board has 3 trim DAC chips each with 4 DACs (A,B,C,D) each.
// The chips are in series, and are loaded by transmitting serial data.
// DAC A is loaded on all chips first, then DAC B, then DAC C.  D is unused
//
// Chip 1 is connected to channels 1-3, 2 to 4-5 and 3 to 7-9
//
// When the ld_dacs strobe goes high synchronous to clk (40MHz), 3x 32-bit shift regs
// are loaded with the following pattern:
//
//		X X C A D D D X				[Each character is 4-bits]
//
// Where:	X = Don't care (4'b0000)
//				C = Command (always 4'b0011, which writes to and updates specified DAC)
//				A = Currenct DAC addr (A = 0000, B = 0001, C = 0010, D = 0011)
//				D = 12 data bits from LUT
//
// The shift regs are in series and the three bit patterns are transmitted to the DAC
// chain.  Once all three DAC A's have been updated, then the shift regs are reloaded
// and all DAC B's are updated, then all DAC C's

module trim_dac_ctrl (
	clk40,
	rst,
	lut_in,
	lut_addr,
	lut_we,
	load_dacs,
	serial_out,
	clk_out,
	enable_out
);

input			clk40;
input 		rst;
input [6:0] lut_in;
input [4:0] lut_addr;
input 		lut_we;
input 		load_dacs;
output 		serial_out;
output 		clk_out;
output 		enable_out;

// Instantiate LUT
wire [13:0] lut_out;
reg  [3:0]	lut_out_addr;
dp_lut_7x5_14x4 trim_lut (
	.clk(clk40),
	.din_a(lut_in),
	.we_a(lut_we),
	.addr_a(lut_addr),
	.dout_b(lut_out),
	.addr_b(lut_out_addr)
);

reg clk20A, clk20B;

// Instantiate the 3 shift registers
reg  [3:0]	dac_addr;
reg			shift_en;
reg 			shreg1_ld_en, shreg2_ld_en, shreg3_ld_en;
wire [31:0] shreg_pin;
wire 			shreg1_out, shreg2_out;
shift_reg_32 shreg1(
	.clk(clk20A), 
	.p_load(shreg1_ld_en),  
	.p_data(shreg_pin), 
	.s_in(1'b0),
	.s_out(shreg1_out),
	.shift_en(shift_en)
);
shift_reg_32 shreg2(
	.clk(clk20A), 
	.p_load(shreg2_ld_en),  
	.p_data(shreg_pin), 
	.s_in(shreg1_out),
	.s_out(shreg2_out),
	.shift_en(shift_en)
);
shift_reg_32 shreg3(
	.clk(clk20A), 
	.p_load(shreg3_ld_en),  
	.p_data(shreg_pin), 
	.s_in(shreg2_out),
	.s_out(serial_out),
	.shift_en(shift_en)
);

// Form shift reg parallel input
assign shreg_pin = {8'b0, 4'b0011, dac_addr, lut_out[11:0], 4'b0};

// Assign DAC chip clock.  180 deg. phase shift so rising edge is in the middle
// of serial out data bits.  Only output when DAC chips enabled
reg clk_mask;
assign clk_out = (clk_mask & ~clk20A);

// The DAC chip enable is active low.  Require it to stay active one cycle longer
// than the shift enable, and also activate one earlier, so use extra cycle regs
reg early_cycle, late_cycle;
assign enable_out = ~(shift_en | early_cycle | late_cycle);

//Divide te 40MHz and generate two clocks in quadrature
//One phase A clock shregs and, inverted, clocks DAC chips
//Other phase generates enables to avoid edge transitions
always @(posedge clk40 or posedge rst) begin
	if (rst) begin
		clk20A <= 0;
	end else begin
		clk20A <= ~clk20A;
	end
end
always @(negedge clk40 or posedge rst) begin
	if (rst) begin
		clk20B <= 0;
	end else begin
		clk20B <= ~clk20B;
	end
end

// Create mask to stop DAC chip clock
always @(posedge clk20A or posedge rst) begin
	if (rst) begin
		clk_mask <= 0;
	end else begin
		if (shift_en | early_cycle) begin
			clk_mask <= 1;
		end else begin
			clk_mask <= 0;
		end
	end
end
		
// Extend synchronous trigger in order to ensure the divided clock spots it
reg trig_a, trig_b;
wire long_trig;
always @(posedge clk40) begin
	trig_a <= load_dacs;
	trig_b <= trig_a;
end
assign long_trig = trig_a | trig_b;

// Wait for load_dacs synchronous trigger, then begin to step through a state machine
// The machine first loads the 3 shregs with DAC A values for each chip, i.e channels
// 1, 4 & 7
reg [8:0] state_count;
always @(negedge clk20B or posedge rst) begin
	if (rst) begin
		shift_en 	 <= 0;
		state_count  <= 0;
		shreg1_ld_en <= 0;
		shreg2_ld_en <= 0;
		shreg3_ld_en <= 0;
		early_cycle  <= 0;
		late_cycle   <= 0;
	end else begin
		early_cycle <= 0;
		late_cycle  <= 0;
		if (long_trig) begin
			//Start state machine
			state_count <= 9'd1;
		end else begin
			state_count <= state_count + 1;
			case (state_count)
				9'd0: state_count <= 0;
				9'd1: begin
					//Specify address of dac A for all chips
					dac_addr <= 4'b0000;
					//Load shreg1 with ch7 dac code
					lut_out_addr <= 4'd0;
					shreg1_ld_en <= 1;
				end
				9'd2: begin
					//Load shreg2 with ch4 dac code
					shreg1_ld_en <= 0;
					lut_out_addr <= 4'd1;
					shreg2_ld_en <= 1;
				end
				9'd3: begin
					//Load shreg3 with ch1 dac code
					shreg2_ld_en <= 0;
					lut_out_addr <= 4'd2;
					shreg3_ld_en <= 1;
				end
				9'd4: begin
					//shregs loaded
					shreg3_ld_en <= 0;
					//Begin enabling DAC chips
					early_cycle <= 1;
				end
				9'd5: begin
					//Enable shift register data to be shifted out onto DAC chips
					shift_en <= 1;
				end
				9'd100: begin
					//All data shifted out of shregs onto DAC chips
					shift_en <= 0;	 // [updates dacs]
					late_cycle <= 1;
				end
				9'd101: begin
					//Specify address of dac B for all chips
					dac_addr <= 4'b0001;
					//Load shreg1 with ch8 dac code
					lut_out_addr <= 4'd3;
					shreg1_ld_en <= 1;
				end
				9'd102: begin
					//Load shreg2 with ch5 dac code
					shreg1_ld_en <= 0;
					lut_out_addr <= 4'd4;
					shreg2_ld_en <= 1;
				end
				9'd103: begin
					//Load shreg3 with ch2 dac code
					shreg2_ld_en <= 0;
					lut_out_addr <= 4'd5;
					shreg3_ld_en <= 1;
				end
				9'd104: begin
					//shregs loaded
					shreg3_ld_en <= 0;
					//Begin enabling DAC chips
					early_cycle <= 1;
				end
				9'd105: begin
					//Enable shift register data to be shifted out onto DAC chips
					shift_en <= 1;
				end
				9'd200: begin
					//All data shifted out of shregs onto DAC chips
					shift_en <= 0;	 // [updates dacs]
					late_cycle <= 1;
				end
				9'd201: begin
					//Specify address of dac C for all chips
					dac_addr <= 4'b0010;
					//Load shreg1 with ch9 dac code
					lut_out_addr <= 4'd6;
					shreg1_ld_en <= 1;
				end
				9'd202: begin
					//Load shreg2 with ch6 dac code
					shreg1_ld_en <= 0;
					lut_out_addr <= 4'd7;
					shreg2_ld_en <= 1;
				end
				9'd203: begin
					//Load shreg3 with ch3 dac code
					shreg2_ld_en <= 0;
					lut_out_addr <= 4'd8;
					shreg3_ld_en <= 1;
				end
				9'd204: begin
					//shregs loaded
					shreg3_ld_en <= 0;
					//Begin enabling DAC chips
					early_cycle <= 1;
				end
				9'd205: begin
					//Enable shift register data to be shifted out onto DAC chips
					shift_en <= 1;
				end
				9'd300: begin
					//All data shifted out of shregs onto DAC chips
					shift_en <= 0;	 // [updates dacs]
					late_cycle <= 1;
					state_count <= 0;
				end
			endcase
		end
	end
end

endmodule



///////////////// ** dp_lut_7x5_14x4 ** ////////////////////////////////////////
//
// Simple dual port LUT.  Takes 32 7-bit values input and outputs 16 14-bit values
// Port A takes in 7-bit values addr 0-31
// Port B outputs 14-bit values, for example B(0) = {A(1), A(0)}

module dp_lut_7x5_14x4 (
	clk,
	din_a,
	we_a,
	addr_a,
	dout_b,
	addr_b
);

input 		  clk;
input 		  we_a;
input  [4:0]  addr_a;
input  [6:0]  din_a;
input  [3:0]  addr_b;
output [13:0] dout_b;

reg [6:0] lut [0:31];

//Write routine
always @(posedge clk) begin
	if (we_a) begin
		lut[addr_a] <= din_a;
	end
end

//Output
assign dout_b = {lut[2*addr_b + 1], lut[2*addr_b]};

endmodule


///////////////// ** shift_reg_32 ** //////////////////////////////////////////
//
// 32 bit parallel-loadable shift register
//

module shift_reg_32 (
	clk, 
	p_load,  
	p_data, 
	s_in,
	s_out,
	shift_en
);
	
input  		 clk;
input			 s_in;
input			 p_load;
input [31:0] p_data;
input			 shift_en;
output 		 s_out;

reg   [31:0] shreg;

always @(posedge clk) begin
	if (p_load) begin
		shreg = p_data;
	end else begin
		if (shift_en) begin
			shreg = {shreg[30:0], s_in};
		end
	end
end
	
assign s_out  = shreg[31];

endmodule



