`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:24:59 10/24/2009 
// Design Name: 
// Module Name:    FONT5_9Chan 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
//
// Note: the XIL_PAR_ALLOW_LVDS_LOC_OVERRIDE environment variable was set to
// true to allow MAP to complete.  It complained that about 5 of the p1_xdif
// data bits were connected backwards to the differential inputs, and would
// have the wrong polarity.  The env. var. overode this error
//
//////////////////////////////////////////////////////////////////////////////////
module FONT5_9Chan(
		clk357_n,
		clk357_p,
		clk40_s,
		p1_xdif_drdy_n,
		p1_ydif_drdy_n,
		p1_sum_drdy_n,
		p1_xdif_drdy_p,
		p1_ydif_drdy_p,
		p1_sum_drdy_p,
		p1_xdif_datain_n,
		p1_ydif_datain_n,
		p1_sum_datain_n,
		p1_xdif_datain_p,
		p1_ydif_datain_p,
		p1_sum_datain_p,		
		p2_xdif_drdy_n,
		p2_ydif_drdy_n,
		p2_sum_drdy_n,
		p2_xdif_drdy_p,
		p2_ydif_drdy_p,
		p2_sum_drdy_p,
		p2_xdif_datain_n,
		p2_ydif_datain_n,
		p2_sum_datain_n,
		p2_xdif_datain_p,
		p2_ydif_datain_p,
		p2_sum_datain_p,		
		p3_xdif_drdy_n,
		p3_ydif_drdy_n,
		p3_sum_drdy_n,
		p3_xdif_drdy_p,
		p3_ydif_drdy_p,
		p3_sum_drdy_p,
		p3_xdif_datain_n,
		p3_ydif_datain_n,
		p3_sum_datain_n,
		p3_xdif_datain_p,
		p3_ydif_datain_p,
		p3_sum_datain_p,			
		rs232_in,		
		//amp_trig,
		//amp_trig2,
		auxOutA1,
		auxOutA2,
		auxOutB1,
		auxOutB2,
		adc_powerdown,
		p1_adc_clk_n,
		p1_adc_clk_p,
		p2_adc_clk_n,
		p2_adc_clk_p,
		p3_adc_clk_n,
		p3_adc_clk_p,
		dac1_out,
		dac1_clk,	
		dac2_out,
		dac2_clk,
//		dac3_out,
//		dac3_clk,
//		dac4_out,
//		dac4_clk,
		rs232_out,
		led0_out,
		led1_out,
		led2_out,
		trim_cs_ld,
		trim_sck,
		trim_sdi,
		diginput1A,
		diginput1B,
		diginput1,
		diginput2A,
		diginput2B,
		diginput2,
		FONT5_detect,
		//diginput2_loopback
		DirIOB,
		auxInA,
		auxOutC
    );


	 
input clk357_n;
input clk357_p;
input clk40_s;


// P1 ADC input signals
input 			p1_xdif_drdy_n;
input 			p1_ydif_drdy_n;
input 			p1_sum_drdy_n;
input 			p1_xdif_drdy_p;
input 			p1_ydif_drdy_p;
input 			p1_sum_drdy_p;
input [12:0]	p1_xdif_datain_n;
input [12:0]	p1_ydif_datain_n;
input [12:0]	p1_sum_datain_n;
input [12:0]	p1_xdif_datain_p;
input [12:0]	p1_ydif_datain_p;
input [12:0]	p1_sum_datain_p;

// p2 ADC input signals
input 			p2_xdif_drdy_n;
input 			p2_ydif_drdy_n;
input 			p2_sum_drdy_n;
input 			p2_xdif_drdy_p;
input 			p2_ydif_drdy_p;
input 			p2_sum_drdy_p;
input [12:0]	p2_xdif_datain_n;
input [12:0]	p2_ydif_datain_n;
input [12:0]	p2_sum_datain_n;
input [12:0]	p2_xdif_datain_p;
input [12:0]	p2_ydif_datain_p;
input [12:0]	p2_sum_datain_p;

// p3 ADC input signals
input 			p3_xdif_drdy_n;
input 			p3_ydif_drdy_n;
input 			p3_sum_drdy_n;
input 			p3_xdif_drdy_p;
input 			p3_ydif_drdy_p;
input 			p3_sum_drdy_p;
input [12:0]	p3_xdif_datain_n;
input [12:0]	p3_ydif_datain_n;
input [12:0]	p3_sum_datain_n;
input [12:0]	p3_xdif_datain_p;
input [12:0]	p3_ydif_datain_p;
input [12:0]	p3_sum_datain_p;
		
input rs232_in;

//output reg amp_trig;
//output reg amp_trig2;
output auxOutA1, auxOutB1;
output auxOutA2, auxOutB2;
output adc_powerdown;
output p1_adc_clk_n;
output p1_adc_clk_p;
output p2_adc_clk_n;
output p2_adc_clk_p;
output p3_adc_clk_n;
output p3_adc_clk_p;

//output [12:0]	dac1_out;
//output	dac1_clk;
//output [12:0] dac2_out;
//output	dac2_clk;
(* IOB = "TRUE" *) output reg signed [12:0]	dac1_out;
(* IOB = "TRUE" *) output reg	dac1_clk;
(* IOB = "TRUE" *) output reg signed [12:0]	dac2_out;
(* IOB = "TRUE" *) output reg	dac2_clk;
//output [12:0] 	dac3_out;
//output			dac3_clk;
//output [12:0] 	dac4_out;
//output			dac4_clk;

output rs232_out;
output led0_out;
output led1_out;
output led2_out;

output trim_cs_ld;
output trim_sck;
output trim_sdi;

output diginput1A;			//Ring clock threshold
output diginput1B;
output diginput2A;			//Trigger threshold
output diginput2B;
input  diginput1;				//Ring clock input
input  diginput2;				//Trigger input
//output diginput2_loopback; //For monitoring digital input
(* PULLUP = "TRUE" *) input FONT5_detect;
output DirIOB;
input auxInA;
output auxOutC;

//parameter FONT5_detect = 1'b0; //hardcode of automatic variant detection

//`include "definitions.vh"

//Detect board variant and configure AUX_OUTS
wire amp_trig, amp_trig2;
//reg amp_trig, amp_trig2;
//wire auxOutA, auxOutB;
//assign auxOutA1 = (FONT5_detect) ? amp_trig : 1'bz;
//assign auxOutB1 = (FONT5_detect) ? amp_trig2 : 1'bz;
//assign auxOutA2 = (FONT5_detect) ? 1'bz : amp_trig;
//assign auxOutB2 = (FONT5_detect) ? 1'bz : amp_trig2;
//assign auxOutA2 = amp_trig;
//assign auxOutB2 = amp_trig2;


// %%%%%%%%%%%   WIRE DIGITAL INPUT TO TRIGGER LOOPBACK   %%%%%%%%%%%%%%%%%%
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
wire trig;
assign trig = diginput2;
//assign diginput2_loopback = diginput2;


// %%%%%%%%%%%%%%%   40MHz INPUT - 200MHz gen - IDELAYCTRL  %%%%%%%%%%%%%%%%
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

// **** Reset controller ****
// Deals with resetting DCM, idelayctrl and iodelay elements
wire clk40_ibufg;
wire full_rst_trig;
wire dcm200_rst;
wire idelay_rst;
reset_ctrl reset_ctrl1(
	.clk40(clk40_ibufg),
	.idelay_rst_trig(1'b0),				//Always perform a full DCM reset
	.full_rst_trig(full_rst_trig),
	.dcm_rst(dcm200_rst),
	.idelay_rst(idelay_rst)
);

// **** Input buffer for 40Mz on-board oscillator ****
// Note the clk40_ibufg clocks the reset logic since it is present during DCM reset,
// and the UART & Decoder for the same reason
IBUFG #(
	.IOSTANDARD("DEFAULT")
) IBUFG_CLK40 (
	.O(clk40_ibufg), 
	.I(clk40_s) 
);

// **** Input buffer for 2.16MHz ring clock ****
`ifndef DIGIN_UART_RX
	wire clk2_16_tmp;
	IBUFG #(
		.IOSTANDARD("DEFAULT")
	) IBUFG_RINGCLK (
		.O(clk2_16_tmp), 
		.I(diginput1) 
	);
`endif

//reg clk_align;
wire clk357_delayed;

//always @(posedge clk2_16_tmp) clk_align <= (clk357_delayed) ? 1 : 0;


