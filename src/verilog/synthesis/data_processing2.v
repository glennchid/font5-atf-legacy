`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:06:26 10/22/2009 
// Design Name: 
// Module Name:    data_processing 
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
//////////////////////////////////////////////////////////////////////////////////

module coupled_data_processing2(
    input clk,
	 input rst,
	 input slow_clk,
	 input [12:0] p2_sigma_in,
    input [12:0] p2_delta_in,
    input [12:0] p3_sigma_in,
    input [12:0] p3_delta_in,
	 input store_strb,
	 input p2_bunch_strb,
	 input p3_bunch_strb,
	 input feedbck_en,
	 input delay_loop_en,
	 input const_dac_en,
	 input [12:0] const_dac_out,
	 input [6:0]  p2_lut_dinb,
	 input [14:0] p2_lut_addrb,
	 input p2_lut_web,
	 input [6:0]  p3_lut_dinb,
	 input [14:0] p3_lut_addrb,
	 input p3_lut_web,
	 input [12:0] b2_offset,
	 input [12:0] b3_offset,
	 input [6:0] fir_k1,
	 output [6:0] p2_lut_doutb,
	 output [6:0] p3_lut_doutb,
    output reg [12:0] amp_drive,
	 output reg dac_en // synthesis attribute shreg_extract of dac_en is "no";
    );
	 
// **** Synchronise the bunch offsets and weight factors ****
reg [12:0] b2_offset_a, b2_offset_b, b3_offset_a, b3_offset_b;
reg [12:0] b2_offset_c, b2_offset_d, b3_offset_c, b3_offset_d;
reg [6:0] fir_k1_a, fir_k1_b;
always @(posedge clk or posedge rst) begin
	if (rst) begin
		 b2_offset_a <= 0;
		 b3_offset_a <= 0;
		 b2_offset_b <= 0;
		 b3_offset_b <= 0;
		 b2_offset_c <= 0;
		 b3_offset_c <= 0;
		 b2_offset_d <= 0;
		 b3_offset_d <= 0;
		 fir_k1_a	 <= 0;
		 fir_k1_b	 <= 0;
	end else begin
		 b2_offset_a <= b2_offset;
		 b3_offset_a <= b3_offset;
		 b2_offset_b <= b2_offset_a;
		 b3_offset_b <= b3_offset_a;
		 b2_offset_c <= b2_offset_b;
		 b3_offset_c <= b3_offset_b;
		 b2_offset_d <= b2_offset_c;
		 b3_offset_d <= b3_offset_c;
		 fir_k1_a	 <= fir_k1;
		 fir_k1_b	 <= fir_k1_a;
	end
end
	 
	 
// **** Strobe chain s ****
//
// The incoming bunch strobes are passed through a register chain, allowing
// various enables to be set at the correct time.  Finally they are used 
// to clock the DAC
//
// The P3 strobe arrives latest, and is used to drive the FB loop and DAC.  
// The P2 strobe is used to calculate the P2 component of the kick, then added
// into the P3 delay loop and into the FIR tap calculator
wire zero_strb;
reg p3_bunch_strb_a, p3_bunch_strb_b, p3_bunch_strb_c, p3_bunch_strb_d, p3_bunch_strb_e, p3_bunch_strb_f, p3_bunch_strb_g, p3_bunch_strb_h;
always @(posedge clk or posedge rst) begin
	if (rst) begin
		p3_bunch_strb_a <= 0;
		p3_bunch_strb_b <= 0;
		p3_bunch_strb_c <= 0;
		p3_bunch_strb_d <= 0;
		p3_bunch_strb_e <= 0;
		p3_bunch_strb_f <= 0;
		p3_bunch_strb_g <= 0;
		p3_bunch_strb_h <= 0;
	end else begin
		p3_bunch_strb_a <= p3_bunch_strb | zero_strb;
		// synthesis attribute shreg_extract of p3_bunch_strb_a is "no";
		p3_bunch_strb_b <= p3_bunch_strb_a;
		// synthesis attribute shreg_extract of p3_bunch_strb_b is "no";
		p3_bunch_strb_c <= p3_bunch_strb_b;
		// synthesis attribute shreg_extract of p3_bunch_strb_c is "no";
		p3_bunch_strb_d <= p3_bunch_strb_c;
		// synthesis attribute shreg_extract of p3_bunch_strb_d is "no";
		p3_bunch_strb_e <= p3_bunch_strb_d;
		// synthesis attribute shreg_extract of p3_bunch_strb_e is "no";
		p3_bunch_strb_f <= p3_bunch_strb_e;
		// synthesis attribute shreg_extract of p3_bunch_strb_f is "no";
		p3_bunch_strb_g <= p3_bunch_strb_f;
		// synthesis attribute shreg_extract of p3_bunch_strb_g is "no";
		p3_bunch_strb_h <= p3_bunch_strb_g;
		// synthesis attribute shreg_extract of p3_bunch_strb_h is "no";
	end
end
reg p2_bunch_strb_a, p2_bunch_strb_b, p2_bunch_strb_c, p2_bunch_strb_d, p2_bunch_strb_e, p2_bunch_strb_f, p2_bunch_strb_g, p2_bunch_strb_h;
always @(posedge clk or posedge rst) begin
	if (rst) begin
		p2_bunch_strb_a <= 0;
		p2_bunch_strb_b <= 0;
		p2_bunch_strb_c <= 0;
		p2_bunch_strb_d <= 0;
		p2_bunch_strb_e <= 0;
		p2_bunch_strb_f <= 0;
		p2_bunch_strb_g <= 0;
		p2_bunch_strb_h <= 0;
	end else begin
		p2_bunch_strb_a <= p2_bunch_strb | zero_strb;
		// synthesis attribute shreg_extract of p2_bunch_strb_a is "no";
		p2_bunch_strb_b <= p2_bunch_strb_a;
		// synthesis attribute shreg_extract of p2_bunch_strb_b is "no";
		p2_bunch_strb_c <= p2_bunch_strb_b;
		// synthesis attribute shreg_extract of p2_bunch_strb_c is "no";
		p2_bunch_strb_d <= p2_bunch_strb_c;
		// synthesis attribute shreg_extract of p2_bunch_strb_d is "no";
		p2_bunch_strb_e <= p2_bunch_strb_d;
		// synthesis attribute shreg_extract of p2_bunch_strb_e is "no";
		p2_bunch_strb_f <= p2_bunch_strb_e;
		// synthesis attribute shreg_extract of p2_bunch_strb_f is "no";
		p2_bunch_strb_g <= p2_bunch_strb_f;
		// synthesis attribute shreg_extract of p2_bunch_strb_g is "no";
		p2_bunch_strb_h <= p2_bunch_strb_g;
		// synthesis attribute shreg_extract of p2_bunch_strb_h is "no";
	end
end

// **** Monitor strobes ****
//
// Detect store_strb falling edge and 'inject' a zero_strb into the bunch_strb
// chain to zero the dac outside of active ring clock cycle
reg store_strb_a, store_strb_b;
always@(posedge clk or posedge rst) begin
	if (rst) begin
		store_strb_a <= 0;
		store_strb_b <= 0;
	end else begin
		store_strb_a <= store_strb;
		store_strb_b <= store_strb_a;
	end
end
assign zero_strb = ~store_strb_a & store_strb_b;

// Count p3 bunch strobes
reg [1:0] bunch_count;
always @(posedge clk or posedge rst) begin
	if (rst) begin
		bunch_count <= 0;
	end else begin
		if (zero_strb) begin
			bunch_count <= 0;
		end else begin
			//if (p3_bunch_strb_g & store_strb) begin
			if (p3_bunch_strb_h & store_strb) begin
				bunch_count <= bunch_count + 1;
			end
		end
	end
end
	 
// ##########################################################################
// ###### Calculate P2 contribution to kick and store in p2_store_reg #######

// **** Instantiation of P2 LUT ****
//
// For charge normalisation, load 4096*const*(1/addra)
// For non-charge norm, load 4096*const for all locations
// The MS 7 bits of data port a are unused
wire [27:0] p2_lut_temp;
wire [20:0] p2_lut_out;
assign p2_lut_out = p2_lut_temp[20:0];
ram_13x28_15x7 p2_lut (
//LUTRAM200317 p2_lut (
	.clka(clk),
	.dina(), // Bus [27 : 0] 
	.addra(p2_sigma_in), // Bus [12 : 0] 
	.wea(1'b0), // Bus [0 : 0] 
	.douta(p2_lut_temp), // Bus [27 : 0] 
	.clkb(slow_clk),
	.dinb(p2_lut_dinb), // Bus [6 : 0] 
	.addrb(p2_lut_addrb), // Bus [14 : 0] 
	.web(p2_lut_web), // Bus [0 : 0] 
	.doutb(p2_lut_doutb)); // Bus [6 : 0] 
	
// Register P2 LUT output
//reg  [20:0] p2_lut_reg;
//always @(posedge clk) p2_lut_reg <= p2_lut_out;

// **** Pipeline the P2 difference signal during LUT operation ****
//
reg [12:0] p2_delta_a, p2_delta_b;
always @(posedge clk or posedge rst) begin
	if (rst) begin
		p2_delta_a <= 0;
		p2_delta_b <= 0;
	end else begin
		p2_delta_a <= p2_delta_in;
		// synthesis attribute shreg_extract of p2_delta_a is "no";
		p2_delta_b <= p2_delta_a;
		// synthesis attribute shreg_extract of p2_delta_b is "no";
	end
end


// **** Instantiate P2 multiplier ****
// 
// This multiplier forms the const*D/S from the P2 LUT output and difference,
// there is no delay loop.  It's output is 48-bit and is stored in P2_store_reg
// Inputs 21-bit and 13-bit, plus a 48-bit carry in to the adder.  3 cycle latency
wire [47:0] p2_mac_out;
FB_MULT_ADD p2_mult_add (
    //.A_IN(p2_lut_reg), 
	.A_IN(p2_lut_out), 
    .B_IN(p2_delta_b), 
    .CEMULTCARRYIN_IN(1'b0), 
    .CLK_IN(clk), 
	 .C_IN(48'b0),
    .P_OUT(p2_mac_out)
   );

// Store the P2 contribution when the p2 bunch strobe reaches register 'e' in its chain
reg  [47:0] p2_store_reg;	
always @(posedge clk or posedge rst) begin
	if (rst) begin
		p2_store_reg <= 0;
	end else begin
		if (zero_strb) begin
			p2_store_reg <= 48'b0;
		end else begin
			if (p2_bunch_strb_e & store_strb) begin
				p2_store_reg <= p2_mac_out;
			end
		end
	end
end



// ###########################################################################
// ###### Process P3 sum and difference signals ready for position calc ######

// **** Instantiation of p3 LUT ****
//
// For charge normalisation, load 4096*const*(1/addra)
// For non-charge norm, load 4096*const for all locations
// The MS 7 bits of data port a are unused
wire [27:0] p3_lut_temp;
wire [20:0] p3_lut_out;
assign p3_lut_out = p3_lut_temp[20:0];
ram_13x28_15x7 p3_lut (
//LUTRAM200317 p3_lut (
	.clka(clk),
	.dina(), // Bus [27 : 0] 
	.addra(p3_sigma_in), // Bus [12 : 0] 
	.wea(1'b0), // Bus [0 : 0] 
	.douta(p3_lut_temp), // Bus [27 : 0] 
	.clkb(slow_clk),
	.dinb(p3_lut_dinb), // Bus [6 : 0] 
	.addrb(p3_lut_addrb), // Bus [14 : 0] 
	.web(p3_lut_web), // Bus [0 : 0] 
	.doutb(p3_lut_doutb)); // Bus [6 : 0] 
	
// Register p3 LUT output
//reg  [20:0] p3_lut_reg;
//always @(posedge clk) p3_lut_reg <= p3_lut_out;

// **** Pipeline the p3 difference signal during LUT operation ****
reg [12:0] p3_delta_a, p3_delta_b;
always @(posedge clk or posedge rst) begin
	if (rst) begin
		p3_delta_a <= 0;
		p3_delta_b <= 0;
	end else begin
		p3_delta_a <= p3_delta_in;
		// synthesis attribute shreg_extract of p3_delta_a is "no";
		p3_delta_b <= p3_delta_a;
		// synthesis attribute shreg_extract of p3_delta_b is "no";
	end
end

// ##########################################################################
// ####################### Calculate FB signal ##############################
//
// The P3 S and D are multiplied and added to the delay loop.  The delay loop 
// contains the P2 contribution, FIR correction and banana correction before P3 
// signals arrive

//// **** Instantiate main P3 feedback multiplier/adder ****
//// 
//// This multiplier/adder forms the const*D/S from the P3 LUT output and difference,
//// then adds in the value of the delay loop.  It's output is 48-bit and goes
//// on to form the feedback signal
//// Inputs 21-bit and 13-bit, plus a 48-bit carry in to the adder.  3 cycle latency

wire [47:0] delay_loop_out;
wire [47:0] fb_mac_out;
FB_MULT_ADD feedback_mult_add (
    //.A_IN(p3_lut_reg),
    .A_IN(p3_lut_out), 	 
    .B_IN(p3_delta_b), 
    .CEMULTCARRYIN_IN(1'b0), 
    .CLK_IN(clk), 
	 .C_IN(delay_loop_out),
    .P_OUT(fb_mac_out)
   );


// ##########################################################################
// ####################### Calculate FIR tap input ##########################
//
// The scaled P2 and P3 positions used to calculate the kick are stored in fir_tap1
// ready to be scaled and added into the feedback's delay loop
// This is done in parallel so the latency through the FB loop itself can be minimal

// **** Instantiate P3 multiplier for FIR ****
// 
// This multiplier forms the const*D/S from the P3 LUT output and difference,
// and the P2 store is added in.  Output shifted down then stored in fir_tap1
wire [47:0] fir_mult_out;
FB_MULT_ADD fir_mult_add (
    //.A_IN(p3_lut_reg), 
    .A_IN(p3_lut_out), 
    .B_IN(p3_delta_b), 
    .CEMULTCARRYIN_IN(1'b0), 
    .CLK_IN(clk), 
	 .C_IN(p2_store_reg),
    .P_OUT(fir_mult_out)
   );


// **** Store delay loop and FIR 1st tap in their registers ****
//
// Register the fb multiplier/adder output in the delay loop and FIR multiplier
// output in the fir_tap1 register.  Do so when bunch strobe is at stage 'e' of its
// pipeline
//
// Reset registers on zero_strobe
//
// Note the FIR1 is divided by 64.  This factor returns after multiplication,
// as k1 is a 7-bit twos comp fractional value scaled to -64 to 63.  
// It is also saturated at 25 bits before multiplication
//
reg [47:0] delay_loop;
reg [41:0] fir_tap1;
always @(posedge clk or posedge rst) begin
	if (rst) begin
		delay_loop <= 0;
		fir_tap1   <= 0;
	end else begin
		if (zero_strb) begin
			delay_loop <= 48'b0;
			fir_tap1   <= 29'b0;
		end else begin
			if (p3_bunch_strb_e & store_strb) begin
				if (delay_loop_en) begin
					delay_loop <= fb_mac_out;
				end else begin
					delay_loop <= 48'b0;
				end
				fir_tap1 <= fir_mult_out[47:6];
				
//				//Divide by 64 and saturate 
//				if (fir_mult_out[47]) begin
//					// -ve.
//					if ( (~fir_mult_out[46:35]) == 12'b0) begin
//						fir_tap1 <= fir_mult_out[35:6];
//					end else begin
//						fir_tap1 <= 30'd536870912;
//					end
//				end else begin
//					// +ve.
//					if ( (fir_mult_out[46:35]) == 12'b0) begin
//						fir_tap1 <= fir_mult_out[35:6];
//					end else begin
//						fir_tap1 <= 30'd268435455;
//					end					
//				end
			end
		end
	end
end


// ******* Scale the FIR tap 1 with k1 *********

// FIR_SCALE_MULT   A: 30   B:7   Out: 36   3 cycle latency
wire [48:0] fir_scale_mult_out;
//FIR_SCALE_MULT fir_scaling_multiplier (
//    .A_IN(fir_tap1), 
//    .B_IN(fir_k1_b), 
//    .CARRYIN_IN(1'b0), 
//    .CE_IN(1'b1), 
//    .CLK_IN(clk), 
//    .P_OUT(fir_scale_mult_out)
//    );

// FIR_SCALE: 2 DSP48s, 4 cycle latency (optimal).  42 bit x 7 bit = 49 bit output
FIR_SCALE fir_scaling_multiplier (
	.clk(clk),
	.a(fir_tap1), // Bus [41 : 0] 
	.b(fir_k1_b), // Bus [6 : 0] 
	.p(fir_scale_mult_out)); // Bus [48 : 0] 


// ##########################################################################
// #################### Add banana cor. to fir value ########################

// Store current bunch correction in delay_loop_banana, left shift 12 to match
// delay loop scale factor and sign extend
reg [47:0] delay_loop_banana;
always @(posedge clk or posedge rst) begin
	if (rst) begin
		delay_loop_banana   <= 0;
	end else begin
		case (bunch_count)
			2'd0: begin
				if (b2_offset_b[12]) begin
					delay_loop_banana <= {23'd8388607, b2_offset_d, 12'b0};
				end else begin
					delay_loop_banana <= {23'd0, b2_offset_d, 12'b0};
				end
			end
			2'd1:	begin
				if (b3_offset_b[12]) begin
					delay_loop_banana <= {23'd8388607, b3_offset_d, 12'b0};
				end else begin
					delay_loop_banana <= {23'd0, b3_offset_d, 12'b0};
				end
			end
			default: delay_loop_banana <= delay_loop_banana;
		endcase
	end
end



// Saturate fir tap at 48 bits
wire [47:0] fir_scaled_sat;
assign fir_scaled_sat = (fir_scale_mult_out[48] & ~fir_scale_mult_out[47]) ? {1'b1, 47'b0} :
								(~fir_scale_mult_out[48] & fir_scale_mult_out[47]) ? {1'b0, 47'b1} :
								fir_scale_mult_out[47:0];

// Add banana corr. to fir output (2 cycle latency)
wire [47:0] fir_plus_banana;
ADD_48_48 add_fir_banana (
    .AB_IN(fir_scaled_sat), 
    .CEA2_IN(1'b1), 
    .CEB2_IN(1'b1), 
    .CEMULTCARRYIN_IN(0), 
    .CLK_IN(clk), 
    //.C_IN(48'd0), 
	 .C_IN(delay_loop_banana), 
    .P_OUT(fir_plus_banana)
    );


// ##########################################################################
// #################### Add corrections to delay loop #######################

// Two cycle latency
wire [47:0] delay_loop_corr;
ADD_48_48 add_delay_loop (
    .AB_IN(delay_loop), 
    .CEA2_IN(1'b1), 
    .CEB2_IN(1'b1), 
    .CEMULTCARRYIN_IN(0), 
    .CLK_IN(clk), 
    //.C_IN(fir_scaled_sat), 
	.C_IN(fir_plus_banana), 
    .P_OUT(delay_loop_corr)
    );
	 
// ##########################################################################
// #################### Add P2 contribution to delay loop ###################
//
// The P2 contribution to the kick will be ready in the delay loop when P3 signals
// hit their multiplier

// One cycle latency
ADD_48_48 add_p2_cont (
    .AB_IN(p2_store_reg), 
    .CEA2_IN(1'b1), 
    .CEB2_IN(1'b1), 
    .CEMULTCARRYIN_IN(0), 
    .CLK_IN(clk), 
    .C_IN(delay_loop_corr), 
    .P_OUT(delay_loop_out)
    );


// ##########################################################################
// ####################### Output feedback signal ###########################

// **** Perform overflow control ****
//
// The mac output now has its factor 4096 removed.  The remaining 35 bits
// are checked and saturated at full-scale dac output.  

// Adding factor 48'd2048 is equivelent to 0.5 decimal to round rather 
// than truncate, and this is done in the delay loop prior

wire [35:0] fbck_sgnl1;
//reg [12:0] fbck_sgnl;
assign fbck_sgnl1 = fb_mac_out[47:12];

// Saturate the signal at 13 bits
reg [12:0] fbck_sgnl2;
always @(fbck_sgnl1) begin
	fbck_sgnl2 = 0; //Prevent latch
	if (fbck_sgnl1[35]) begin
		// -ve.
		if ( (~fbck_sgnl1[34:12]) == 23'b0) begin
			fbck_sgnl2 = fbck_sgnl1[12:0];
		end else begin
			fbck_sgnl2 = 13'b1000000000000;
		end
	end else begin
		// +ve.
		if ( (fbck_sgnl1[34:12]) == 23'b0) begin
			fbck_sgnl2 = fbck_sgnl1[12:0];
		end else begin
			fbck_sgnl2 = 13'b0111111111111;
		end	
	end
end


// **** Form final dac code for amplifier drive ****
//
/*always @(*)
	if (~store_strb || ~feedbck_en) fbck_sgnl = 13'd0;
	else if (constant_dac_en) fbck_sgnl = const_dac_out;
	else if (fb_mac_out[47]) //-ve
		if (fb_mac_out[46:24] == 23'd0) fbck_sgnl = fb_mac_out[24:12];
		else fbck_sgnl = 13'b1000000000000;
	else //+ve
		if (fb_mac_out[46:24] == 23'd0) fbck_sgnl = fb_mac_out[24:12];
		else fbck_sgnl = 13'b0111111111111;*/

/*always @(*)
	if (~store_strb || ~feedbck_en) fbck_sgnl = 13'd0;
	else if (const_dac_en) fbck_sgnl = const_dac_out;
	else if ((fb_mac_out[47:24] == {1'b1,23'd0}) || (~fb_mac_out[47:24] == {1'b1,23'd0})) fbck_sgnl = fb_mac_out[24:12];
	else if (fb_mac_out[47]) fbck_sgnl = 13'b1000000000000; //-ve saturation
	else fbck_sgnl = 13'b0111111111111; //+ve saturation*/
		
/*always @(*) begin
	if (~store_strb) fbck_sgnl = 13'd0;
	else if (~feedbck_en) 
		(* full_case, parallel_case *)
		case (bunch_count)
			2'd0 : fbck_sgnl = b2_offset_d;
			2'd1 : fbck_sgnl = b3_offset_d;
			default: fbck_sgnl = 13'd0;
			endcase
	else if (const_dac_en) fbck_sgnl = const_dac_out;
	else if ((fb_mac_out[47:24] == {1'b1,23'd0}) || (~fb_mac_out[47:24] == {1'b1,23'd0})) fbck_sgnl = fb_mac_out[24:12];
	//ABOVE LINE IS WRONG!!!!
	else if (fb_mac_out[47]) fbck_sgnl = 13'b1000000000000; //-ve saturation
	else fbck_sgnl = 13'b0111111111111; //+ve saturation
end*/

// Multiplex to allow constant output and again to allow zero output
//wire [12:0] fbck_sgnl3, fbck_sgnl4;
wire [12:0] fbck_sgnl3;
reg [12:0] fbck_sgnl4;

assign fbck_sgnl3 = const_dac_en ? const_dac_out : fbck_sgnl2;

wire zero_output;
assign zero_output = (~store_strb | ~feedbck_en);
//assign fbck_sgnl4 = zero_output ? 13'b0 : fbck_sgnl3;

// Register when strobe reaches e register
always @(posedge clk) begin
   fbck_sgnl4 <= (zero_output) ? 13'b0 : fbck_sgnl3;
	//dac_en <= p3_bunch_strb_f | p3_bunch_strb_g;
	dac_en <= p3_bunch_strb_g | p3_bunch_strb_h;
	//if (p3_bunch_strb_e) amp_drive <= fbck_sgnl4;
	if (p3_bunch_strb_f) amp_drive <= fbck_sgnl4;
	else amp_drive <= amp_drive;
	end


// **** Produce DAC clock using the bunch strobe chain ****
// 
// OR togther the two last registers in the chain
//always @(posedge clk) dac_en <= p3_bunch_strb_f | p3_bunch_strb_g;
	// synthesis attribute shreg_extract of dac_en is "no";

			

endmodule
	 
	 
	 
	 
	 
// ########### This code is for an independent feedback loop 22 March 2010 #############
//module data_processing(
//    input clk,
//	 input rst,
//	 input slow_clk,
//    input [12:0] sigma_in,
//    input [12:0] delta_in,
//	 input store_strb,
//	 input bunch_strb,
//	 input feedbck_en,
//	 input delay_loop_en,
//	 input const_dac_en,
//	 input [12:0] const_dac_out,
//	 input [6:0] lut_dinb,
//	 input [14:0] lut_addrb,
//	 input lut_web,
//	 input [12:0] b2_offset,
//	 input [12:0] b3_offset,
//	 input [5:0] fir_k1,
//	 output [6:0] lut_doutb,
//    output reg [12:0] amp_drive,
//	 output reg dac_en
//    );
//// synthesis attribute dontkeep of amp_drive is "true"; 
//	 
//// **** Synchronise the bunch offsets and weight factors ****
//reg [12:0] b2_offset_a, b2_offset_b, b3_offset_a, b3_offset_b;
//reg [12:0] b2_offset_c, b2_offset_d, b3_offset_c, b3_offset_d;
//reg [11:0] fir_k1_a, fir_k1_b;
//always @(posedge clk or posedge rst) begin
//	if (rst) begin
//		 b2_offset_a <= 0;
//		 b3_offset_a <= 0;
//		 b2_offset_b <= 0;
//		 b3_offset_b <= 0;
//		 b2_offset_c <= 0;
//		 b3_offset_c <= 0;
//		 b2_offset_d <= 0;
//		 b3_offset_d <= 0;
//		 fir_k1_a	 <= 0;
//		 fir_k1_b	 <= 0;
//	end else begin
//		 b2_offset_a <= b2_offset;
//		 b3_offset_a <= b3_offset;
//		 b2_offset_b <= b2_offset_a;
//		 b3_offset_b <= b3_offset_a;
//		 b2_offset_c <= b2_offset_b;
//		 b3_offset_c <= b3_offset_b;
//		 b2_offset_d <= b2_offset_c;
//		 b3_offset_d <= b3_offset_c;
//		 fir_k1_a	 <= fir_k1;
//		 fir_k1_b	 <= fir_k1_a;
//	end
//end
//	 
//	 
//// **** Strobe chain ****
////
//// The incoming bunch strobes are passed through a register chain, allowing
//// various enables to be set at the correct time.  Finally they are used 
//// to clock the DAC	 
//wire zero_strb;
//reg bunch_strb_a, bunch_strb_b, bunch_strb_c, bunch_strb_d, bunch_strb_e, bunch_strb_f, bunch_strb_g, bunch_strb_h;
//always @(posedge clk or posedge rst) begin
//	if (rst) begin
//		bunch_strb_a <= 0;
//		bunch_strb_b <= 0;
//		bunch_strb_c <= 0;
//		bunch_strb_d <= 0;
//		bunch_strb_e <= 0;
//		bunch_strb_f <= 0;
//		bunch_strb_g <= 0;
//		bunch_strb_h <= 0;
//	end else begin
//		bunch_strb_a <= bunch_strb | zero_strb;
//		// synthesis attribute shreg_extract of bunch_strb_a is "no";
//		bunch_strb_b <= bunch_strb_a;
//		// synthesis attribute shreg_extract of bunch_strb_b is "no";
//		bunch_strb_c <= bunch_strb_b;
//		// synthesis attribute shreg_extract of bunch_strb_c is "no";
//		bunch_strb_d <= bunch_strb_c;
//		// synthesis attribute shreg_extract of bunch_strb_d is "no";
//		bunch_strb_e <= bunch_strb_d;
//		// synthesis attribute shreg_extract of bunch_strb_e is "no";
//		bunch_strb_f <= bunch_strb_e;
//		// synthesis attribute shreg_extract of bunch_strb_f is "no";
//		bunch_strb_g <= bunch_strb_f;
//		// synthesis attribute shreg_extract of bunch_strb_g is "no";
//		bunch_strb_h <= bunch_strb_g;
//		// synthesis attribute shreg_extract of bunch_strb_h is "no";
//	end
//end
//
//
//// **** Monitor strobes ****
////
//// Detect store_strb falling edge and 'inject' a zero_strb into the bunch_strb
//// chain to zero the dac outside of active ring clock cycle
//reg store_strb_a, store_strb_b;
//always@(posedge clk or posedge rst) begin
//	if (rst) begin
//		store_strb_a <= 0;
//		store_strb_b <= 0;
//	end else begin
//		store_strb_a <= store_strb;
//		store_strb_b <= store_strb_a;
//	end
//end
//assign zero_strb = ~store_strb_a & store_strb_b;
//
//// Count bunch strobes
//reg [1:0] bunch_count;
//always @(posedge clk or posedge rst) begin
//	if (rst) begin
//		bunch_count <= 0;
//	end else begin
//		if (zero_strb) begin
//			bunch_count <= 0;
//		end else begin
//			if (bunch_strb_g & store_strb) begin
//				bunch_count <= bunch_count + 1;
//			end
//		end
//	end
//end
//	 
//
//// **** Instantiation of Gain LUT ****
////
//// For charge normalisation, load 4096*Gain*(1/addra)
//// For non-charge norm, load 4096*Gain for all locations
//// The MS 7 bits of data port a are unused
//wire [27:0] lut_temp;
//wire [20:0] lut_out;
//assign lut_out = lut_temp[20:0];
//ram_13x28_15x7 gain_lut (
//	.clka(clk),
//	.dina(), // Bus [27 : 0] 
//	.addra(sigma_in), // Bus [12 : 0] 
//	.wea(1'b0), // Bus [0 : 0] 
//	.douta(lut_temp), // Bus [27 : 0] 
//	.clkb(slow_clk),
//	.dinb(lut_dinb), // Bus [6 : 0] 
//	.addrb(lut_addrb), // Bus [14 : 0] 
//	.web(lut_web), // Bus [0 : 0] 
//	.doutb(lut_doutb)); // Bus [6 : 0] 
//	
//// Register LUT output
//reg  [20:0] lut_reg;
// // synthesis attribute dontkeep of lut_reg is "true"; 
//always @(posedge clk) lut_reg <= lut_out;
//
//
//// **** Pipeline the difference signal during LUT operation ****
////
//reg [12:0] delta_a, delta_b;
// // synthesis attribute dontkeep of delta_a is "true"; 
// // synthesis attribute dontkeep of delta_b is "true"; 
//always @(posedge clk or posedge rst) begin
//	if (rst) begin
//		delta_a <= 0;
//		delta_b <= 0;
//	end else begin
//		delta_a <= delta_in;
//		// synthesis attribute shreg_extract of delta_a is "no";
//		delta_b <= delta_a;
//		// synthesis attribute shreg_extract of delta_b is "no";
//	end
//end
//
//
//// **** Instantiate main multiplier/adder ****
//// 
//// This multiplier/adder forms the G*D/S from the LUT output and difference,
//// then adds in the value of the delay loop.  It's output is 48-bit and goes
//// on to form the feedback signal
//// Inputs 21-bit and 13-bit, plus a 48-bit carry in to the adder.  3 cycle latency
//
//wire [47:0] delay_loop_out;
//wire [47:0] mac_out;
//FB_MULT_ADD feedback_mult_add (
//    .A_IN(lut_reg), 
//    .B_IN(delta_b), 
//    .CEMULTCARRYIN_IN(1'b0), 
//    .CLK_IN(clk), 
//    //.C_IN(delay_loop_out + 48'd2048), // 2048 is == 0.5 for rounding
//	 .C_IN(delay_loop_out),
//    .P_OUT(mac_out)
//   );
//
//	
//// **** Instantiate the FIR multiplier ****
////
//// The FIR requires G*D/S to be stored without the delay loop addition
//// Since multipliers reqire the adder (so the multiplication result from the
//// feedback multiplier/adder can't be pulled out before the delay loop is added),
//// forming G*D/S in parallel means latency can be kept to a minimum in the feedback
//// chain
////
//// This multiplier as for the feedback muli/add but without the carry in.
//
//wire [35:0] fir_mult_out;
//FIR_MULT fir_multiplier (
//    .A_IN(lut_reg), 
//    .B_IN(delta_b), 
//    .CEMULTCARRYIN_IN(1'b0), 
//    .CLK_IN(clk), 
//	 .CARRYIN_IN(0), 
//    .P_OUT(fir_mult_out)
//    );
//
//
//// **** Store delay loop and FIR 1st tap in their registers ****
////
//// Register the fb multiplier/adder output in the delay loop and FIR multiplier
//// output in the fir_tap1 register.  Do so when bunch strobe is at stage 'c' of its
//// pipeline
////
//// Reset registers on zero_strobe
////
//// Note the FIR1 is divided by 64.  This factor returns after multiplication,
//// as k1 is a fractional value scaled to 0-63.  
////
//// Add 36'd32 (equiv. to 0.5 decimal) to FIR1 before division to round rather than truncate
////
//// Remove the rounding 2048 from mac out before storing to avoid compounding it
//// over succesive delay loop cycles 
//reg [47:0] delay_loop;
//reg [29:0] fir_tap1;
////wire [35:0] fir_tap1_round;
////assign fir_tap1_round = 36'd32 + fir_mult_out;
//
//always @(posedge clk or posedge rst) begin
//	if (rst) begin
//		delay_loop <= 0;
//		fir_tap1   <= 0;
//	end else begin
//		if (zero_strb) begin
//			delay_loop <= 48'b0;
//			fir_tap1   <= 30'b0;
//		end else begin
//			if (bunch_strb_e & store_strb) begin
//				if (delay_loop_en) begin
//					//delay_loop <= (mac_out + (-48'd2048));
//					delay_loop <= mac_out;
//				end else begin
//					delay_loop <= 48'b0;
//				end
//				fir_tap1 <= fir_mult_out[35:6];
//			end
//		end
//	end
//end
//
//
//// **** Add the banana correction to the output of the delay loop register ****
////
//// Add a constant to the delay loop depending on the bunch number.  The constant
//// is left shifted by 12 to bring it up to the delay loop scale factor
//
//reg [47:0] delay_loop_banana;
////Additional register in delay loop for timing
//reg [47:0] delay_loop_banana_a;
//always @(posedge clk or posedge rst) begin
//	if (rst) begin
//		delay_loop_banana   <= 0;
//		delay_loop_banana_a <= 0;
//	end else begin
//		delay_loop_banana_a <= delay_loop_banana;
//		case (bunch_count)
//			2'd0: begin
//				if (b2_offset_b[12]) begin
//					delay_loop_banana <= delay_loop + {23'd8388607, b2_offset_d, 12'b0};
//				end else begin
//					delay_loop_banana <= delay_loop + {23'd0, b2_offset_d, 12'b0};
//				end
//			end
//			2'd1:	begin
//				if (b3_offset_b[12]) begin
//					delay_loop_banana <= delay_loop + {23'd8388607, b3_offset_d, 12'b0};
//				end else begin
//					delay_loop_banana <= delay_loop + {23'd0, b3_offset_d, 12'b0};
//				end
//			end
//		endcase
//	end
//end
//
//// **** Instantiate the delay loop multiplier / adder ****
////
//// This mult/add resides inside the delay loop.  It multiplies the stored FIR tap1
//// value with the weighting factor k1, then sums the result with the contents
//// of the delay loop register (which has already been summed with the banana
//// correction).  The output of this mult/add is the final delay loop output
////
//// The FIR input is capped at the maximum 30-bits.  The k1 is 6-bit, a fractional
//// value scaled by 64 (+ve, must sign extend).  Delay loop carry in is 48-bit.  3 cycle latency
//
//DELAY_MULT_ADD delay_loop_mult_add (
//    .A_IN(fir_tap1), 
//    .B_IN({1'b0, fir_k1_b}), 
//    .CEMULTCARRYIN_IN(1'b0), 
//    .CLK_IN(clk), 
//    .C_IN(delay_loop_banana_a), 
//    .P_OUT(delay_loop_out)
//    );
// 
//
//// **** Perform overflow control ****
////
//// The mac output now has its factor 4096 removed.  The remaining 35 bits
//// are checked and saturated at full-scale dac output.  
//
//// Adding factor 48'd2048 is equivelent to 0.5 decimal to round rather 
//// than truncate, and this is done in the delay loop prior
//
//wire [35:0] fbck_sgnl1;
//assign fbck_sgnl1 = mac_out[47:12];
//
//// Saturate the signal at 13 bits
//reg [12:0] fbck_sgnl2;
//always @(fbck_sgnl1) begin
//	fbck_sgnl2 = 0; //Prevent latch
//	if (fbck_sgnl1[35]) begin
//		// -ve.
//		if ( (~fbck_sgnl1[34:12]) == 23'b0) begin
//			fbck_sgnl2 = fbck_sgnl1[12:0];
//		end else begin
//			fbck_sgnl2 = 13'b1000000000000;
//		end
//	end else begin
//		// +ve.
//		if ( (fbck_sgnl1[34:12]) == 23'b0) begin
//			fbck_sgnl2 = fbck_sgnl1[12:0];
//		end else begin
//			fbck_sgnl2 = 13'b0111111111111;
//		end	
//	end
//end
////wire [12:0] fbck_sgnl2;
////assign fbck_sgnl2 = fbck_sgnl1[12:0];
//
//// **** Form final dac code for amplifier drive ****
////
//// Multiplex to allow constant output and again to allow zero output
//wire [12:0] fbck_sgnl3, fbck_sgnl4;
//assign fbck_sgnl3 = const_dac_en ? const_dac_out : fbck_sgnl2;
//
//wire zero_output;
//assign zero_output = (~store_strb | ~feedbck_en);
//assign fbck_sgnl4 = zero_output ? 13'b0 : fbck_sgnl3;
//
//// Register when strobe reaches d register
//always @(posedge clk) if (bunch_strb_e) amp_drive <= fbck_sgnl4;
//
//
//// **** Produce DAC clock using the bunch strobe chain ****
//// 
//// OR togther the two last registers in the chain
//always @(posedge clk) dac_en <= bunch_strb_f | bunch_strb_g;
//	// synthesis attribute shreg_extract of dac_en is "no";
//
//			
//
//endmodule
//	 
	 
	 