// **** DCM to generate 200MHz reference for IDELAYCTRL ****
// clk40 is taken from clk0 output
wire clk200_dcm; //, clk140_dcm;
wire clk200;
wire clk40_dcm;
wire clk40;
wire dcm200_locked;//, dcm140_locked;
DCM_ADV #(
	.CLK_FEEDBACK("1X"),
	.CLKDV_DIVIDE(2.0),
	.CLKFX_DIVIDE(1),
	.CLKFX_MULTIPLY(5),
	.CLKIN_DIVIDE_BY_2("FALSE"),
	.CLKIN_PERIOD(25.000),
	.CLKOUT_PHASE_SHIFT("NONE"),
	.DCM_AUTOCALIBRATION("TRUE"),
	.DCM_PERFORMANCE_MODE("MAX_SPEED"),
	.DESKEW_ADJUST("SYSTEM_SYNCHRONOUS"),
	.DFS_FREQUENCY_MODE("HIGH"),
	.DLL_FREQUENCY_MODE("LOW"),
	.DUTY_CYCLE_CORRECTION("TRUE"),
	.FACTORY_JF(16'hF0F0),
	.PHASE_SHIFT(0),
	.STARTUP_WAIT("FALSE"),
	.SIM_DEVICE("VIRTEX5")
) DCM_ADV_DCM200 (
	.CLKFB(clk40), 
	.CLKIN(clk40_ibufg), 
	.DADDR(7'b0), 
	.DCLK(0), 
	.DEN(0), 
	.DI(16'b0), 
	.DWE(0), 
	.PSCLK(0), 
	.PSEN(0), 
	.PSINCDEC(0), 
	.RST(dcm200_rst), 
	.CLKDV(), 
	.CLKFX(clk200_dcm), 
	.CLKFX180(), 
	.CLK0(clk40_dcm), 
	.CLK2X(), 
	.CLK2X180(), 
	.CLK90(), 
	.CLK180(), 
	.CLK270(), 
	.DO(), 
	.DRDY(), 
	.LOCKED(dcm200_locked), 
	.PSDONE()
);

/*
   // DCM_BASE: Base Digital Clock Manager Circuit
   //           Virtex-4/5
   // Xilinx HDL Language Template, version 10.1.3

   DCM_BASE #(
      .CLKDV_DIVIDE(2.0), // Divide by: 1.5,2.0,2.5,3.0,3.5,4.0,4.5,5.0,5.5,6.0,6.5
                          //   7.0,7.5,8.0,9.0,10.0,11.0,12.0,13.0,14.0,15.0 or 16.0
      .CLKFX_DIVIDE(2), // Can be any integer from 1 to 32
      .CLKFX_MULTIPLY(7), // Can be any integer from 2 to 32
      .CLKIN_DIVIDE_BY_2("FALSE"), // TRUE/FALSE to enable CLKIN divide by two feature
      .CLKIN_PERIOD(25.0), // Specify period of input clock in ns from 1.25 to 1000.00
      .CLKOUT_PHASE_SHIFT("NONE"), // Specify phase shift mode of NONE or FIXED
      .CLK_FEEDBACK("1X"), // Specify clock feedback of NONE, 1X or 2X
      .DCM_PERFORMANCE_MODE("MAX_SPEED"), // Can be MAX_SPEED or MAX_RANGE
      .DESKEW_ADJUST("SYSTEM_SYNCHRONOUS"), // SOURCE_SYNCHRONOUS, SYSTEM_SYNCHRONOUS or
                                            //   an integer from 0 to 15
      .DFS_FREQUENCY_MODE("LOW"), // LOW or HIGH frequency mode for frequency synthesis
      .DLL_FREQUENCY_MODE("LOW"), // LOW, HIGH, or HIGH_SER frequency mode for DLL
      .DUTY_CYCLE_CORRECTION("TRUE"), // Duty cycle correction, TRUE or FALSE
      .FACTORY_JF(16'hf0f0), // FACTORY JF value suggested to be set to 16'hf0f0
      .PHASE_SHIFT(0), // Amount of fixed phase shift from -255 to 1023
      .STARTUP_WAIT("FALSE") // Delay configuration DONE until DCM LOCK, TRUE/FALSE
   ) DCM_140 (
      .CLK0(clk40_dcm),         // 0 degree DCM CLK output
      .CLK180(),     // 180 degree DCM CLK output
      .CLK270(),     // 270 degree DCM CLK output
      .CLK2X(),       // 2X DCM CLK output
      .CLK2X180(), // 2X, 180 degree DCM CLK out
      .CLK90(),       // 90 degree DCM CLK output
      .CLKDV(),       // Divided DCM CLK out (CLKDV_DIVIDE)
      .CLKFX(clk140_dcm),       // DCM CLK synthesis out (M/D)
      .CLKFX180(), // 180 degree CLK synthesis out
      .LOCKED(dcm140_locked),     // DCM LOCK status output
      .CLKFB(clk40),       // DCM clock feedback
      .CLKIN(clk40_ibufg),       // Clock input (from IBUFG, BUFG or DCM)
      .RST(dcm200_rst)            // DCM asynchronous reset input
   );

   // End of DCM_BASE_inst instantiation
					
   // DCM_BASE: Base Digital Clock Manager Circuit
   //           Virtex-4/5
   // Xilinx HDL Language Template, version 10.1.3

   DCM_BASE #(
      .CLKDV_DIVIDE(2.0), // Divide by: 1.5,2.0,2.5,3.0,3.5,4.0,4.5,5.0,5.5,6.0,6.5
                          //   7.0,7.5,8.0,9.0,10.0,11.0,12.0,13.0,14.0,15.0 or 16.0
      .CLKFX_DIVIDE(7), // Can be any integer from 1 to 32
      .CLKFX_MULTIPLY(10), // Can be any integer from 2 to 32
      .CLKIN_DIVIDE_BY_2("FALSE"), // TRUE/FALSE to enable CLKIN divide by two feature
      .CLKIN_PERIOD(7.14), // Specify period of input clock in ns from 1.25 to 1000.00
      .CLKOUT_PHASE_SHIFT("NONE"), // Specify phase shift mode of NONE or FIXED
      .CLK_FEEDBACK("1X"), // Specify clock feedback of NONE, 1X or 2X
      .DCM_PERFORMANCE_MODE("MAX_SPEED"), // Can be MAX_SPEED or MAX_RANGE
      .DESKEW_ADJUST("SYSTEM_SYNCHRONOUS"), // SOURCE_SYNCHRONOUS, SYSTEM_SYNCHRONOUS or
                                            //   an integer from 0 to 15
      .DFS_FREQUENCY_MODE("HIGH"), // LOW or HIGH frequency mode for frequency synthesis
      .DLL_FREQUENCY_MODE("LOW"), // LOW, HIGH, or HIGH_SER frequency mode for DLL
      .DUTY_CYCLE_CORRECTION("TRUE"), // Duty cycle correction, TRUE or FALSE
      .FACTORY_JF(16'hf0f0), // FACTORY JF value suggested to be set to 16'hf0f0
      .PHASE_SHIFT(0), // Amount of fixed phase shift from -255 to 1023
      .STARTUP_WAIT("FALSE") // Delay configuration DONE until DCM LOCK, TRUE/FALSE
   ) DCM_200 (
      .CLK0(clk140_fb),         // 0 degree DCM CLK output
      .CLK180(),     // 180 degree DCM CLK output
      .CLK270(),     // 270 degree DCM CLK output
      .CLK2X(),       // 2X DCM CLK output
      .CLK2X180(), // 2X, 180 degree DCM CLK out
      .CLK90(),       // 90 degree DCM CLK output
      .CLKDV(),       // Divided DCM CLK out (CLKDV_DIVIDE)
      .CLKFX(clk200_dcm),       // DCM CLK synthesis out (M/D)
      .CLKFX180(), // 180 degree CLK synthesis out
      .LOCKED(dcm200_locked),     // DCM LOCK status output
      .CLKFB(clk140_fb),       // DCM clock feedback
      .CLKIN(clk140_dcm),       // Clock input (from IBUFG, BUFG or DCM)
      .RST(dcm200_rst)            // DCM asynchronous reset input
   );

*/

// **** Global clock buffer for 40MHz distribution ****
// Note also used for feedback into DCM

wire store_strb;
reg clk_blk;
//wire slow_clk_gate_en;
//
BUFGCE BUFGCE_DCM_CLK40 (
	.O(clk40),
	.CE(~clk_blk),
	//.CE(~clk_blk && ~slow_clk_gate_en),
//	.CE(~store_strb),
	.I(clk40_dcm)
);
//
/*
BUFG BUFG_DCM_CLK40 (
	.O(clk40),
	.I(clk40_dcm)
);
*/
// **** Global clock buffer for 200MHz ****
BUFG BUFG_DCM_CLK200 (
	.O(clk200),
	.I(clk200_dcm)
);

// **** IDELAYCTRL instantiation ****
// Single instantiation template for all IODELAYS
wire idelayctrl_rdy;
IDELAYCTRL IDELAYCTRL1 (
	.RDY(idelayctrl_rdy),		
	.REFCLK(clk200),
	.RST(~dcm200_locked)
);

//`include "IDELAYCTRL_insts.v"

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%   357MHz INPUT   %%%%%%%%%%%%%%%%%%%%%%%%%%%%
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

// **** Differential input buffer for the master 357MHz clock ****
wire clk357_ibufg;
IBUFGDS #(
	.DIFF_TERM("TRUE"),
	.IOSTANDARD("DEFAULT")
) IBUFGDS_CLK357 (
	.O(clk357_ibufg), 
	.I(clk357_p),
	.IB(clk357_n)
);

`ifdef CLK357_PLL
		// **** PLL for master 357MHz clock ****
		// Configured as a jitter filter (low bandwidth, internal feedback)
		// VCO frequency 2*357MHz
		// Output via global clock buffer as required
		wire clk357_pll;
		wire clk357_bufg;
		wire pll_clk357_fb;
		wire pll_clk357_locked;
		PLL_BASE #(
			.BANDWIDTH("LOW"), //Better jitter filter performance (V5 user guide)
			.CLKFBOUT_MULT(2),
			.CLKFBOUT_PHASE(0.0),
			.CLKIN_PERIOD(2.8), // ns
			.CLKOUT0_DIVIDE(2),
			.CLKOUT0_DUTY_CYCLE(0.5),
			.CLKOUT0_PHASE(0.0), 
			.CLKOUT1_DIVIDE(1), 
			.CLKOUT1_DUTY_CYCLE(0.5), 
			.CLKOUT1_PHASE(0.0),
			.CLKOUT2_DIVIDE(1), 
			.CLKOUT2_DUTY_CYCLE(0.5), 
			.CLKOUT2_PHASE(0.0),
			.CLKOUT3_DIVIDE(1),
			.CLKOUT3_DUTY_CYCLE(0.5),
			.CLKOUT3_PHASE(0.0), 
			.CLKOUT4_DIVIDE(1),
			.CLKOUT4_DUTY_CYCLE(0.5),
			.CLKOUT4_PHASE(0.0),
			.CLKOUT5_DIVIDE(1),
			.CLKOUT5_DUTY_CYCLE(0.5),
			.CLKOUT5_PHASE(0.0),
			.COMPENSATION("SYSTEM_SYNCHRONOUS"),
			.DIVCLK_DIVIDE(1),
			.REF_JITTER(0.100) // Input reference jitter *LEFT AT DEFAULT*
		) PLL_CLK357 (
			.CLKFBOUT(pll_clk357_fb), 	// Internal feedback signal
			.CLKOUT0(clk357_pll),
			.CLKOUT1(),
			.CLKOUT2(),
			.CLKOUT3(),
			.CLKOUT4(),
			.CLKOUT5(),
			.LOCKED(pll_clk357_locked),
			.CLKFBIN(pll_clk357_fb), 	// Internal feedback signal
			.CLKIN(clk357_ibufg),
			.RST(dcm200_rst)
		);

		BUFG BUFG_PLL_CLK357 (
			.O(clk357_bufg),
			.I(clk357_pll)
		);
`endif

// **** IDELAY for the master 357MHz clock ****
//wire clk357_delayed;
wire clk357_idelay_ce;
wire clk357_idelay_rst;
IODELAY # (
	.DELAY_SRC("DATAIN"),
	.HIGH_PERFORMANCE_MODE("TRUE"),
	.IDELAY_TYPE("VARIABLE"),
	.IDELAY_VALUE(0),
	.ODELAY_VALUE(0),
	.REFCLK_FREQUENCY(200.0),
	.SIGNAL_PATTERN("CLOCK")
) IODELAY_MASTER_CLK357 (
	.DATAOUT(clk357_delayed), 
	.C(clk40),
	.CE(clk357_idelay_ce), 
	`ifdef CLK357_PLL
		.DATAIN(clk357_bufg),	
	`else
		.DATAIN(clk357_ibufg),
	`endif
	.IDATAIN(1'b0),	// Must be grounded
	.INC(1'b1), 		// Always increment
	.ODATAIN(1'b0),	// Must be grounded		
	.RST(clk357_idelay_rst | idelay_rst),	//Reset when modifying delay or as part of full reset
	.T(1'b1) 			// 1==INPUT/INTERNAL	0==OUTPUT
);

// **** incrementor for 357MHz IODELAY ****
wire [5:0] clk357_idelay_value;
wire [5:0] clk357_idelay_mon;
wire		  clk357_idelay_trig;
iodelay_incrementor clk357_idelay_inc(
	.clk40(clk40),
	.rst(clk357_idelay_rst | idelay_rst),
	.count_trig(clk357_idelay_trig),
	.spec_delay(clk357_idelay_value),
	.inc_en(clk357_idelay_ce),
	.actual_delay(clk357_idelay_mon)
);

// **** Final global clock buffer for 357MHz distribution ****
wire clk357;
BUFG BUFG_CLK357 (
	.O(clk357),
	.I(clk357_delayed)
);
			
//AuxOut select instance			
auxOut_select auxOut_select(clk357, FONT5_detect, amp_trig, amp_trig2, auxOutA1, auxOutB1, auxOutA2, auxOutB2);
//auxOut_select auxOut_select(clk357, FONT5_detect, amp_trig, amp_trig2, auxOutA1, auxOutB1, auxOutA2, ); // For version with swapped AUX OUT B <-> C //

			
//Internally generate a ring clock sync'ed to external 2.16 MHz


//synchronise the control signals from chipscope
//sync_en default to OFF (i.e. use sync_en)
//latch_rc_startup default to ON (i.e. use ~latch_rc_startup)

//wire sync_en;//, cs_latch_rc_startup;
//reg sync_en_a, sync_en_b;//, latch_rc_startup_a, latch_rc_startup_b;
`ifndef DIGIN_UART_RX
	reg clk2_16_tmp_a, clk2_16_tmp_b, clk2_16_tmp_c, clk2_16_tmp_d;
	wire clk2_16_tmp_edge;

	always @(posedge clk357) begin
		//sync_en_a <= cs_sync_en;
		//sync_en_b <= sync_en_a;
		
		//latch_rc_startup_a <= ~cs_latch_rc_startup;
		//latch_rc_startup_b <= latch_rc_startup_a;
		
		clk2_16_tmp_a <= clk2_16_tmp;
		clk2_16_tmp_b <= clk2_16_tmp_a;
		clk2_16_tmp_c <= clk2_16_tmp_b;
		clk2_16_tmp_d <= clk2_16_tmp_c;
		end
		
	assign clk2_16_tmp_edge = clk2_16_tmp_c & ~clk2_16_tmp_d;
`endif
reg rc_counting;
reg clk2_16, dcm200_locked_a;
reg [7:0] rc_ctr;
//Latch the clock startup
//always @(posedge clk357 or posedge dcm200_rst) begin
always @(posedge clk357) begin

	//if (~latch_rc_startup_b) rc_counting <= 1'b1;
	//else if (latch_rc_startup_b && ~rc_counting) rc_counting <= clk2_16_tmp_edge;
	//else rc_counting <= rc_counting;
	`ifdef DIGIN_UART_RX
		rc_counting <= (dcm200_locked_a) ? 1'b1 : 1'b0;
	`else
		if (~dcm200_locked_a)
			rc_counting <= 1'b0;
		else if (~rc_counting) 
			rc_counting <= clk2_16_tmp_edge;
		else 
			rc_counting <= rc_counting;
	`endif
			
	if (~rc_counting) begin
		rc_ctr <= 8'd0;
		clk2_16 <= 1'b0;
		end
	else if (rc_counting) begin
		if (rc_ctr==8'd164) begin
		//if (rc_ctr==8'd164 || (clk2_16_tmp_edge && sync_en)) begin
			rc_ctr <= 8'd0;
			clk2_16 <= 1'b1;
			end //if 
		else if (rc_ctr==8'd82) begin
			rc_ctr <= rc_ctr + 1'b1;
			clk2_16 <= 1'b0;
			end // else if
		else begin
			rc_ctr <= rc_ctr + 1'b1;
			clk2_16 <= clk2_16;
			//clk2_16 <= 1'b0;
			end //else
		end //if
	else begin
		rc_ctr <= rc_ctr;
		clk2_16 <= clk2_16;
		end //else		
	end //always			
			
//Try new trigger module with pulse ctr

/*wire trigger, pulse_ctr_rst;
wire [5:0] pulse_ctr;


pulse_ctr pulse_ctr1 (
	.clk(clk357),
	.trig_ext(trig),
	.pulse_ctr_rst_b(pulse_ctr_rst),
   .trig_out(trigger),
	.pulse_ctr(pulse_ctr)
);*/

// %%%%%%%%%%%%%%%%%   TIMING & SYNCHRONISATION MODULE   %%%%%%%%%%%%%%%%%%
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

// Brings trigger and ring clock onto 357 domain.  Uses them to produce the
// strobes and triggers for ADCs, DAQ and amplifier.
// All control signals from 357MHz control registers

//wire store_strb;
wire adc_align_en;
// Control register wires
wire 			cr_clk2_16_edge_sel;
wire [11:0] 	cr_trig_delay;
wire [6:0] 	cr_trig_out_delay;
wire [6:0] 	cr_trig_out_delay2;
wire 			cr_trig_out_en;
wire 			trig_out_temp;
wire 			trig_out_temp2;
wire [7:0]	cr_p1_b1_pos;
wire [7:0]	cr_p1_b2_pos;
wire [7:0]	cr_p1_b3_pos;
wire [7:0]	cr_p2_b1_pos;
wire [7:0]	cr_p2_b2_pos;
wire [7:0]	cr_p2_b3_pos;
wire [7:0]	cr_p3_b1_pos;
wire [7:0]	cr_p3_b2_pos;
wire [7:0]	cr_p3_b3_pos;
wire [6:0]  cr_sample_hold_off;
wire			led1_strb;
wire			p1_bunch_strb;
wire			p2_bunch_strb;
wire			p3_bunch_strb;
wire 			adc_powerdown_0;
//synthesis attribute use_dsp48 of timing_synch is "yes";
timing_synch timing_synch1 (
	.clk357(clk357),
	.rst(dcm200_rst),
	.clk2_16(clk2_16),
	.clk2_16_edge_sel(cr_clk2_16_edge_sel),
	.trig(trig),
	//.trig(trigger),
	.trig_delay(cr_trig_delay),
	.sample_hold_off(cr_sample_hold_off),
	.p1_b1_pos(cr_p1_b1_pos),
	.p1_b2_pos(cr_p1_b2_pos),
	.p1_b3_pos(cr_p1_b3_pos),
	.p2_b1_pos(cr_p2_b1_pos),
	.p2_b2_pos(cr_p2_b2_pos),
	.p2_b3_pos(cr_p2_b3_pos),
	.p3_b1_pos(cr_p3_b1_pos),
	.p3_b2_pos(cr_p3_b2_pos),
	.p3_b3_pos(cr_p3_b3_pos),
	.trig_out_delay(cr_trig_out_delay),
	.trig_out_delay2(cr_trig_out_delay2),
	.amp_trig(trig_out_temp),
	.amp_trig2(trig_out_temp2),
	.store_strb(store_strb),
	.adc_powerdown(adc_powerdown_0),
	.adc_align_en(adc_align_en),
	.p1_bunch_strb(),
	.p2_bunch_strb(p2_bunch_strb),
	.p3_bunch_strb(p3_bunch_strb),
	.trig_led_strb(led2_strb),
	.clk2_16_led_strb(led1_strb)
);

// Register amp trig, powerdown and align_en for timing
reg trig_out_temp_a, trig_out_temp_b, trig_out_temp_c, trig_out_temp_d;
reg trig_out_temp2_a, trig_out_temp2_b, trig_out_temp2_c, trig_out_temp2_d;
reg adc_align_en_a, adc_align_en_b;//, adc_align_en_c, adc_align_en_d;
reg adc_powerdown_a, adc_powerdown_b, adc_powerdown_c, adc_powerdown_d;
always @(posedge clk357) begin
	//amp_trig <= trig_out_temp_d & cr_trig_out_en;
	//amp_trig2 <= trig_out_temp2_d & cr_trig_out_en;

	trig_out_temp_a <= trig_out_temp;
	// synthesis attribute shreg_extract of trig_out_temp_a is "no";
	trig_out_temp_b <= trig_out_temp_a;
	// synthesis attribute shreg_extract of trig_out_temp_b is "no";
	trig_out_temp_c <= trig_out_temp_b;
	// synthesis attribute shreg_extract of trig_out_temp_c is "no";
	trig_out_temp_d <= trig_out_temp_c;
	// synthesis attribute shreg_extract of trig_out_temp_d is "no";
	
	trig_out_temp2_a <= trig_out_temp2;
	// synthesis attribute shreg_extract of trig_out_temp2_a is "no";
	trig_out_temp2_b <= trig_out_temp2_a;
	// synthesis attribute shreg_extract of trig_out_temp2_b is "no";
	trig_out_temp2_c <= trig_out_temp2_b;
	// synthesis attribute shreg_extract of trig_out_temp2_c is "no";
	trig_out_temp2_d <= trig_out_temp2_c;
	// synthesis attribute shreg_extract of trig_out_temp2_d is "no";
	
	adc_align_en_a <= adc_align_en;
	// synthesis attribute shreg_extract of align_en_a is "no";
	adc_align_en_b <= adc_align_en_a;
	// synthesis attribute shreg_extract of align_en_b is "no";
	//adc_align_en_c <= adc_align_en_b;
	// synthesis attribute shreg_extract of align_en_b is "no";
	//adc_align_en_d <= adc_align_en_c;
	// synthesis attribute shreg_extract of align_en_d is "no";
	
	adc_powerdown_a <= adc_powerdown_0;
	// synthesis attribute shreg_extract of adc_powerdown_a is "no";
	adc_powerdown_b <= adc_powerdown_a;
	// synthesis attribute shreg_extract of adc_powerdown_b is "no";
	adc_powerdown_c <= adc_powerdown_b;
	// synthesis attribute shreg_extract of adc_powerdown_c is "no";
	adc_powerdown_d <= adc_powerdown_c;
	// synthesis attribute shreg_extract of adc_powerdown_d is "no";
end
assign amp_trig = trig_out_temp_d & cr_trig_out_en;
assign amp_trig2 = trig_out_temp2_d & cr_trig_out_en;
assign adc_powerdown = adc_powerdown_d;

// %%%%%%%%%%%%%%%%%%%%%%%   STORE STROBE FAN OUT   %%%%%%%%%%%%%%%%%%%%%%%%
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

// Relax timing by duplicating sotre strobe register for each ADC group
reg p1_store_strb, p2_store_strb, p3_store_strb;
always @(posedge clk357) begin
	p1_store_strb <= store_strb;
	// synthesis attribute shreg_extract of p1_store_strb is "no";
	p2_store_strb <= store_strb;
	// synthesis attribute shreg_extract of p2_store_strb is "no";
	p3_store_strb <= store_strb;
	// synthesis attribute shreg_extract of p3_store_strb is "no";
	clk_blk <= store_strb;
	// synthesis attribute shreg_extract of clk_blk is "no";

end

//Match bunch strobes to store_strb
reg p3_bunch_strb_a, p2_bunch_strb_a, p1_bunch_strb_a;
always @(posedge clk357) begin
	p3_bunch_strb_a <= p3_bunch_strb;
	p2_bunch_strb_a <= p2_bunch_strb;
	p1_bunch_strb_a <= p1_bunch_strb;
end

// %%%%%%%%%%%%%%%%%%%%%%%%%%   LIGHT LEDS   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

// Light when 357MHz is present
`ifdef CLK357_PLL
	assign led0_out = pll_clk357_locked;
`else
	assign led0_out = 1'b1;
`endif

// Flash ~200ms on trigger
reg led2_out;
reg [22:0] led2_count;
always @(posedge clk40 or posedge dcm200_rst) begin
	if (dcm200_rst) begin
		led2_out <= 0;
		led2_count <= 0;
	end else begin
		case (led2_count)
			23'd0: if (led2_strb) led2_count <= 23'd1;
			23'd1: begin
				led2_out <= 1;
				led2_count <= led2_count + 1;
			end
			23'd8388607: begin
				led2_out <= 0;
				led2_count <= 0;
			end
			default: led2_count <= led2_count + 1;
		endcase
	end
end

// Flash just over a ring clock cycle on ring clock edge.  Will be lit
// all the time the clock is present
reg led1_out;
reg [4:0] led1_count;
always @(posedge clk40 or posedge dcm200_rst) begin
	if (dcm200_rst) begin
		led1_out <= 0;
		led1_count <= 0;
	end else begin
		if (led1_strb) begin 
			led1_count <= 5'd1;
		end else begin
			case (led1_count)
				5'd0: led1_count <= 0;
				5'd1: begin
					led1_out <= 1;
					led1_count <= led1_count + 1;
				end
				5'd31: begin
					led1_out <= 0;
					led1_count <= 0;
				end
				default: led1_count <= led1_count + 1;
			endcase
		end
	end
end

// %%%%%%%%%%%%%%%%%%   P1 ADC GROUP ADC_BLOCK MODULE   %%%%%%%%%%%%%%%%%%%%
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

// Bring the data from the 3 ADCs for P1 into the module via an adc_clock
// The adc block ensures the adc data is aligned with the 357MHz clock
// All control signals from 40MHz control registers

wire [12:0] ch1_dout, ch2_dout, ch3_dout; // For SR variant
//reg [12:0] p1_xdif_data_b, p1_ydif_data_b, p1_sum_data_b;
wire 			p1_adc_clk;
reg  [6:0]  cr_p1_offset_delay;
wire [5:0] 	cr_p1_scan_delay;
wire [1:0] 	cr_p1_align_ch_sel;
wire 			p1_delay_trig;
//wire [12:0] p1_xdif_data;
//wire [12:0] p1_ydif_data;
//wire [12:0] p1_sum_data;
reg [12:0] p1_xdif_data;
reg [12:0] p1_ydif_data;
reg [12:0] p1_sum_data;
wire 			p1_mon_strb;
wire 			p1_mon_saturated;
wire [5:0]  p1_mon_total_data_del;
wire [5:0]  p1_mon_total_drdy_del;
wire [6:0]  p1_mon_delay_mod;
wire [6:0]  p1_mon_count1;
wire [6:0]  p1_mon_count2;
wire [6:0]  p1_mon_count3;
wire [5:0]  p1_mon_adc_clk_del;
adc_block p1_adc_block(
	.clk357(clk357),
	.clk40(clk40),
	.rst(dcm200_rst),
	.align_en(adc_align_en_b),	// From time/synch mod.
	.align_ch_sel(cr_p1_align_ch_sel),
	.ch1_drdy_p(p1_xdif_drdy_p),
	.ch2_drdy_p(p1_ydif_drdy_p),
	.ch3_drdy_p(p1_sum_drdy_p),
	.ch1_drdy_n(p1_xdif_drdy_n),
	.ch2_drdy_n(p1_ydif_drdy_n),
	.ch3_drdy_n(p1_sum_drdy_n),
	.ch1_data_in_p(p1_xdif_datain_p),
	.ch2_data_in_p(p1_ydif_datain_p),
	.ch3_data_in_p(p1_sum_datain_p),
	.ch1_data_in_n(p1_xdif_datain_n),
	.ch2_data_in_n(p1_ydif_datain_n),
	.ch3_data_in_n(p1_sum_datain_n),
	.data_offset_delay(cr_p1_offset_delay),
	.scan_delay(cr_p1_scan_delay),
	.delay_trig(p1_delay_trig),
	//.ch1_data_out(p1_xdif_data),
	//.ch2_data_out(p1_ydif_data),
	//.ch3_data_out(p1_sum_data),
	.ch1_data_out(ch1_dout), // For SR variant
	.ch2_data_out(ch2_dout), // For SR variant
	.ch3_data_out(ch3_dout), // For SR variant
	.saturated(p1_mon_saturated),
	.adc_clk(p1_adc_clk),
	.total_data_delay(p1_mon_total_data_del),	//Monitoring
	.total_drdy_delay(p1_mon_total_drdy_del), //Monitoring
	.delay_mod(p1_mon_delay_mod),					//Monitoring
	.monitor_strb(p1_mon_strb),					//Monitoring
	.count1(p1_mon_count1),							//Monitoring
	.count2(p1_mon_count2),							//Monitoring
	.count3(p1_mon_count3),							//Monitoring
	.adc_clk_delay_mon(p1_mon_adc_clk_del)		//Monitoring
);


// **** Differential output buffer for p1 ADC group clock ****
OBUFDS #(
	.IOSTANDARD("DEFAULT")
) OBUFDS_ADC_P1 (
	.O(p1_adc_clk_p), 
	.OB(p1_adc_clk_n), 
	.I(p1_adc_clk)
);

//%%%%%%%%%% Shift Registers for P1 ADC group  %%%%%%%%%%%%%%%%%%%%%%%%%%%
//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

//wire [12:0] ch1_delayed, ch2_delayed, ch3_delayed;
//wire [5:0] cr_bank1_tap;
//reg [5:0] bank1_tap, bank1_tap_b;
always @(posedge clk357) begin
//p1_xdif_data <= p1_xdif_data_b;
//p1_ydif_data <= p1_ydif_data_b;
//p1_sum_data <= p1_sum_data_b;
//bank1_tap <= bank1_tap_b;
//bank1_tap_b <= cr_bank1_tap;
//p1_xdif_data_b <= (bank1_tap[5]) ? ch1_delayed : ch1_dout;
//p1_ydif_data_b <= (bank1_tap[5]) ? ch2_delayed : ch2_dout;
//p1_sum_data_b <= (bank1_tap[5]) ? ch3_delayed : ch3_dout;
p1_xdif_data <= ch1_dout;
p1_ydif_data <= ch2_dout;
p1_sum_data <= ch3_dout;

end

/*assign p1_xdif_data = (bank1_tap[5]) ? ch1_delayed : ch1_dout;
assign p1_ydif_data = (bank1_tap[5]) ? ch2_delayed : ch2_dout;
assign p1_sum_data = (bank1_tap[5]) ? ch3_delayed : ch3_dout;

ShiftReg ShiftReg_ch1 (clk357, ch1_dout, bank1_tap[4:0], ch1_delayed);
ShiftReg ShiftReg_ch2 (clk357, ch2_dout, bank1_tap[4:0], ch2_delayed);
ShiftReg ShiftReg_ch3 (clk357, ch3_dout, bank1_tap[4:0], ch3_delayed);*/


// %%%%%%%%%%%%%%%%%%   P1 ADC GROUP DAQ_RAM MODULES   %%%%%%%%%%%%%%%%%%%%%
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

// Three RAM modules with self contained transmission logic.  Data are written 
// at 357MHz and number of samples tracked.  When tx_en goes high, data are sent
// to the UART

wire 			daq_ram_rst;
wire			uart_tx_empty;

reg 			daq_p1_xdif_tx_en;
wire 			daq_p1_xdif_tx_done;
wire [7:0] 	daq_p1_xdif_tx_data;
wire 			daq_p1_xdif_tx_load;
DAQ_RAM daq_ram_p1_xdif(
	.reset(daq_ram_rst),
	.tx_en(daq_p1_xdif_tx_en),
	.tx_clk(clk40),
	.tx_data_ready(daq_p1_xdif_tx_load),
	.tx_data(daq_p1_xdif_tx_data),
	.tx_data_loaded(~uart_tx_empty),
	.tx_complete(daq_p1_xdif_tx_done),
	.wr_clk(clk357),
	.wr_en(p1_store_strb),
	.wr_data({p1_xdif_data[12], p1_xdif_data})
);

reg 			daq_p1_ydif_tx_en;
wire 			daq_p1_ydif_tx_done;
wire [7:0] 	daq_p1_ydif_tx_data;
wire 			daq_p1_ydif_tx_load;
DAQ_RAM daq_ram_p1_ydif(
	.reset(daq_ram_rst),
	.tx_en(daq_p1_ydif_tx_en),
	.tx_clk(clk40),
	.tx_data_ready(daq_p1_ydif_tx_load),
	.tx_data(daq_p1_ydif_tx_data),
	.tx_data_loaded(~uart_tx_empty),
	.tx_complete(daq_p1_ydif_tx_done),
	.wr_clk(clk357),
	.wr_en(p1_store_strb),
	.wr_data({p1_ydif_data[12], p1_ydif_data})
);

reg 			daq_p1_sum_tx_en;
wire 			daq_p1_sum_tx_done;
wire [7:0] 	daq_p1_sum_tx_data;
wire 			daq_p1_sum_tx_load;
DAQ_RAM daq_ram_p1_sum(
	.reset(daq_ram_rst),
	.tx_en(daq_p1_sum_tx_en),
	.tx_clk(clk40),
	.tx_data_ready(daq_p1_sum_tx_load),
	.tx_data(daq_p1_sum_tx_data),
	.tx_data_loaded(~uart_tx_empty),
	.tx_complete(daq_p1_sum_tx_done),
	.wr_clk(clk357),
	.wr_en(p1_store_strb),
	.wr_data({p1_sum_data[12], p1_sum_data})
);


// %%%%%%%%%%%%%%%%%%   P2 ADC GROUP ADC_BLOCK MODULE   %%%%%%%%%%%%%%%%%%%%
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

// Bring the data from the 3 ADCs for P2 into the module via an adc_clock
// The adc block ensures the adc data is aligned with the 357MHz clock
// All control signals from 40MHz control registers

wire [12:0] ch4_dout, ch5_dout, ch6_dout; // For SR variant
//wire [12:0] ch6_dout;
//reg [12:0] p2_xdif_data_b, p2_ydif_data_b, p2_sum_data_b;
wire 			p2_adc_clk;
reg  [6:0]  cr_p2_offset_delay;
wire [5:0] 	cr_p2_scan_delay;
wire [1:0] 	cr_p2_align_ch_sel;
wire 			p2_delay_trig;
//wire [12:0] p2_xdif_data;
//wire [12:0] p2_ydif_data;
//wire [12:0] p2_sum_data;
//reg [12:0] p2_sum_data;
reg [12:0] p2_xdif_data, p2_ydif_data, p2_sum_data;
wire 			p2_mon_strb;
wire 			p2_mon_saturated;
wire [5:0]  p2_mon_total_data_del;
wire [5:0]  p2_mon_total_drdy_del;
wire [6:0]  p2_mon_delay_mod;
wire [6:0]  p2_mon_count1;
wire [6:0]  p2_mon_count2;
wire [6:0]  p2_mon_count3;
wire [5:0]  p2_mon_adc_clk_del;
adc_block p2_adc_block(
	.clk357(clk357),
	.clk40(clk40),
	.rst(dcm200_rst),
	.align_en(adc_align_en_b),	// From time/synch mod.
	.align_ch_sel(cr_p2_align_ch_sel),
	.ch1_drdy_p(p2_xdif_drdy_p),
	.ch2_drdy_p(p2_ydif_drdy_p),
	.ch3_drdy_p(p2_sum_drdy_p),
	.ch1_drdy_n(p2_xdif_drdy_n),
	.ch2_drdy_n(p2_ydif_drdy_n),
	.ch3_drdy_n(p2_sum_drdy_n),
	.ch1_data_in_p(p2_xdif_datain_p),
	.ch2_data_in_p(p2_ydif_datain_p),
	.ch3_data_in_p(p2_sum_datain_p),
	.ch1_data_in_n(p2_xdif_datain_n),
	.ch2_data_in_n(p2_ydif_datain_n),
	.ch3_data_in_n(p2_sum_datain_n),
	.data_offset_delay(cr_p2_offset_delay),
	.scan_delay(cr_p2_scan_delay),
	.delay_trig(p2_delay_trig),
	//.ch1_data_out(p2_xdif_data),
	.ch1_data_out(ch4_dout), // For SR variant
	//.ch2_data_out(p2_ydif_data),
	.ch2_data_out(ch5_dout), // For SR variant
	//.ch3_data_out(p2_sum_data),
	.ch3_data_out(ch6_dout), // For SR variant
	.saturated(p2_mon_saturated),
	.adc_clk(p2_adc_clk),
	.total_data_delay(p2_mon_total_data_del),	//Monitoring
	.total_drdy_delay(p2_mon_total_drdy_del), //Monitoring
	.delay_mod(p2_mon_delay_mod),					//Monitoring
	.monitor_strb(p2_mon_strb),					//Monitoring
	.count1(p2_mon_count1),							//Monitoring
	.count2(p2_mon_count2),							//Monitoring
	.count3(p2_mon_count3),							//Monitoring
	.adc_clk_delay_mon(p2_mon_adc_clk_del)		//Monitoring
);


// **** Differential output buffer for p2 ADC group clock ****
OBUFDS #(
	.IOSTANDARD("DEFAULT")
) OBUFDS_ADC_P2 (
	.O(p2_adc_clk_p), 
	.OB(p2_adc_clk_n), 
	.I(p2_adc_clk)
);

//%%%%%%%%%% Shift Registers for P2 ADC group  %%%%%%%%%%%%%%%%%%%%%%%%%%%
//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

//wire [12:0] ch4_delayed, ch5_delayed, ch6_delayed;
//wire [12:0] ch6_delayed;
//wire [5:0] cr_sr1_tap;
//reg [5:0] sr1_tap, sr1_tap_b;
always @(posedge clk357) begin
	//p2_xdif_data <= p2_xdif_data_b;
	//p2_ydif_data <= p2_ydif_data_b;
	//p2_sum_data <= p2_sum_data_b;
	//sr1_tap <= sr1_tap_b;
	//sr1_tap_b <= cr_sr1_tap;
	//p2_xdif_data_b <= (bank2_tap[5]) ? ch4_delayed : ch4_dout;
   //p2_ydif_data_b <= (bank2_tap[5]) ? ch5_delayed : ch5_dout;
	//p2_sum_data <= (sr1_tap[5]) ? ch6_delayed : ch6_dout;
	p2_sum_data <= ch6_dout;
	p2_xdif_data <= ch4_dout;
	p2_ydif_data <= ch5_dout;

end

//assign p2_xdif_data = (bank2_tap[5]) ? ch4_delayed : ch4_dout;
//assign p2_ydif_data = (bank2_tap[5]) ? ch5_delayed : ch5_dout;
//assign p2_sum_data = (sr1_tap[5]) ? ch6_delayed : ch6_dout;


//ShiftReg ShiftReg_ch4 (clk357, ch4_dout, bank2_tap[4:0], ch4_delayed);
//ShiftReg ShiftReg_ch5 (clk357, ch5_dout, bank2_tap[4:0], ch5_delayed);
//ShiftReg ShiftReg_ch6 (clk357, ch6_dout, sr1_tap[4:0], ch6_delayed);

// %%%%%%%%%%%%%%%%%%   P2 ADC GROUP DAQ_RAM MODULES   %%%%%%%%%%%%%%%%%%%%%
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

// Three RAM modules with self contained transmission logic.  Data are written 
// at 357MHz and number of samples tracked.  When tx_en goes high, data are sent
// to the UART

reg 			daq_p2_xdif_tx_en;
wire 			daq_p2_xdif_tx_done;
wire [7:0] 	daq_p2_xdif_tx_data;
wire 			daq_p2_xdif_tx_load;
DAQ_RAM daq_ram_p2_xdif(
	.reset(daq_ram_rst),
	.tx_en(daq_p2_xdif_tx_en),
	.tx_clk(clk40),
	.tx_data_ready(daq_p2_xdif_tx_load),
	.tx_data(daq_p2_xdif_tx_data),
	.tx_data_loaded(~uart_tx_empty),
	.tx_complete(daq_p2_xdif_tx_done),
	.wr_clk(clk357),
	.wr_en(p2_store_strb),
	.wr_data({p2_xdif_data[12], p2_xdif_data})
);

reg 			daq_p2_ydif_tx_en;
wire 			daq_p2_ydif_tx_done;
wire [7:0] 	daq_p2_ydif_tx_data;
wire 			daq_p2_ydif_tx_load;
DAQ_RAM daq_ram_p2_ydif(
	.reset(daq_ram_rst),
	.tx_en(daq_p2_ydif_tx_en),
	.tx_clk(clk40),
	.tx_data_ready(daq_p2_ydif_tx_load),
	.tx_data(daq_p2_ydif_tx_data),
	.tx_data_loaded(~uart_tx_empty),
	.tx_complete(daq_p2_ydif_tx_done),
	.wr_clk(clk357),
	.wr_en(p2_store_strb),
	.wr_data({p2_ydif_data[12], p2_ydif_data})
);

reg 			daq_p2_sum_tx_en;
wire 			daq_p2_sum_tx_done;
wire [7:0] 	daq_p2_sum_tx_data;
wire 			daq_p2_sum_tx_load;
DAQ_RAM daq_ram_p2_sum(
	.reset(daq_ram_rst),
	.tx_en(daq_p2_sum_tx_en),
	.tx_clk(clk40),
	.tx_data_ready(daq_p2_sum_tx_load),
	.tx_data(daq_p2_sum_tx_data),
	.tx_data_loaded(~uart_tx_empty),
	.tx_complete(daq_p2_sum_tx_done),
	.wr_clk(clk357),
	.wr_en(p2_store_strb),
	.wr_data({p2_sum_data[12], p2_sum_data})
);


// %%%%%%%%%%%%%%%%%%   P3 ADC GROUP ADC_BLOCK MODULE   %%%%%%%%%%%%%%%%%%%%
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

// Bring the data from the 3 ADCs for P3 into the module via an adc_clock
// The adc block ensures the adc data is aligned with the 357MHz clock
// All control signals from 40MHz control registers

wire [12:0] ch7_dout, ch8_dout, ch9_dout; // For SR variant
//wire [12:0] ch8_dout, ch9_dout;
//reg [12:0] ch7_dout_b, ch8_dout_b, ch9_dout_b;
//reg [12:0] p3_xdif_data_b, p3_ydif_data_b, p3_sum_data_b;
wire 			p3_adc_clk;
reg  [6:0]  cr_p3_offset_delay;
wire [5:0] 	cr_p3_scan_delay;
wire [1:0] 	cr_p3_align_ch_sel;
wire 			p3_delay_trig;
//wire [12:0] p3_xdif_data;
//wire [12:0] p3_ydif_data;
//wire [12:0] p3_sum_data;
reg [12:0] p3_xdif_data;
reg [12:0] p3_ydif_data;
reg [12:0] p3_sum_data;
wire 			p3_mon_strb;
wire 			p3_mon_saturated;
wire [5:0]  p3_mon_total_data_del;
wire [5:0]  p3_mon_total_drdy_del;
wire [6:0]  p3_mon_delay_mod;
wire [6:0]  p3_mon_count1;
wire [6:0]  p3_mon_count2;
wire [6:0]  p3_mon_count3;
wire [5:0]  p3_mon_adc_clk_del;
adc_block p3_adc_block(
	.clk357(clk357),
	.clk40(clk40),
	.rst(dcm200_rst),
	.align_en(adc_align_en_b),	// From time/synch mod.
	.align_ch_sel(cr_p3_align_ch_sel),
	.ch1_drdy_p(p3_xdif_drdy_p),
	.ch2_drdy_p(p3_ydif_drdy_p),
	.ch3_drdy_p(p3_sum_drdy_p),
	.ch1_drdy_n(p3_xdif_drdy_n),
	.ch2_drdy_n(p3_ydif_drdy_n),
	.ch3_drdy_n(p3_sum_drdy_n),
	.ch1_data_in_p(p3_xdif_datain_p),
	.ch2_data_in_p(p3_ydif_datain_p),
	.ch3_data_in_p(p3_sum_datain_p),
	.ch1_data_in_n(p3_xdif_datain_n),
	.ch2_data_in_n(p3_ydif_datain_n),
	.ch3_data_in_n(p3_sum_datain_n),
	.data_offset_delay(cr_p3_offset_delay),
	.scan_delay(cr_p3_scan_delay),
	.delay_trig(p3_delay_trig),
	//.ch1_data_out(p3_xdif_data),
	//.ch2_data_out(p3_ydif_data),
	//.ch3_data_out(p3_sum_data),
	.ch1_data_out(ch7_dout), // For SR variant
	.ch2_data_out(ch8_dout), // For SR variant
	.ch3_data_out(ch9_dout), // For SR variant
	.saturated(p3_mon_saturated),
	.adc_clk(p3_adc_clk),
	.total_data_delay(p3_mon_total_data_del),	//Monitoring
	.total_drdy_delay(p3_mon_total_drdy_del), //Monitoring
	.delay_mod(p3_mon_delay_mod),					//Monitoring
	.monitor_strb(p3_mon_strb),					//Monitoring
	.count1(p3_mon_count1),							//Monitoring
	.count2(p3_mon_count2),							//Monitoring
	.count3(p3_mon_count3),							//Monitoring
	.adc_clk_delay_mon(p3_mon_adc_clk_del)		//Monitoring
);

// **** Differential output buffer for p3 ADC group clock ****
OBUFDS #(
	.IOSTANDARD("DEFAULT")
) OBUFDS_ADC_P3 (
	.O(p3_adc_clk_p), 
	.OB(p3_adc_clk_n), 
	.I(p3_adc_clk)
);

//%%%%%%%%%% Shift Registers for P3 ADC group  %%%%%%%%%%%%%%%%%%%%%%%%%%%
//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

wire [12:0] ch7_delayed, ch8_delayed, ch9_delayed;
`ifdef BUILD_ATF2IP_2BPM
	reg [12:0] ch9_nodelay;
`endif
//wire [12:0] ch8_delayed, ch9_delayed;
//wire [5:0] cr_sr2_tap, cr_sr3_tap;
wire [5:0] cr_sr1_tap, cr_sr2_tap, cr_sr3_tap;
reg [5:0] sr1_tap, sr1_tap_b, sr2_tap, sr2_tap_b, sr3_tap, sr3_tap_b;
//reg [5:0] sr2_tap, sr2_tap_b, sr3_tap, sr3_tap_b;
always @(posedge clk357) begin
	//ch7_dout_b <= ch7_dout;
	//ch8_dout_b <= ch8_dout;
	//ch9_dout_b <= ch9_dout;
	//p3_xdif_data <= p3_xdif_data_b;
	//p3_ydif_data <= p3_ydif_data_b;
	//p3_sum_data <= p3_sum_data_b;
	sr1_tap <= sr1_tap_b;
	sr1_tap_b <= cr_sr1_tap;
	sr2_tap <= sr2_tap_b;
	sr2_tap_b <= cr_sr2_tap;
	sr3_tap <= sr3_tap_b;
	sr3_tap_b <= cr_sr3_tap;
	//p3_xdif_data_b <= (bank3_tap[5]) ? ch7_delayed : ch7_dout;
	p3_xdif_data <= (sr1_tap[5]) ? ch7_delayed : ch7_dout;
	p3_ydif_data <= (sr2_tap[5]) ? ch8_delayed : ch8_dout;
	p3_sum_data <= (sr3_tap[5]) ? ch9_delayed : ch9_dout;
	
`ifdef BUILD_ATF2IP_2BPM
	ch9_nodelay <= ch9_dout;
`endif
	//p3_xdif_data <= ch7_dout;

end

//assign p3_xdif_data = (bank3_tap[5]) ? ch7_delayed : ch7_dout;
//assign p3_ydif_data = (sr2_tap[5]) ? ch8_delayed : ch8_dout;
//assign p3_sum_data = (sr3_tap[5]) ? ch9_delayed : ch9_dout;

//assign p3_xdif_data = ch7_delayed;
//assign p3_ydif_data = ch8_delayed;
//assign p3_sum_data = ch9_delayed;

//ShiftReg ShiftReg_ch7 (clk357, ch7_dout, bank3_tap[4:0], ch7_delayed);
ShiftReg Chan7SR (clk357, ch7_dout, sr1_tap[4:0], ch7_delayed);
ShiftReg Chan8SR (clk357, ch8_dout, sr2_tap[4:0], ch8_delayed);
ShiftReg Chan9SR (clk357, ch9_dout, sr3_tap[4:0], ch9_delayed);

//delayByNCycles ShiftReg_ch7 (clk357, ch7_dout_b, ch7_delayed);
//delayByNCycles ShiftReg_ch8 (clk357, ch8_dout_b, ch8_delayed);
//delayByNCycles ShiftReg_ch9 (clk357, ch9_dout_b, ch9_delayed);


// %%%%%%%%%%%%%%%%%%   P3 ADC GROUP DAQ_RAM MODULES   %%%%%%%%%%%%%%%%%%%%%
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

// Three RAM modules with self contained transmission logic.  Data are written 
// at 357MHz and number of samples tracked.  When tx_en goes high, data are sent
// to the UART

reg 			daq_p3_xdif_tx_en;
wire 			daq_p3_xdif_tx_done;
wire [7:0] 	daq_p3_xdif_tx_data;
wire 			daq_p3_xdif_tx_load;
DAQ_RAM daq_ram_p3_xdif(
	.reset(daq_ram_rst),
	.tx_en(daq_p3_xdif_tx_en),
	.tx_clk(clk40),
	.tx_data_ready(daq_p3_xdif_tx_load),
	.tx_data(daq_p3_xdif_tx_data),
	.tx_data_loaded(~uart_tx_empty),
	.tx_complete(daq_p3_xdif_tx_done),
	.wr_clk(clk357),
	.wr_en(p3_store_strb),
	.wr_data({p3_xdif_data[12], p3_xdif_data})
);

reg 			daq_p3_ydif_tx_en;
wire 			daq_p3_ydif_tx_done;
wire [7:0] 	daq_p3_ydif_tx_data;
wire 			daq_p3_ydif_tx_load;
DAQ_RAM daq_ram_p3_ydif(
	.reset(daq_ram_rst),
	.tx_en(daq_p3_ydif_tx_en),
	.tx_clk(clk40),
	.tx_data_ready(daq_p3_ydif_tx_load),
	.tx_data(daq_p3_ydif_tx_data),
	.tx_data_loaded(~uart_tx_empty),
	.tx_complete(daq_p3_ydif_tx_done),
	.wr_clk(clk357),
	.wr_en(p3_store_strb),
	.wr_data({p3_ydif_data[12], p3_ydif_data})
);

reg 			daq_p3_sum_tx_en;
wire 			daq_p3_sum_tx_done;
wire [7:0] 	daq_p3_sum_tx_data;
wire 			daq_p3_sum_tx_load;
DAQ_RAM daq_ram_p3_sum(
	.reset(daq_ram_rst),
	.tx_en(daq_p3_sum_tx_en),
	.tx_clk(clk40),
	.tx_data_ready(daq_p3_sum_tx_load),
	.tx_data(daq_p3_sum_tx_data),
	.tx_data_loaded(~uart_tx_empty),
	.tx_complete(daq_p3_sum_tx_done),
	.wr_clk(clk357),
	.wr_en(p3_store_strb),
	.wr_data({p3_sum_data[12], p3_sum_data})
);


// %%%%%%%%%%%%%%%%%%%%%%%%%%%%   DAC READBACKS  %%%%%%%%%%%%%%%%%%%%%%%%%%%
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

// Use DAQ RAMS to log and transmit the values put out onto dacs 1 & 3.  Using the
// dac clocks as write strobes means that each dac code will be written twice (clocks
// are 5.6ns pulses) for 6 values per dac per pulse

//Temporarily switched DAC 3 for DAC 2 due to available BNC conections

wire 			k1_dac_en, k2_dac_en;
wire signed [12:0] k1_dac_out, k2_dac_out;
`ifdef BUILD_ATF2IP_2BPM 
	wire signed [13:0] dac_sum; 
`endif

reg 			daq_dac1_tx_en;
wire 			daq_dac1_tx_done;
wire [7:0] 	daq_dac1_tx_data;
wire 			daq_dac1_tx_load;
DAQ_RAM daq_dac1_sum(
	.reset(daq_ram_rst),
	.tx_en(daq_dac1_tx_en),
	.tx_clk(clk40),
	.tx_data_ready(daq_dac1_tx_load),
	.tx_data(daq_dac1_tx_data),
	.tx_data_loaded(~uart_tx_empty),
	.tx_complete(daq_dac1_tx_done),
	.wr_clk(clk357),
	//.wr_en(dac1_clk),
	.wr_en(k1_dac_en),
	//.wr_data({dac1_out[12], dac1_out})
	`ifdef BUILD_ATF2IP_2BPM 
		.wr_data({dac_sum[13], dac_sum[13:1]})
	`else
		.wr_data({k1_dac_out[12], k1_dac_out})
	`endif
);

reg 			daq_dac3_tx_en;
wire 			daq_dac3_tx_done;
wire [7:0] 	daq_dac3_tx_data;
wire 			daq_dac3_tx_load;
DAQ_RAM daq_dac3_sum(
	.reset(daq_ram_rst),
	.tx_en(daq_dac3_tx_en),
	.tx_clk(clk40),
	.tx_data_ready(daq_dac3_tx_load),
	.tx_data(daq_dac3_tx_data),
	.tx_data_loaded(~uart_tx_empty),
	.tx_complete(daq_dac3_tx_done),
	.wr_clk(clk357),
	//.wr_en(dac2_clk),
	.wr_en(k2_dac_en),
	//.wr_data({dac2_out[12], dac2_out})
	`ifdef BUILD_ATF2IP_2BPM 
		.wr_data({dac_sum[13], dac_sum[13:1]})
	`else
		.wr_data({k2_dac_out[12], k2_dac_out})
	`endif
);

//%%%%%%%%%%%%%%%%%%% INCLUDE UART ON DIGINA %%%%%%%%%%%%%%%%%%////////
parameter UART2_BAUD = `UART2_BAUD;

reg [12:0]  cr_k1_const_dac_out, cr_k2_const_dac_out;

`ifdef DIGIN_UART_RX 
	//wire digIn1_uart = (use_trigSyncExt) ? 1'b0 : diginput1;
	wire digIn1_uart = diginput1;
	wire uart2_byte_rdy, uart2_rx_unload;
	wire [7:0] uart2_rx_data;

	uart2_rx #(8, UART2_BAUD) uart2_rx (	
		.reset(dcm200_rst),
		.clk(clk40_ibufg),
		.uld_rx_data(uart2_rx_unload),
		.rx_enable(1'b1),
		.rx_data(uart2_rx_data),
		.rx_in(digIn1_uart),
		.byte_rdy(uart2_byte_rdy)
	);
	
	wire constDAC1UARTor, constDAC2UARTor;
	reg constDAC1UARTor_a, constDAC2UARTor_a, constDAC1UARTor_b, constDAC2UARTor_b;
	`ifdef TWO_BYTE_DECODE
		wire [12:0] uK1data, uK2data;
		reg [12:0] uK1data_a, uK1data_b, uK2data_a, uK2data_b, k1constDAC, k2constDAC;
		always @(posedge clk357) begin
			uK1data_a <= uK1data;
			uK1data_b <= uK1data_a;
			uK2data_a <= uK2data;
			uK2data_b <= uK2data_a;
			k1constDAC <= (constDAC1UARTor_b) ? uK1data_b : cr_k1_const_dac_out;
			k2constDAC <= (constDAC2UARTor_b) ? uK2data_b : cr_k2_const_dac_out;
		end
		uart_unload2 #(.BYTE_WIDTH(8),.WORD_WIDTH(13)) uart2_uld (.rst(dcm200_rst), .clk(clk40_ibufg), .byte_rdy(uart2_byte_rdy), .din(uart2_rx_data), .d1out(uK1data), .d2out(uK2data), .unload_uart(uart2_rx_unload));
		//wire [12:0] k1constDAC = (constDAC1UARTor_b) ? uK1data_b : cr_k1_const_dac_out;
		//wire [12:0] k2constDAC = (constDAC2UARTor_b) ? uK2data_b : cr_k2_const_dac_out;
	`else
		reg [7:0] uart2_rx_data_a, uart2_rx_data_b;
		always @(posedge clk357) begin
			uart2_rx_data_a <= uart2_rx_data;
			uart2_rx_data_b <= uart2_rx_data_a;
		end
		uart_unload2 #(.BYTE_WIDTH(8),.WORD_WIDTH(13)) uart2_uld (.rst(dcm200_rst), .clk(clk40_ibufg), .byte_rdy(uart2_byte_rdy), .unload_uart(uart2_rx_unload));
		wire [12:0] k1constDAC = (constDAC1UARTor_b) ? {uart2_rx_data_b, 5'd0} : cr_k1_const_dac_out;
		wire [12:0] k2constDAC = (constDAC2UARTor_b) ? {uart2_rx_data_b, 5'd0} : cr_k2_const_dac_out;
	`endif
`endif

`ifdef UART2_SELF_TEST
	wire uart2_tx_en;
	wire [7:0] sync_out;
	//wire [7:0] uart2_drive;

	uart2_tx #(8, UART2_BAUD) uart2_tx (	
	.reset(dcm200_rst),
	.clk(clk40_ibufg),
	//.baud_rate(baud_rate),
	.ld_tx_data(1'b1),
	//.tx_data(8'd42),
	.tx_data(sync_out),
	.tx_enable(uart2_tx_en),	.tx_out(DirIOB),
	.tx_empty()
);	
`else assign DirIOB = 1'bz;
`endif
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ////




// %%%%%%%%%%%%%%%%   PROCESS DATA TO PRODUCE FB SIGNAL  %%%%%%%%%%%%%%%%%%%
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

// Modules contain lookup tables with Gain / Sum.  The output is multiplied
// by Y Difference to form FB signal.  This is passed to the DAC, and a DAC enable
// provided.  P2 drives K1, P3 drives K2
//
// REPLACED WITH COUPLED FEEDBACK LOOPS.  K1 AND K2 KICKS ARE LINEAR COMBINATION
// OF P2 AND P3 POSITIONS.  TWO LOOKUP TABLES PER LOOP NOW
//
// Multiplexed ingoing bunch strobes so any can be used in the loops.  The 'p2'
// input in the feedback loop is a high latency path, while 'p3' has minimal
// latency.  The multiplexer should send p2 & p3 bunch strobes respectively in
// normal operation

wire [14:0] gainlut_ld_addr;
wire [6:0]	gainlut_ld_data;

// Multiplex strobes
wire  cr_k1_bunch_strb_sel;
`ifdef BUILD_ATF2IP_2BPM
	reg Chan6switch, Chan6switch_b;
	always @(posedge clk357) begin
		Chan6switch <= Chan6switch_b;
		Chan6switch_b <= cr_k1_bunch_strb_sel;
		end
`endif
	
//wire			k1_low_lat_strb;
//wire			k1_high_lat_strb;
//assign k1_high_lat_strb = cr_k1_bunch_strb_sel[0] ? p1_bunch_strb_a :
//								  cr_k1_bunch_strb_sel[1] ? p2_bunch_strb_a :
//								  p3_bunch_strb_a;
//assign k1_low_lat_strb = cr_k1_bunch_strb_sel[3] ? p1_bunch_strb_a :
//								 cr_k1_bunch_strb_sel[4] ? p2_bunch_strb_a :
//								 p3_bunch_strb_a;									 

// **** P2 to K1 feedback ****
//reg [12:0]  cr_k1_const_dac_out;
wire			cr_k1_const_dac_en;
wire			cr_k1_fb_en;
wire			cr_k1_delay_loop_en;
wire			k1_p2_lut_wr_en;
wire			k1_p3_lut_wr_en;
//wire [12:0] k1_dac_out;
//wire 			k1_dac_en;
reg  [12:0] cr_k1_b2_offset;
reg  [12:0] cr_k1_b3_offset;
wire [6:0]  cr_k1_fir_k1;
/*coupled_data_processing K1_FB ( 
	.clk(clk357),
	.rst(dcm200_rst),	
	.slow_clk(clk40), 
	.p2_sigma_in(p2_sum_data), 
	.p2_delta_in(p2_ydif_data), 
	.p3_sigma_in(cr_k1_bunch_strb_sel ? p3_sum_data : p2_sum_data), 
	.p3_delta_in(cr_k1_bunch_strb_sel ? p3_ydif_data : p2_ydif_data),
	.store_strb(p2_store_strb), 
	.p2_bunch_strb(p2_bunch_strb_a), 
	.p3_bunch_strb(cr_k1_bunch_strb_sel ? p3_bunch_strb_a : p2_bunch_strb_a), 
	.feedbck_en(cr_k1_fb_en), 
	.delay_loop_en(cr_k1_delay_loop_en), 
	.const_dac_en(cr_k1_const_dac_en), 
	.const_dac_out(cr_k1_const_dac_out), 
	.b2_offset(cr_k1_b2_offset),
	.b3_offset(cr_k1_b3_offset),
	.fir_k1(cr_k1_fir_k1),
	.p2_lut_dinb(gainlut_ld_data), 
	.p2_lut_addrb(gainlut_ld_addr),
	.p2_lut_web(k1_p2_lut_wr_en), 
	.p2_lut_doutb(),
	.p3_lut_dinb(gainlut_ld_data), 
	.p3_lut_addrb(gainlut_ld_addr),
	.p3_lut_web(k1_p3_lut_wr_en), 
	.p3_lut_doutb(),
	.amp_drive(k1_dac_out), 
	.dac_en(k1_dac_en)
);*/
coupled_data_processing2 K1_FB ( 
	.clk(clk357),
	.rst(dcm200_rst),	
	.slow_clk(clk40), 
	`ifdef BUILD_ATF2IP_2BPM  //IPFB mod 21/4/16 
		//.p2_sigma_in(p2_xdif_data),
		.p2_sigma_in(Chan6switch ? p2_sum_data : ch9_nodelay),
		//.p2_delta_in(p2_ydif_data),
		.p2_delta_in(p2_xdif_data),
		.p3_sigma_in(p3_sum_data),
		//.p3_delta_in(p2_sum_data),
		.p3_delta_in(p3_ydif_data),
		.p3_bunch_strb(p3_bunch_strb_a), 
	`else
		.p2_sigma_in(p2_sum_data), 
		//.p2_sigma_in(p2_xdif_data), 
		.p2_delta_in(p2_ydif_data), 
		.p3_sigma_in(cr_k1_bunch_strb_sel ? p3_sum_data : p2_sum_data),
		//.p3_sigma_in(p3_sum_data), 
		.p3_delta_in(cr_k1_bunch_strb_sel ? p3_ydif_data : p2_ydif_data),
		//.p3_delta_in(p3_ydif_data),
		.p3_bunch_strb(cr_k1_bunch_strb_sel ? p3_bunch_strb_a : p2_bunch_strb_a), 
	`endif
	.store_strb(p2_store_strb), 
	.p2_bunch_strb(p2_bunch_strb_a), 
	//.p3_bunch_strb(cr_k1_bunch_strb_sel ? p3_bunch_strb_a : p2_bunch_strb_a), 
	//.p3_bunch_strb(p3_bunch_strb_a), 
	.feedbck_en(cr_k1_fb_en), 
	.delay_loop_en(cr_k1_delay_loop_en), 
	.const_dac_en(cr_k1_const_dac_en), 
	`ifdef DIGIN_UART_RX
		.const_dac_out(k1constDAC),
	`else
		.const_dac_out(cr_k1_const_dac_out), 
	`endif
	.b2_offset(cr_k1_b2_offset),
	.b3_offset(cr_k1_b3_offset),
	.fir_k1(cr_k1_fir_k1),
	.p2_lut_dinb(gainlut_ld_data), 
	.p2_lut_addrb(gainlut_ld_addr),
	.p2_lut_web(k1_p2_lut_wr_en), 
	.p2_lut_doutb(),
	.p3_lut_dinb(gainlut_ld_data), 
	.p3_lut_addrb(gainlut_ld_addr),
	.p3_lut_web(k1_p3_lut_wr_en), 
	.p3_lut_doutb(),
	.amp_drive(k1_dac_out), 
	.dac_en(k1_dac_en)
);
//data_processing P2_to_K1_FB ( 
//	.clk(clk357),
//	.rst(dcm200_rst),	
//	.slow_clk(clk40), 
//	.sigma_in(p2_sum_data), 
//	.delta_in(p2_ydif_data), 
//	.store_strb(p2_store_strb), 
//	.bunch_strb(p2_bunch_strb_a), 
//	.feedbck_en(cr_k1_fb_en), 
//	.delay_loop_en(cr_k1_delay_loop_en), 
//	.const_dac_en(cr_k1_const_dac_en), 
//	.const_dac_out(cr_k1_const_dac_out), 
//	.b2_offset(cr_k1_b2_offset),
//	.b3_offset(cr_k1_b3_offset),
//	.fir_k1(cr_k1_fir_k1),
//	.lut_dinb(gainlut_ld_data), 
//	.lut_addrb(gainlut_ld_addr),
//	.lut_web(p2_lut_wr_en), 
//	.lut_doutb(),
//	.amp_drive(k1_dac_out), 
//	.dac_en(k1_dac_en)
//);

// **** Assign to two DAC outputs ****
//assign dac1_out = k1_dac_out;
//assign dac3_out = k1_dac_out;
//assign dac1_clk = k1_dac_en;
//assign dac3_clk = k1_dac_en;

//always @(posedge clk357) dac1_out <= k1_dac_out; //synthesis attribute IOB of dac1_out is TRUE
//always @(posedge clk357) dac1_clk <= k1_dac_en; //synthesis attribute IOB of dac1_clk is TRUE


// Multiplex strobes
//wire [5:0]  cr_k2_bunch_strb_sel;
//wire			k2_low_lat_strb;
//wire			k2_high_lat_strb;
//assign k2_high_lat_strb = cr_k2_bunch_strb_sel[0] ? p1_bunch_strb_a :
//								  cr_k2_bunch_strb_sel[1] ? p2_bunch_strb_a :
//								  p3_bunch_strb_a;
//assign k2_low_lat_strb = cr_k2_bunch_strb_sel[3] ? p1_bunch_strb_a :
//								 cr_k2_bunch_strb_sel[4] ? p2_bunch_strb_a :
//								 p3_bunch_strb_a;		

// **** P3 to K2 feedback ****
//reg [12:0]  cr_k2_const_dac_out;
wire			cr_k2_const_dac_en;
wire			cr_k2_fb_en;
wire			cr_k2_delay_loop_en;
wire			k2_p2_lut_wr_en;
wire			k2_p3_lut_wr_en;
//wire [12:0] k2_dac_out;
//wire 			k2_dac_en;
reg  [12:0] cr_k2_b2_offset;
reg  [12:0] cr_k2_b3_offset;
wire [6:0]  cr_k2_fir_k1;
/*coupled_data_processing K2_FB ( 
	.clk(clk357),
	.rst(dcm200_rst),	
	.slow_clk(clk40), 
	.p2_sigma_in(p2_sum_data), 
	.p2_delta_in(p2_ydif_data), 
	.p3_sigma_in(p3_sum_data), 
	.p3_delta_in(p3_ydif_data),
	.store_strb(p3_store_strb), 
	.p2_bunch_strb(p2_bunch_strb_a), 
	.p3_bunch_strb(p3_bunch_strb_a), 
	.feedbck_en(cr_k2_fb_en), 
	.delay_loop_en(cr_k2_delay_loop_en), 
	.const_dac_en(cr_k2_const_dac_en), 
	.const_dac_out(cr_k2_const_dac_out), 
	.b2_offset(cr_k2_b2_offset),
	.b3_offset(cr_k2_b3_offset),
	.fir_k1(cr_k2_fir_k1),
	.p2_lut_dinb(gainlut_ld_data), 
	.p2_lut_addrb(gainlut_ld_addr),
	.p2_lut_web(k2_p2_lut_wr_en), 
	.p2_lut_doutb(),
	.p3_lut_dinb(gainlut_ld_data), 
	.p3_lut_addrb(gainlut_ld_addr),
	.p3_lut_web(k2_p3_lut_wr_en), 
	.p3_lut_doutb(),
	.amp_drive(k2_dac_out), 
	.dac_en(k2_dac_en)
);*/
coupled_data_processing2 K2_FB ( 
	.clk(clk357),
	.rst(dcm200_rst),	
	.slow_clk(clk40), 
	`ifdef BUILD_ATF2IP_2BPM //IPFB mod 21/4/16
		//.p2_sigma_in(p2_xdif_data),
		.p2_sigma_in(Chan6switch ? p2_sum_data : ch9_nodelay),
		//.p2_delta_in(p3_xdif_data),
		.p2_delta_in(p2_ydif_data),
		.p3_sigma_in(p3_sum_data), 
		.p3_delta_in(p3_xdif_data),
	`else
		.p2_sigma_in(p2_sum_data), 
		//.p2_sigma_in(p2_xdif_data), 
		.p2_delta_in(p2_ydif_data), 
		.p3_sigma_in(p3_sum_data), 
		.p3_delta_in(p3_ydif_data),
	`endif
	.store_strb(p3_store_strb), 
	.p2_bunch_strb(p2_bunch_strb_a), 
	.p3_bunch_strb(p3_bunch_strb_a), 
	.feedbck_en(cr_k2_fb_en), 
	.delay_loop_en(cr_k2_delay_loop_en), 
	.const_dac_en(cr_k2_const_dac_en), 
	`ifdef DIGIN_UART_RX
		.const_dac_out(k2constDAC),
	`else
		.const_dac_out(cr_k2_const_dac_out),
	`endif
	.b2_offset(cr_k2_b2_offset),
	.b3_offset(cr_k2_b3_offset),
	.fir_k1(cr_k2_fir_k1),
	.p2_lut_dinb(gainlut_ld_data), 
	.p2_lut_addrb(gainlut_ld_addr),
	.p2_lut_web(k2_p2_lut_wr_en), 
	.p2_lut_doutb(),
	.p3_lut_dinb(gainlut_ld_data), 
	.p3_lut_addrb(gainlut_ld_addr),
	.p3_lut_web(k2_p3_lut_wr_en), 
	.p3_lut_doutb(),
	.amp_drive(k2_dac_out), 
	.dac_en(k2_dac_en)
);
//data_processing P3_to_K2_FB ( 
//	.clk(clk357), 
//	.rst(dcm200_rst),
//	.slow_clk(clk40), 
//	.sigma_in(p3_sum_data), 
//	.delta_in(p3_ydif_data), 
//	.store_strb(p3_store_strb), 
//	.bunch_strb(p3_bunch_strb_a), 
//	.feedbck_en(cr_k2_fb_en), 
//	.delay_loop_en(cr_k2_delay_loop_en), 
//	.const_dac_en(cr_k2_const_dac_en), 
//	.const_dac_out(cr_k2_const_dac_out),  
//	.b2_offset(cr_k2_b2_offset),
//	.b3_offset(cr_k2_b3_offset),
//	.fir_k1(cr_k2_fir_k1),
//	.lut_dinb(gainlut_ld_data), 
//	.lut_addrb(gainlut_ld_addr),
//	.lut_web(p3_lut_wr_en), 
//	.lut_doutb(),
//	.amp_drive(k2_dac_out), 
//	.dac_en(k2_dac_en) 
//);

// **** Assign to two DAC outputs ****
//assign dac2_out = k2_dac_out;
//assign dac4_out = k2_dac_out;
//assign dac2_clk = k2_dac_en;
//assign dac4_clk = k2_dac_en;

`ifdef BUILD_ATF2IP_2BPM
assign dac_sum = k1_dac_out + k2_dac_out;
always @(posedge clk357) begin
	dac2_out <= dac_sum[13:1];
	dac2_clk <= k2_dac_en;
	dac1_out <= dac_sum[13:1];
	dac1_clk <= k1_dac_en;
	end
`else
always @(posedge clk357) begin
	dac2_out <= k2_dac_out; //synthesis attribute IOB of dac2_out is TRUE
	dac2_clk <= k2_dac_en; //synthesis attribute IOB of dac2_clk is TRUE
	dac1_out <= k1_dac_out; //synthesis attribute IOB of dac1_out is TRUE
	dac1_clk <= k1_dac_en; //synthesis attribute IOB of dac1_clk is TRUE
	end
`endif

// %%%%%%%%%%%%%%%%%%%%%%%%   DAQ SEQUENCER CONTROL    %%%%%%%%%%%%%%%%%%%%%
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

// State machine keeps track of the current transmission state, transmits
// timestamp and framing bytes, and enables DAQ_RAM transmission as appropriate
// The sequence begins on the falling edge of store strobe

// Sequence state parametrisation
parameter TRANS_WAIT = 				6'd0;
parameter TRANS_STAMP =				6'd2;
parameter TRANS_P1_XDIF = 			6'd4;
parameter TRANS_P1_YDIF = 			6'd6;
parameter TRANS_P1_SUM = 			6'd8;
parameter TRANS_P2_XDIF = 			6'd10;
parameter TRANS_P2_YDIF = 			6'd12;
parameter TRANS_P2_SUM = 			6'd14;
parameter TRANS_P3_XDIF = 			6'd16;
parameter TRANS_P3_YDIF = 			6'd18;
parameter TRANS_P3_SUM = 			6'd20;
parameter TRANS_DAC_K1 = 			6'd22;
parameter TRANS_DAC_K2 = 			6'd24;
parameter TRANS_357_RB =			6'd26;
parameter TRANS_40_RB =				6'd28;
parameter TRANS_MON_RB = 			6'd30;

// Control register readback control wires
wire			daq_readback357_tx_done;
wire			daq_readback357_tx_load;
wire [7:0]	daq_readback357_tx_data;
reg			daq_readback357_tx_en;
wire			daq_readback40_tx_done;
wire			daq_readback40_tx_load;
wire [7:0]	daq_readback40_tx_data;
reg			daq_readback40_tx_en;

// Monitor readback control wires
wire			daq_readback_mon_tx_done;
wire			daq_readback_mon_tx_load;
wire [7:0]	daq_readback_mon_tx_data;
reg			daq_readback_mon_tx_en;

wire [5:0]  daq_trans_state;
wire 			daq_ram_tx_en;
reg 			current_daq_ram_tx_done;
wire [7:0] 	daq_seq_tx_data;
wire 			daq_seq_tx_ld;
wire 			trig_rdy; //added by GBC 11/11/15 for use with BoardSynchroniser
DAQ_sequencer DAQ_sequencer1(
	.clk40(clk40_ibufg),
//	.clk40(clk40),
	.rst(dcm200_rst),
	.strobe(p1_store_strb),
	.trans_done(current_daq_ram_tx_done),
	.trans_state(daq_trans_state),
	.trans_en(daq_ram_tx_en),
	.rst_out(daq_ram_rst),
	.trig_rdy(trig_rdy),	//added by GBC 11/11/15 for use with BoardSynchroniser
	.rs232_tx_empty(uart_tx_empty),
	.rs232_tx_buffer(daq_seq_tx_data),
	.rs232_tx_ld(daq_seq_tx_ld)
);

// %%%%%%%%%%%%%   (DE)MULTIPLEX THE DAQ_RAM TX CONTROL SIGNALS   %%%%%%%%%%
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
always @(posedge clk40) begin
	daq_p1_xdif_tx_en <= 0;
	daq_p1_ydif_tx_en <= 0;
	daq_p1_sum_tx_en  <= 0;
	daq_p2_xdif_tx_en <= 0;
	daq_p2_ydif_tx_en <= 0;
	daq_p2_sum_tx_en  <= 0;
	daq_p3_xdif_tx_en <= 0;
	daq_p3_ydif_tx_en <= 0;
	daq_p3_sum_tx_en  <= 0;
	daq_dac1_tx_en		<= 0;
	daq_dac3_tx_en 	<= 0;
	daq_readback357_tx_en 	<= 0;
	daq_readback40_tx_en		<= 0;
	daq_readback_mon_tx_en 	<= 0;
	case(daq_trans_state)
		TRANS_P1_XDIF : daq_p1_xdif_tx_en <= daq_ram_tx_en;
		TRANS_P1_YDIF : daq_p1_ydif_tx_en <= daq_ram_tx_en;
		TRANS_P1_SUM  : daq_p1_sum_tx_en  <= daq_ram_tx_en;
		TRANS_P2_XDIF : daq_p2_xdif_tx_en <= daq_ram_tx_en;
		TRANS_P2_YDIF : daq_p2_ydif_tx_en <= daq_ram_tx_en;
		TRANS_P2_SUM  : daq_p2_sum_tx_en  <= daq_ram_tx_en;
		TRANS_P3_XDIF : daq_p3_xdif_tx_en <= daq_ram_tx_en;
		TRANS_P3_YDIF : daq_p3_ydif_tx_en <= daq_ram_tx_en;
		TRANS_P3_SUM  : daq_p3_sum_tx_en  <= daq_ram_tx_en;
		TRANS_DAC_K1  : daq_dac1_tx_en	 <= daq_ram_tx_en;
		TRANS_DAC_K2  : daq_dac3_tx_en	 <= daq_ram_tx_en;
		TRANS_357_RB  : daq_readback357_tx_en 		<= daq_ram_tx_en;
		TRANS_40_RB   : daq_readback40_tx_en  		<= daq_ram_tx_en;
		TRANS_MON_RB  : daq_readback_mon_tx_en  	<= daq_ram_tx_en;
	endcase
end
	
always @(posedge clk40) begin
	case(daq_trans_state)
		TRANS_P1_XDIF : current_daq_ram_tx_done <= daq_p1_xdif_tx_done;
		TRANS_P1_YDIF : current_daq_ram_tx_done <= daq_p1_ydif_tx_done;
		TRANS_P1_SUM  : current_daq_ram_tx_done <= daq_p1_sum_tx_done;
		TRANS_P2_XDIF : current_daq_ram_tx_done <= daq_p2_xdif_tx_done;
		TRANS_P2_YDIF : current_daq_ram_tx_done <= daq_p2_ydif_tx_done;
		TRANS_P2_SUM  : current_daq_ram_tx_done <= daq_p2_sum_tx_done;
		TRANS_P3_XDIF : current_daq_ram_tx_done <= daq_p3_xdif_tx_done;
		TRANS_P3_YDIF : current_daq_ram_tx_done <= daq_p3_ydif_tx_done;
		TRANS_P3_SUM  : current_daq_ram_tx_done <= daq_p3_sum_tx_done;
		TRANS_DAC_K1  : current_daq_ram_tx_done <= daq_dac1_tx_done;
		TRANS_DAC_K2  : current_daq_ram_tx_done <= daq_dac3_tx_done;
		TRANS_357_RB  : current_daq_ram_tx_done <= daq_readback357_tx_done;
		TRANS_40_RB   : current_daq_ram_tx_done <= daq_readback40_tx_done;
		TRANS_MON_RB  : current_daq_ram_tx_done <= daq_readback_mon_tx_done;
		default		  : current_daq_ram_tx_done <= 0;
	endcase
end

// %%%%%%%%%%%%%%%%%%   MULITPLEX UART TX SIGNALS FOR DAQ   %%%%%%%%%%%%%%%%
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
reg 			uart_tx_load;
reg  [7:0]	uart_tx_data;

always @(posedge clk40) begin
	case(daq_trans_state)
		TRANS_P1_XDIF : uart_tx_load <= daq_p1_xdif_tx_load;
		TRANS_P1_YDIF : uart_tx_load <= daq_p1_ydif_tx_load;
		TRANS_P1_SUM  : uart_tx_load <= daq_p1_sum_tx_load;
		TRANS_P2_XDIF : uart_tx_load <= daq_p2_xdif_tx_load;
		TRANS_P2_YDIF : uart_tx_load <= daq_p2_ydif_tx_load;
		TRANS_P2_SUM  : uart_tx_load <= daq_p2_sum_tx_load;
		TRANS_P3_XDIF : uart_tx_load <= daq_p3_xdif_tx_load;
		TRANS_P3_YDIF : uart_tx_load <= daq_p3_ydif_tx_load;
		TRANS_P3_SUM  : uart_tx_load <= daq_p3_sum_tx_load;
		TRANS_DAC_K1  : uart_tx_load <= daq_dac1_tx_load;
		TRANS_DAC_K2  : uart_tx_load <= daq_dac3_tx_load;
		TRANS_357_RB  : uart_tx_load <= daq_readback357_tx_load;
		TRANS_40_RB   : uart_tx_load <= daq_readback40_tx_load;
		TRANS_MON_RB  : uart_tx_load <= daq_readback_mon_tx_load;
		//By default pass the sequencer's load signal
		default		  : uart_tx_load <= daq_seq_tx_ld;
	endcase
end

always @(posedge clk40) begin
	case(daq_trans_state)
		TRANS_P1_XDIF : uart_tx_data <= daq_p1_xdif_tx_data;
		TRANS_P1_YDIF : uart_tx_data <= daq_p1_ydif_tx_data;
		TRANS_P1_SUM  : uart_tx_data <= daq_p1_sum_tx_data;
		TRANS_P2_XDIF : uart_tx_data <= daq_p2_xdif_tx_data;
		TRANS_P2_YDIF : uart_tx_data <= daq_p2_ydif_tx_data;
		TRANS_P2_SUM  : uart_tx_data <= daq_p2_sum_tx_data;
		TRANS_P3_XDIF : uart_tx_data <= daq_p3_xdif_tx_data;
		TRANS_P3_YDIF : uart_tx_data <= daq_p3_ydif_tx_data;
		TRANS_P3_SUM  : uart_tx_data <= daq_p3_sum_tx_data;
		TRANS_DAC_K1  : uart_tx_data <= daq_dac1_tx_data;
		TRANS_DAC_K2  : uart_tx_data <= daq_dac3_tx_data;
		TRANS_357_RB  : uart_tx_data <= daq_readback357_tx_data;
		TRANS_40_RB   : uart_tx_data <= daq_readback40_tx_data;
		TRANS_MON_RB  : uart_tx_data <= daq_readback_mon_tx_data;
		//By default pass the sequencer's data signal
		default		  : uart_tx_data <= daq_seq_tx_data;
	endcase
end

// %%%%%%%%%%%%%%%%%%%   UART AND CONTROL REGISTERS   %%%%%%%%%%%%%%%%%%%%%%
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

// **** Generate 115200 baud from the 40MHz clock ****
// **** MODIFIED FOR 460800 BAUD ****

reg 			baud_115200;
reg [7:0]	baud_cnt;
always @(posedge clk40 or posedge dcm200_rst) begin
	if (dcm200_rst) begin
		baud_115200 <= 0;
		baud_cnt <= 0;
	end else begin 
		//
		//if (baud_cnt == 8'd174) begin
		//if (baud_cnt == 8'd87) begin
		if (baud_cnt == 8'd43) begin
			baud_115200 <= ~baud_115200;
			baud_cnt <= 0;
		end else begin
			baud_cnt <= baud_cnt + 1;
		end
	end
end

// **** Instantiate UART ****
wire 			uart_rx_unload;
wire 			uart_rx_empty;
wire [7:0] 	uart_rx_data;

//uart115200 uart1 (
uart uart1 (		
	.reset(dcm200_rst),
	.txclk(baud_115200),
	.ld_tx_data(uart_tx_load),
	.tx_data(uart_tx_data),
	.tx_enable(1'b1),
	.tx_out(rs232_out),
	.tx_empty(uart_tx_empty),
	.rxclk(clk40_ibufg),
	.uld_rx_data(uart_rx_unload),
	.rx_data(uart_rx_data),
	.rx_enable(1'b1),
	.rx_in(rs232_in),
	.rx_empty(uart_rx_empty)
);

	
// **** Instantiate UART decoder ****
wire [4:0] 	ctrl_reg_addr_357;
wire [6:0] 	ctrl_reg_data_357;
wire 			ctrl_reg_strb_357;
wire [4:0] 	ctrl_reg_addr_40;
wire [6:0] 	ctrl_reg_data_40;
wire 			ctrl_reg_strb_40;
wire			gainlut_ld_en;
wire [4:0]	gainlut_ld_select;
wire 			trim_lut_wr_en;
wire			trim_dac_trig;

uart_decoder uart_decoder1 (	
	.clk40(clk40_ibufg),
	.rst(dcm200_rst),
	.byte(uart_rx_data),
	.byte_ready(~uart_rx_empty),
	.byte_unload(uart_rx_unload),
	.current_addr_357(ctrl_reg_addr_357),
	.data_strobe_357(ctrl_reg_strb_357),
	.data_out_357(ctrl_reg_data_357),
	.current_addr_40(ctrl_reg_addr_40),
	.data_strobe_40(ctrl_reg_strb_40),
	.data_out_40(ctrl_reg_data_40),
	.ram_addr(gainlut_ld_addr),
	.ram_select(gainlut_ld_select),	
	.ram_data(gainlut_ld_data),
	.ram_data_strobe(gainlut_ld_en),
	.full_reset(full_rst_trig),
	.p1_delay_trig(p1_delay_trig),
	.p2_delay_trig(p2_delay_trig),
	.p3_delay_trig(p3_delay_trig),
	.clk357_idelay_rst(clk357_idelay_rst),
	.clk357_idelay_trig(clk357_idelay_trig),
	.trim_dac_trig(trim_dac_trig)
	//.trim_dac_trig(trim_dac_trig),
	//.pulse_ctr_rst(pulse_ctr_rst)
);	 

// **** Multiplex the gain lut load strobe ****
assign k1_p2_lut_wr_en = (gainlut_ld_select == 5'd0) ? gainlut_ld_en : 1'b0;
assign k1_p3_lut_wr_en = (gainlut_ld_select == 5'd1) ? gainlut_ld_en : 1'b0;
assign trim_lut_wr_en = (gainlut_ld_select == 5'd2) ? gainlut_ld_en : 1'b0;
assign k2_p2_lut_wr_en = (gainlut_ld_select == 5'd3) ? gainlut_ld_en : 1'b0;
assign k2_p3_lut_wr_en = (gainlut_ld_select == 5'd4) ? gainlut_ld_en : 1'b0;

// **** Instantiate the 40MHz control registers ****
wire [6:0] diginput1_code,  diginput2_code;
wire [12:0] tmp_a_k1_b2_offset, tmp_a_k1_b3_offset;
reg  [12:0] tmp_b_k1_b2_offset, tmp_b_k1_b3_offset;
reg  [12:0] tmp_c_k1_b2_offset, tmp_c_k1_b3_offset;
wire [12:0] tmp_a_k2_b2_offset, tmp_a_k2_b3_offset;
reg  [12:0] tmp_b_k2_b2_offset, tmp_b_k2_b3_offset;
reg  [12:0] tmp_c_k2_b2_offset, tmp_c_k2_b3_offset;
wire [6:0] 	tmp_a_p1_offset, tmp_a_p2_offset, tmp_a_p3_offset;
reg  [6:0]  tmp_b_p1_offset, tmp_b_p2_offset, tmp_b_p3_offset;
font5_ctrl_reg_40 font5_ctrl_reg_40_1 (
	.clk(clk40),
	.rst(dcm200_rst),
	.addr(ctrl_reg_addr_40),
	.data(ctrl_reg_data_40),
	.data_strb(ctrl_reg_strb_40),
	.tx_en(daq_readback40_tx_en),
	.tx_clk(clk40),
	.tx_data_ready(daq_readback40_tx_load),
	.tx_data(daq_readback40_tx_data),
	.tx_data_loaded(~uart_tx_empty),
	.tx_complete(daq_readback40_tx_done),
	//.p1_align_ch_sel(cr_p1_align_ch_sel),
	//.p2_align_ch_sel(cr_p2_align_ch_sel),
	//.p3_align_ch_sel(cr_p3_align_ch_sel),
	`ifdef DIGIN_UART_RX
		.p1_align_ch_sel({constDAC1UARTor, cr_sr1_tap}), // For SR variant //modified 16/6/16 for doug Special version
		.p2_align_ch_sel({constDAC2UARTor, cr_sr2_tap}), // For SR variant //modified 16/6/16 for doug Special version
	`else
		.p1_align_ch_sel(cr_sr1_tap), // For SR variant
		.p2_align_ch_sel(cr_sr2_tap), // For SR variant
	`endif
	`ifdef UART2_SELF_TEST
		.p3_align_ch_sel({uart2_tx_en, cr_sr3_tap}), // For SR variant //modified 16/6/16 for doug Special version
	`else
		.p3_align_ch_sel(cr_sr3_tap), // For SR variant
	`endif
	.p1_offset_delay(tmp_a_p1_offset),
	.p2_offset_delay(tmp_a_p2_offset),
	.p3_offset_delay(tmp_a_p3_offset),
	.p1_scan_delay(cr_p1_scan_delay),
	.p2_scan_delay(cr_p2_scan_delay),
	.p3_scan_delay(cr_p3_scan_delay),
	.master357_delay(clk357_idelay_value),
	.k1_b2_offset(tmp_a_k1_b2_offset),
	.k1_b3_offset(tmp_a_k1_b3_offset),
	.ring_clk_thresh_code(diginput1_code),
	.trig_thresh_code(diginput2_code),
	.k1_fir_k1(cr_k1_fir_k1),
	.k2_b2_offset(tmp_a_k2_b2_offset),
	.k2_b3_offset(tmp_a_k2_b3_offset),
	.k2_fir_k1(cr_k2_fir_k1),
	.k1_bunch_strb_sel(cr_k1_bunch_strb_sel)
	//.slow_clk_gate_en(slow_clk_gate_en)
//	.k2_bunch_strb_sel(cr_k2_bunch_strb_sel)
);
// Register for timing
always @(posedge clk357) begin
	tmp_b_p1_offset <= tmp_a_p1_offset;
		// synthesis attribute shreg_extract of tmp_b_p1_offset is "no";
	tmp_b_p2_offset <= tmp_a_p2_offset;
		// synthesis attribute shreg_extract of tmp_b_p2_offset is "no";
	tmp_b_p3_offset <= tmp_a_p3_offset;
		// synthesis attribute shreg_extract of tmp_b_p3_offset is "no";
	cr_p1_offset_delay <= tmp_b_p1_offset;
		// synthesis attribute shreg_extract of cr_p1_offset_delay is "no";
	cr_p2_offset_delay <= tmp_b_p2_offset;
		// synthesis attribute shreg_extract of cr_p2_offset_delay is "no";
	cr_p3_offset_delay <= tmp_b_p3_offset;
		// synthesis attribute shreg_extract of cr_p3_offset_delay is "no";

	cr_k1_b2_offset <= tmp_c_k1_b2_offset;
		// synthesis attribute shreg_extract of cr_k1_b2_offset is "no";
	cr_k1_b3_offset <= tmp_c_k1_b3_offset;
		// synthesis attribute shreg_extract of cr_k1_b3_offset is "no";		
	tmp_c_k1_b2_offset <= tmp_b_k1_b2_offset;
		// synthesis attribute shreg_extract of tmp_c_k1_b2_offset is "no";
	tmp_c_k1_b3_offset <= tmp_b_k1_b3_offset;
		// synthesis attribute shreg_extract of tmp_c_k1_b3_offset is "no";		
	tmp_b_k1_b2_offset <= tmp_a_k1_b2_offset;
		// synthesis attribute shreg_extract of tmp_b_k1_b2_offset is "no";
	tmp_b_k1_b3_offset <= tmp_a_k1_b3_offset;
		// synthesis attribute shreg_extract of tmp_b_k1_b3_offset is "no";


	cr_k2_b2_offset <= tmp_c_k2_b2_offset;
		// synthesis attribute shreg_extract of cr_k2_b2_offset is "no";
	cr_k2_b3_offset <= tmp_c_k2_b3_offset;
		// synthesis attribute shreg_extract of cr_k2_b3_offset is "no";		
	tmp_c_k2_b2_offset <= tmp_b_k2_b2_offset;
		// synthesis attribute shreg_extract of tmp_c_k2_b2_offset is "no";
	tmp_c_k2_b3_offset <= tmp_b_k2_b3_offset;
		// synthesis attribute shreg_extract of tmp_c_k2_b3_offset is "no";		
	tmp_b_k2_b2_offset <= tmp_a_k2_b2_offset;
		// synthesis attribute shreg_extract of tmp_b_k2_b2_offset is "no";
	tmp_b_k2_b3_offset <= tmp_a_k2_b3_offset;
		// synthesis attribute shreg_extract of tmp_b_k2_b3_offset is "no";
end

// **** Instantiate the 357MHz control registers ****
wire [12:0] temp_k1_const_dac_out;
wire [12:0] temp_k2_const_dac_out;
font5_ctrl_reg_357 font4_ctrl_reg_357_1 (
	.clk(clk357),
	.rst(dcm200_rst),
	.addr(ctrl_reg_addr_357),
	.data(ctrl_reg_data_357),
	.data_strb(ctrl_reg_strb_357),
	.tx_en(daq_readback357_tx_en),
	.tx_clk(clk40),
	.tx_data_ready(daq_readback357_tx_load),
	.tx_data(daq_readback357_tx_data),
	.tx_data_loaded(~uart_tx_empty),
	.tx_complete(daq_readback357_tx_done),
	.trig_delay(),					
	.trig_out_delay(cr_trig_out_delay),	
	.trig_out_delay2(cr_trig_out_delay2),	
	.trig_out_en(cr_trig_out_en),		
	.p1_bunch1pos(cr_p1_b1_pos),			
	.p1_bunch2pos(cr_p1_b2_pos),			
	.p1_bunch3pos(cr_p1_b3_pos),			
	.p2_bunch1pos(cr_p2_b1_pos),			
	.p2_bunch2pos(cr_p2_b2_pos),			
	.p2_bunch3pos(cr_p2_b3_pos),
	.p3_bunch1pos(cr_p3_b1_pos),			
	.p3_bunch2pos(cr_p3_b2_pos),			
	.p3_bunch3pos(cr_p3_b3_pos),	
	.k1_fb_on(cr_k1_fb_en),				
	.k2_fb_on(cr_k2_fb_en),				
	.k1_delayloop_on(cr_k1_delay_loop_en),			
	.k2_delayloop_on(cr_k2_delay_loop_en),			
	.k1_const_dac_en(cr_k1_const_dac_en),			
	.k2_const_dac_en(cr_k2_const_dac_en),			
	.k1_const_dac_out(temp_k1_const_dac_out),		
	.k2_const_dac_out(temp_k2_const_dac_out),		
	.clk2_16_edge_sel(cr_clk2_16_edge_sel),
	.sample_hold_off(cr_sample_hold_off),
	.big_trig_delay(cr_trig_delay)
	//.sync_en(sync_en)
);

// **** Register the const_dac outputs for timing and ****
always @(posedge clk357) begin
	cr_k1_const_dac_out <= temp_k1_const_dac_out;
	cr_k2_const_dac_out <= temp_k2_const_dac_out;
	`ifdef DIGIN_UART_RX
		//uart2_rx_data_a <= uart2_rx_data;
		//uart2_rx_data_b <= uart2_rx_data_a;
		constDAC1UARTor_b <= constDAC1UARTor_a;
		constDAC1UARTor_a <= constDAC1UARTor;
		constDAC2UARTor_b <= constDAC2UARTor_a;
		constDAC2UARTor_a <= constDAC2UARTor;
	`endif
end

// %%%%%%%%%%%%%%%%%%%%%%%% BOARD SYNCHRONISER %%%%%%%%%%%%%%%%%%%%%%%%%%%%
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
//added by GBC 11/11/15

wire [1:0] syncStatus;
wire syncOut;
boardSynchroniser3 #(6) synchro1(clk40, 1'b1, trig_rdy, 6'd36, 6'd63, auxInA, syncOut, syncStatus[0], syncStatus[1]);
//`ifdef SWAP_AUXOUT_BC
//	assign auxOutB2 = syncOut;
//	assign auxOutC = 1'bz;
//`else
	assign auxOutC = syncOut;
//`endif


// %%%%%%%%%%%%%%%%%%%%%%   READBACK MONITORS FOR DAQ  %%%%%%%%%%%%%%%%%%%%%
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

// Load important monitor signals into monitor_readback.  They are transmitted
// as part of the DAQ
// 357MHz signals registered to aid timing
wire [6:0] status;
//reg pll_clk357_locked_a, dcm200_locked_a, idelayctrl_rdy_a; //clk_align_a, clk_align_b;
//reg pll_clk357_locked_a, idelayctrl_rdy_a; //clk_align_a, clk_align_b;
reg idelayctrl_rdy_a;

`ifdef CLK357_PLL
	reg pll_clk357_locked_a;
`endif

always @(posedge clk357) begin
	`ifdef CLK357_PLL
		pll_clk357_locked_a <= pll_clk357_locked;
	`endif
	dcm200_locked_a <= dcm200_locked;
	idelayctrl_rdy_a <= idelayctrl_rdy;
	//clk_align_a <= clk_align;
	//clk_align_b <= clk_align_a;
end
`ifdef CLK357_PLL
	assign status = {pll_clk357_locked_a, dcm200_locked_a, idelayctrl_rdy_a, led1_out, p3_mon_saturated, p2_mon_saturated, p1_mon_saturated};
`else
	assign status = {1'b0, dcm200_locked_a, idelayctrl_rdy_a, led1_out, p3_mon_saturated, p2_mon_saturated, p1_mon_saturated};
`endif

monitor_readback monitor_readback1 (
	.clk(clk40),
	.rst(dcm200_rst),
	.tx_en(daq_readback_mon_tx_en),
	.tx_clk(clk40),
	.tx_data_ready(daq_readback_mon_tx_load),
	.tx_data(daq_readback_mon_tx_data),
	.tx_data_loaded(~uart_tx_empty),
	.tx_complete(daq_readback_mon_tx_done),
	.rb0(status),
	.rb1(p1_mon_count1),
	.rb2(p1_mon_count2),
	.rb3(p1_mon_count3),
	.rb4({syncStatus[0], p1_mon_total_data_del}), //modified GBC 11/11/15 for use with BoardSynchroniser
	//.rb4({1'b0, p1_mon_total_data_del}),
	//.rb4({clk_align_b, p1_mon_total_data_del}),
	.rb5(p2_mon_count1),
	.rb6(p2_mon_count2),
	.rb7(p2_mon_count3),
	.rb8({syncStatus[1], p2_mon_total_data_del}), //modified GBC 11/11/15 for use with BoardSynchroniser
	//.rb8({1'b0, p2_mon_total_data_del}),
	.rb9(p3_mon_count1),
	.rb10(p3_mon_count2),
	.rb11(p3_mon_count3),
	.rb12({1'b0, p3_mon_total_data_del})
	//.rb12({1'b0, p3_mon_total_data_del}),
	//.rb13({pulse_ctr,1'b0})
	//.rb13({6'b000000,clk_align_b})
);


// %%%%%%%%%%%%%%%%%%%%%%%%%   TRIM DAC CONTROLS  %%%%%%%%%%%%%%%%%%%%%%%%%%
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

// Instantiate the control logic for the trim dacs
trim_dac_ctrl trims (
	.clk40(clk40),
	.rst(dcm200_rst),
	.lut_in(gainlut_ld_data),
	.lut_addr(gainlut_ld_addr[4:0]),
	.lut_we(trim_lut_wr_en),
	.load_dacs(trim_dac_trig),
	.serial_out(trim_sdi),
	.clk_out(trim_sck),
	.enable_out(trim_cs_ld)
);



// %%%%%%%%%%%%%%%%%%%% DIGITAL INPUT THRESHOLDS  %%%%%%%%%%%%%%%%%%%%%%%%%%
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

// The digital inputs have variable thresholds.  Each has two control lines
// diginputnA/B.  The signals are tristate giving 9 values using 0,1,z
//
// The 4 bit code from the control regs specifies which combination
//
reg diginput1A, diginput1B;
always @(posedge clk40) begin
	case(diginput1_code[3:0])
		4'd0 : begin
			diginput1A <= 0;
			diginput1B <= 0;
		end
		4'd1 : begin
			diginput1A <= 1;
			diginput1B <= 0;
		end
		4'd2 : begin
			diginput1A <= 0;
			diginput1B <= 1;
		end
		4'd3 : begin
			diginput1A <= 1;
			diginput1B <= 1;
		end
		4'd4 : begin
			diginput1A <= 1'bz;
			diginput1B <= 0;
		end
		4'd5 : begin
			diginput1A <= 0;
			diginput1B <= 1'bz;
		end
		4'd6 : begin
			diginput1A <= 1'bz;
			diginput1B <= 1;
		end
		4'd7 : begin
			diginput1A <= 1;
			diginput1B <= 1'bz;
		end
		default : begin
			diginput1A <= 1'bz;
			diginput1B <= 1'bz;
		end
	endcase
end


reg diginput2A, diginput2B;
always @(posedge clk40) begin
	case(diginput2_code[3:0])
		4'd0 : begin
			diginput2A <= 0;
			diginput2B <= 0;
		end
		4'd1 : begin
			diginput2A <= 1;
			diginput2B <= 0;
		end
		4'd2 : begin
			diginput2A <= 0;
			diginput2B <= 1;
		end
		4'd3 : begin
			diginput2A <= 1;
			diginput2B <= 1;
		end
		4'd4 : begin
			diginput2A <= 1'bz;
			diginput2B <= 0;
		end
		4'd5 : begin
			diginput2A <= 0;
			diginput2B <= 1'bz;
		end
		4'd6 : begin
			diginput2A <= 1'bz;
			diginput2B <= 1;
		end
		4'd7 : begin
			diginput2A <= 1;
			diginput2B <= 1'bz;
		end
		default : begin
			diginput2A <= 1'bz;
			diginput2B <= 1'bz;
		end
	endcase
end


// %%%%%%%%%%%%%%%%%%%   CHIPSCOPE CORES FOR DEBUGGING   %%%%%%%%%%%%%%%%%%%
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/*
// **** ICON controller ****
  wire [35:0] control0;
  wire [35:0] control1;
  wire [35:0] control2;
  font5_icon i_font5_icon
    (
      .control0(control0),
      .control1(control1),
      .control2(control2)
    );

// **** VIO I/O ****
  wire [127:0] async_in;
  wire [127:0] async_out;
  font5_vio i_font5_vio
    (
      .control(control0),
      .async_in(async_in),
      .async_out(async_out)
    );
	 
// **** ILA for P1 data ****
  wire [47:0] ila_p1_data_trig;
  font5_p1_ila i_font5_p1_ila
    (
      .control(control1),
      .clk(clk357),
      .trig0(ila_p1_data_trig)
    );
	//assign ila_p1_data_trig = {18'b0, p1_xdif_data, p1_store_strb};
	assign ila_p1_data_trig = {48'd0};

// **** ILA for p1 ADC block monitoring ****
  wire [41:0] ila_p1_monitor_trigger;
  font5_p1_mon_ila i_font5_p1_mon_ila
    (
      .control(control2),
      .clk(clk40),
      .trig0(ila_p1_monitor_trigger)
    );
//assign ila_p1_monitor_trigger ={p1_mon_total_drdy_del, p1_mon_total_data_del, p1_mon_delay_mod, p1_mon_count1, p1_mon_count2, p1_mon_count3, p1_mon_saturated, p1_mon_strb};
assign ila_p1_monitor_trigger ={42'd0};

// Assign VIO signals for debugging (128 bits for now)
//assign p1_xdif_polarity = async_out[12:0];
//assign p1_ydif_polarity = async_out[25:13];
//assign p1_sum_polarity  = async_out[38:26];
//assign cr_p1_offset_delay = async_out[5:0];
//assign trim_cnt_stop = async_out[8:0];
//assign trim_dac_addr = async_out[12:9];
//assign trim_dac_cmd = async_out[16:13];
//assign trim_ld_polarity = async_out[17];
//assign uart2_drive = async_out[7:0];

// Assign VIO signals to monitor (~128 bits total)
 /*assign async_in[5:0] = clk357_idelay_mon;
 assign async_in[6] = pll_clk357_locked;
 assign async_in[7] = dcm200_locked;
 assign async_in[8] = idelayctrl_rdy;
 assign async_in[15:9] = cr_trig_delay;					
 assign async_in[22:16] = cr_trig_out_delay;		
 assign async_in[23] = cr_trig_out_en;		
 assign async_in[24] = cr_clk2_16_edge_sel; 
 assign async_in[30:25] = cr_p1_offset_delay;
 assign async_in[36:31] = cr_p1_scan_delay;
 assign async_in[42:37] = p1_mon_adc_clk_del;*/
 //assign async_in[12:0] = uK1data;
 //assign async_in[25:13] = uK2data;
 //assign async_in[127:0] = 128'h0000000;
//output 	[7:0]		p1_bunch1pos;			
//output 	[7:0]		p1_bunch2pos;			
//output 	[7:0]		p1_bunch3pos;			
//output  	[7:0]		p2_bunch1pos;			
//output 	[7:0]		p2_bunch2pos;			
//output 	[7:0]		p2_bunch3pos;		
//output 	[7:0]		p3_bunch1pos;		
//output 	[7:0]		p3_bunch2pos;			
//output 	[7:0]		p3_bunch3pos;			
//output 				k1_fb_on;				
//output 				k2_fb_on;				
//output			 	k1_delayloop_on;			
//output 				k2_delayloop_on;			
//output 				k1_const_dac_en;			
//output 				k2_const_dac_en;			
//output 	[13:0]	k1_const_dac_out;		
//output  	[13:0]	k2_const_dac_out;		


`ifdef UART2_SELF_TEST
	wire [35:0] icon_ctrl;
	wire [25:0] sync_in = {uK1data, uK2data};

	icon2 icon2 (
		 .CONTROL0(icon_ctrl) // INOUT BUS [35:0]
	);

	vio2 vio2 (
		 .CONTROL(icon_ctrl), // INOUT BUS [35:0]
		 .CLK(clk40_ibufg), // IN
		 .SYNC_IN(sync_in), // IN BUS [25:0]
		 .SYNC_OUT(sync_out) // OUT BUS [7:0]
	);
`endif

endmodule

/*

module font5_icon 
  (
      control0,
      control1,
      control2
  );
  output [35:0] control0;
  output [35:0] control1;
  output [35:0] control2;
endmodule

module font5_vio
  (
    control,
    async_in,
    async_out
  );
  input  [35:0] control;
  input  [127:0] async_in;
  output [127:0] async_out;
endmodule

module font5_p1_ila
  (
    control,
    clk,
    trig0
  );
  input [35:0] control;
  input clk;
  input [47:0] trig0;
endmodule

module font5_p1_mon_ila
  (
    control,
    clk,
    trig0
  );
  input [35:0] control;
  input clk;
  input [41:0] trig0;
endmodule

*/

