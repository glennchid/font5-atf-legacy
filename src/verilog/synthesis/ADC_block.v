`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:41:25 07/13/2009 
// Design Name: 
// Module Name:    slign_mon
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
//
// Finalised 20/08/09.  The same as testVA version with added data paths



// ****************  ADC_BLOCK   **********************************************
//
// This module deals with the io delays on the adc clock and the adc data+drdy
// The data and data ready come from the adc directly and are fed through idelay
// The data idelay has a nominal value set by calibration and passed to this module
//
// This module takes the input (logic) 357 clock and puts it through an odelay
// to clock the adc
//
// The phase of the ADC clock is changed by varying scan_delay.  This is added to the adc
// clock delay and subtracted from the data delays to maintain the data phase wrt
// logic 357 clock
//
// Sending delay_trig high synchronous to 40MHz causes a change in data_offset_delay or
// scan_delay to be registered
//
// This module also implements the align_monitor module
// Works only when align_en is taken high
// This monitors the phase of the first drdy signal wrt logic 357, and if it drifts
// a correction is applied to the data idelays
//
// Saturated goes high if one of the delays tries to move beyond its limit
//
// Monitoring signals are exposed, along with a strobe delay_mod_changed
//
// Three ADCs are clocked by a single adc clock, so there are 3 data I/Os and
// 3 drdy inputs.  align_ch_sel can be used to select which drdy to pass to the
// alignment monitor, but all data paths are given the same delay

module adc_block(
	clk357,
	clk40,
	rst,
	align_en,
	align_ch_sel,
	ch1_drdy_n,
	ch2_drdy_n,
	ch3_drdy_n,
	ch1_drdy_p,
	ch2_drdy_p,
	ch3_drdy_p,
	ch1_data_in_n,
	ch2_data_in_n,
	ch3_data_in_n,
	ch1_data_in_p,
	ch2_data_in_p,
	ch3_data_in_p,
	data_offset_delay,
	scan_delay,
	delay_trig,
	ch1_data_out,
	ch2_data_out,
	ch3_data_out,
	saturated,
	adc_clk,
	total_drdy_delay,		//Monitoring
	total_data_delay,		//Monitoring
	delay_mod,				//Monitoring
	monitor_strb,			//Monitoring
	count1,					//Monitoring
	count2,					//Monitoring
	count3,					//Monitoring
	adc_clk_delay_mon		//Monitoring
);

input clk357;
input clk40;
input rst;
input align_en;
input [1:0] align_ch_sel;
input ch1_drdy_n;
input ch2_drdy_n;
input ch3_drdy_n;
input ch1_drdy_p;
input ch2_drdy_p;
input ch3_drdy_p;
input [12:0] ch1_data_in_n;
input [12:0] ch2_data_in_n;
input [12:0] ch3_data_in_n;
input [12:0] ch1_data_in_p;
input [12:0] ch2_data_in_p;
input [12:0] ch3_data_in_p;
input [6:0] data_offset_delay;
input [5:0] scan_delay;
input delay_trig;
output saturated;
output adc_clk;
output [5:0] total_drdy_delay;
output [5:0] total_data_delay;
output [6:0] delay_mod;
output monitor_strb;
output [6:0] count1;
output [6:0] count2;
output [6:0] count3;
output [12:0] ch1_data_out;
output [12:0] ch2_data_out;
output [12:0] ch3_data_out;
output [5:0] adc_clk_delay_mon;

wire ch1_drdy, ch2_drdy, ch3_drdy;
wire [12:0] ch1_data_in;
wire [12:0] ch2_data_in;
wire [12:0] ch3_data_in;

//Specify the IOB registers for the incoming data/drdy.  These have matching constraints
//to ensure the data are registered ASAP to reduce routing delays
//wire ch1_drdy_del, ch2_drdy_del, ch3_drdy_del;
wire [12:0] ch1_data_in_del;
wire [12:0] ch2_data_in_del;
wire [12:0] ch3_data_in_del;
reg ch1_drdy_reg, ch2_drdy_reg, ch3_drdy_reg;
// IOB of ch1_drdy_reg is TRUE
// IOB of ch2_drdy_reg is TRUE
// IOB of ch3_drdy_reg is TRUE
reg [12:0] ch1_data_in_reg;
reg [12:0] ch2_data_in_reg;
reg [12:0] ch3_data_in_reg;
//synthesis attribute IOB of ch1_data_in_reg is TRUE
//synthesis attribute IOB of ch2_data_in_reg is TRUE
//synthesis attribute IOB of ch3_data_in_reg is TRUE

//Pipeline stage
reg ch1_drdy_a, ch2_drdy_a, ch3_drdy_a;
reg [12:0] ch1_data_in_a;
reg [12:0] ch2_data_in_a;
reg [12:0] ch3_data_in_a;

// *****  Declare the DRDY input delay elements  ******
wire delay_calc_strb;
wire ch1_drdy_out, ch2_drdy_out, ch3_drdy_out;
wire adc_drdy_delay_ce;
	IODELAY # (
		.DELAY_SRC("I"),
		.HIGH_PERFORMANCE_MODE("TRUE"),
		.IDELAY_TYPE("VARIABLE"),
		.IDELAY_VALUE(0),
		.ODELAY_VALUE(0),
		.REFCLK_FREQUENCY(200.0),
		.SIGNAL_PATTERN("CLOCK")
	) ch1_drdy_idelay (
	.DATAOUT(ch1_drdy_out), 
	.C(clk40),
	.CE(adc_drdy_delay_ce), 
	.DATAIN(1'b0),		// Must be grounded
	.IDATAIN(ch1_drdy),
	.INC(1'b1), 		// Always increment
	.ODATAIN(),			// Unused
	.RST(delay_calc_strb | delay_trig),
	.T(1'b1) 			// 1==INPUT/INTERNAL	0==OUTPUT
	);
	IODELAY # (
		.DELAY_SRC("I"),
		.HIGH_PERFORMANCE_MODE("TRUE"),
		.IDELAY_TYPE("VARIABLE"),
		.IDELAY_VALUE(0),
		.ODELAY_VALUE(0),
		.REFCLK_FREQUENCY(200.0),
		.SIGNAL_PATTERN("CLOCK")
	) ch2_drdy_idelay (
	.DATAOUT(ch2_drdy_out), 
	.C(clk40),
	.CE(adc_drdy_delay_ce), 
	.DATAIN(1'b0),		// Must be grounded
	.IDATAIN(ch2_drdy),
	.INC(1'b1), 		// Always increment
	.ODATAIN(),			// Unused
	.RST(delay_calc_strb | delay_trig),
	.T(1'b1) 			// 1==INPUT/INTERNAL	0==OUTPUT
	);
	IODELAY # (
		.DELAY_SRC("I"),
		.HIGH_PERFORMANCE_MODE("TRUE"),
		.IDELAY_TYPE("VARIABLE"),
		.IDELAY_VALUE(0),
		.ODELAY_VALUE(0),
		.REFCLK_FREQUENCY(200.0),
		.SIGNAL_PATTERN("CLOCK")
	) ch3_drdy_idelay (
	.DATAOUT(ch3_drdy_out), 
	.C(clk40),
	.CE(adc_drdy_delay_ce), 
	.DATAIN(1'b0),		// Must be grounded
	.IDATAIN(ch3_drdy),
	.INC(1'b1), 		// Always increment
	.ODATAIN(),			// Unused
	.RST(delay_calc_strb | delay_trig),
	.T(1'b1) 			// 1==INPUT/INTERNAL	0==OUTPUT
	);	


// ***** Register the delayed signals in the IOB registers and pipeline *****
always @(posedge clk357 or posedge rst) begin
	if (rst) begin
		ch1_data_in_reg <= 0;
		ch2_data_in_reg <= 0;
		ch3_data_in_reg <= 0;
		ch1_data_in_a <= 0;
		ch2_data_in_a <= 0;
		ch3_data_in_a <= 0;
	end else begin
//		ch1_data_in_reg <= {~ch1_data_in_del[12], ch1_data_in_del[11:0]};
//		ch2_data_in_reg <= {~ch2_data_in_del[12], ch2_data_in_del[11:0]};
//		ch3_data_in_reg <= {~ch3_data_in_del[12], ch3_data_in_del[11:0]};
		ch1_data_in_reg <= ch1_data_in_del;
		ch2_data_in_reg <= ch2_data_in_del;
		ch3_data_in_reg <= ch3_data_in_del;
		ch1_data_in_a <= ch1_data_in_reg;
		ch2_data_in_a <= ch2_data_in_reg;
		ch3_data_in_a <= ch3_data_in_reg;
	end
end

// ***** Assign the delayed, registered and pipelined signals to outputs *****
// Invert data MSB to convert from offset binary to 2's complement
assign ch1_data_out = {~ch1_data_in_a[12], ch1_data_in_a[11:0]};
assign ch2_data_out = {~ch2_data_in_a[12], ch2_data_in_a[11:0]};
assign ch3_data_out = {~ch3_data_in_a[12], ch3_data_in_a[11:0]};
//assign ch1_data_out = ch1_data_in_reg;
//assign ch2_data_out = ch2_data_in_reg;
//assign ch3_data_out = ch3_data_in_reg;
//assign ch1_data_out = {~ch1_data_in_reg[12], ch1_data_in_reg[11:0]};
//assign ch2_data_out = {~ch2_data_in_reg[12], ch2_data_in_reg[11:0]};
//assign ch3_data_out = {~ch3_data_in_reg[12], ch3_data_in_reg[11:0]};

//DON'T FOR NOW
// *****  Multiplex the DRDY signals  *****
// sel = 0,1,2  =>  ch1,ch2,ch3
wire drdy;
//assign drdy = (align_ch_sel == 0) ? ch1_drdy_out : ( (align_ch_sel == 1) ? ch2_drdy_out : ch3_drdy_out);
assign drdy = ch1_drdy_out;
	
//The delay calculator takes one 40MHz cycle to register the result
//of its calculation.  Register its strobe, and use it to trigger the
//delay incrementors after a cycle.  Also accept the delay_trig
reg iodelay_cnt_trig;
always @(posedge clk40) iodelay_cnt_trig <= (delay_calc_strb | delay_trig);
//Do the same for the monitor strobe
reg monitor_strb;
wire monitor_strb_in;
always @(posedge clk40) monitor_strb <= monitor_strb_in;

// *****  Instantiate the drdy delay incrementor  *****
wire [5:0] adc_drdy_delay;
iodelay_incrementor drdy_idelay_inc(
	.clk40(clk40),
	.rst(delay_calc_strb | delay_trig),			//This reset line goes high one cycle before the strb
	.count_trig(iodelay_cnt_trig),
	.spec_delay(adc_drdy_delay),
	.inc_en(adc_drdy_delay_ce),
	.actual_delay()
);

// *****  Declare the adc_clock output delay element  ******
wire adc_clk_delay_ce;
	IODELAY # (
		.DELAY_SRC("DATAIN"),
		.HIGH_PERFORMANCE_MODE("TRUE"),
		.IDELAY_TYPE("VARIABLE"),
		.IDELAY_VALUE(0),
		.ODELAY_VALUE(0),
		.REFCLK_FREQUENCY(200.0),
		.SIGNAL_PATTERN("CLOCK")
	) adc_clk_odelay (
	.DATAOUT(adc_clk), 
	.C(clk40),
	.CE(adc_clk_delay_ce), 
	.DATAIN(clk357),		
	.IDATAIN(1'b0),	// Must be grounded
	.INC(1'b1), 		// Always increment
	.ODATAIN(1'b0),	// Must be grounded		
	.RST(delay_calc_strb | delay_trig),
	.T(1'b1) 			// 1==INPUT/INTERNAL	0==OUTPUT
	);

// *****  Instantiate the adc_clk odelay incrementor  *****
wire [5:0] adc_clk_delay;
iodelay_incrementor adc_clk_delay_inc(
	.clk40(clk40),
	.rst(delay_calc_strb | delay_trig),	//This reset line goes high one cycle before the strb
	.count_trig(iodelay_cnt_trig),
	.spec_delay(adc_clk_delay),
	.inc_en(adc_clk_delay_ce),
	.actual_delay(adc_clk_delay_mon)
);

//Instantiate the delay calculator
wire [5:0] adc_data_delay;
wire [6:0] delay_modifier;	
delay_calc delay_calc1(
	.clk40(clk40),
	.rst(rst),
	.data_offset_delay(data_offset_delay),
	.delay_modifier(delay_modifier),
	.scan_delay(scan_delay),
	.strb(delay_calc_strb | delay_trig),
	.adc_clock_delay(adc_clk_delay),
	.adc_data_delay(adc_data_delay),
	.adc_drdy_delay(adc_drdy_delay),
	.saturated(saturated)
);

//Instantiate the alignment monitor
align_monitor align_mon1( 
	.clk357(clk357),
	.drdy(drdy),
	.clk40(clk40),
	.rst(rst),
	.align_en(align_en),
	.delay_modifier(delay_modifier),
	.delay_mod_strb(delay_calc_strb),
	.count1(count1),
	.count2(count2),
	.count3(count3),
	.monitor_strb(monitor_strb_in) 
);

// Output the delay modifier for monitoring
assign delay_mod = delay_modifier;
// Output actual data delay for monitoring
assign total_data_delay = adc_data_delay;
// Output drdy delay for monitoring
assign total_drdy_delay = adc_drdy_delay;

// *****  Instantiate the data delay incrementor  *****
wire adc_data_delay_ce;
iodelay_incrementor data_idelay_inc(
	.clk40(clk40),
	.rst(delay_calc_strb | delay_trig),			//This reset line goes high one cycle before the strb
	.count_trig(iodelay_cnt_trig),
	.spec_delay(adc_data_delay),
	.inc_en(adc_data_delay_ce),
	.actual_delay()
);

// *****  Declare the 13 input delays for the ch1 data inputs  *****
// The have exactly the same inputs as the DRDY delays to retain the phase
// between data and DRDY
	IODELAY # (
		.DELAY_SRC("I"),
		.HIGH_PERFORMANCE_MODE("TRUE"),
		.IDELAY_TYPE("VARIABLE"),
		.IDELAY_VALUE(0),
		.ODELAY_VALUE(0),
		.REFCLK_FREQUENCY(200.0),
		.SIGNAL_PATTERN("CLOCK")
	) IODELAY_CH1_DATA_0 (
	.DATAOUT(ch1_data_in_del[0]), 
	.C(clk40),
	.CE(adc_data_delay_ce), 
	.DATAIN(1'b0),		// Must be grounded
	.IDATAIN(ch1_data_in[0]),
	.INC(1'b1), 		// Always increment
	.ODATAIN(),			// Unused
	.RST(delay_calc_strb | delay_trig),
	.T(1'b1) 			// 1==INPUT/INTERNAL	0==OUTPUT
	);
	IODELAY # (
		.DELAY_SRC("I"),
		.HIGH_PERFORMANCE_MODE("TRUE"),
		.IDELAY_TYPE("VARIABLE"),
		.IDELAY_VALUE(0),
		.ODELAY_VALUE(0),
		.REFCLK_FREQUENCY(200.0),
		.SIGNAL_PATTERN("CLOCK")
	) IODELAY_CH1_DATA_1 (
	.DATAOUT(ch1_data_in_del[1]), 
	.C(clk40),
	.CE(adc_data_delay_ce), 
	.DATAIN(1'b0),		// Must be grounded
	.IDATAIN(ch1_data_in[1]),
	.INC(1'b1), 		// Always increment
	.ODATAIN(),			// Unused
	.RST(delay_calc_strb | delay_trig),
	.T(1'b1) 			// 1==INPUT/INTERNAL	0==OUTPUT
	);
	IODELAY # (
		.DELAY_SRC("I"),
		.HIGH_PERFORMANCE_MODE("TRUE"),
		.IDELAY_TYPE("VARIABLE"),
		.IDELAY_VALUE(0),
		.ODELAY_VALUE(0),
		.REFCLK_FREQUENCY(200.0),
		.SIGNAL_PATTERN("CLOCK")
	) IODELAY_CH1_DATA_2 (
	.DATAOUT(ch1_data_in_del[2]), 
	.C(clk40),
	.CE(adc_data_delay_ce), 
	.DATAIN(1'b0),		// Must be grounded
	.IDATAIN(ch1_data_in[2]),
	.INC(1'b1), 		// Always increment
	.ODATAIN(),			// Unused
	.RST(delay_calc_strb | delay_trig),
	.T(1'b1) 			// 1==INPUT/INTERNAL	0==OUTPUT
	);
	IODELAY # (
		.DELAY_SRC("I"),
		.HIGH_PERFORMANCE_MODE("TRUE"),
		.IDELAY_TYPE("VARIABLE"),
		.IDELAY_VALUE(0),
		.ODELAY_VALUE(0),
		.REFCLK_FREQUENCY(200.0),
		.SIGNAL_PATTERN("CLOCK")
	) IODELAY_CH1_DATA_3 (
	.DATAOUT(ch1_data_in_del[3]), 
	.C(clk40),
	.CE(adc_data_delay_ce), 
	.DATAIN(1'b0),		// Must be grounded
	.IDATAIN(ch1_data_in[3]),
	.INC(1'b1), 		// Always increment
	.ODATAIN(),			// Unused
	.RST(delay_calc_strb | delay_trig),
	.T(1'b1) 			// 1==INPUT/INTERNAL	0==OUTPUT
	);
	IODELAY # (
		.DELAY_SRC("I"),
		.HIGH_PERFORMANCE_MODE("TRUE"),
		.IDELAY_TYPE("VARIABLE"),
		.IDELAY_VALUE(0),
		.ODELAY_VALUE(0),
		.REFCLK_FREQUENCY(200.0),
		.SIGNAL_PATTERN("CLOCK")
	) IODELAY_CH1_DATA_4 (
	.DATAOUT(ch1_data_in_del[4]), 
	.C(clk40),
	.CE(adc_data_delay_ce), 
	.DATAIN(1'b0),		// Must be grounded
	.IDATAIN(ch1_data_in[4]),
	.INC(1'b1), 		// Always increment
	.ODATAIN(),			// Unused
	.RST(delay_calc_strb | delay_trig),
	.T(1'b1) 			// 1==INPUT/INTERNAL	0==OUTPUT
	);
	IODELAY # (
		.DELAY_SRC("I"),
		.HIGH_PERFORMANCE_MODE("TRUE"),
		.IDELAY_TYPE("VARIABLE"),
		.IDELAY_VALUE(0),
		.ODELAY_VALUE(0),
		.REFCLK_FREQUENCY(200.0),
		.SIGNAL_PATTERN("CLOCK")
	) IODELAY_CH1_DATA_5 (
	.DATAOUT(ch1_data_in_del[5]), 
	.C(clk40),
	.CE(adc_data_delay_ce), 
	.DATAIN(1'b0),		// Must be grounded
	.IDATAIN(ch1_data_in[5]),
	.INC(1'b1), 		// Always increment
	.ODATAIN(),			// Unused
	.RST(delay_calc_strb | delay_trig),
	.T(1'b1) 			// 1==INPUT/INTERNAL	0==OUTPUT
	);
	IODELAY # (
		.DELAY_SRC("I"),
		.HIGH_PERFORMANCE_MODE("TRUE"),
		.IDELAY_TYPE("VARIABLE"),
		.IDELAY_VALUE(0),
		.ODELAY_VALUE(0),
		.REFCLK_FREQUENCY(200.0),
		.SIGNAL_PATTERN("CLOCK")
	) IODELAY_CH1_DATA_6 (
	.DATAOUT(ch1_data_in_del[6]), 
	.C(clk40),
	.CE(adc_data_delay_ce), 
	.DATAIN(1'b0),		// Must be grounded
	.IDATAIN(ch1_data_in[6]),
	.INC(1'b1), 		// Always increment
	.ODATAIN(),			// Unused
	.RST(delay_calc_strb | delay_trig),
	.T(1'b1) 			// 1==INPUT/INTERNAL	0==OUTPUT
	);
	IODELAY # (
		.DELAY_SRC("I"),
		.HIGH_PERFORMANCE_MODE("TRUE"),
		.IDELAY_TYPE("VARIABLE"),
		.IDELAY_VALUE(0),
		.ODELAY_VALUE(0),
		.REFCLK_FREQUENCY(200.0),
		.SIGNAL_PATTERN("CLOCK")
	) IODELAY_CH1_DATA_7 (
	.DATAOUT(ch1_data_in_del[7]), 
	.C(clk40),
	.CE(adc_data_delay_ce), 
	.DATAIN(1'b0),		// Must be grounded
	.IDATAIN(ch1_data_in[7]),
	.INC(1'b1), 		// Always increment
	.ODATAIN(),			// Unused
	.RST(delay_calc_strb | delay_trig),
	.T(1'b1) 			// 1==INPUT/INTERNAL	0==OUTPUT
	);
	IODELAY # (
		.DELAY_SRC("I"),
		.HIGH_PERFORMANCE_MODE("TRUE"),
		.IDELAY_TYPE("VARIABLE"),
		.IDELAY_VALUE(0),
		.ODELAY_VALUE(0),
		.REFCLK_FREQUENCY(200.0),
		.SIGNAL_PATTERN("CLOCK")
	) IODELAY_CH1_DATA_8 (
	.DATAOUT(ch1_data_in_del[8]), 
	.C(clk40),
	.CE(adc_data_delay_ce), 
	.DATAIN(1'b0),		// Must be grounded
	.IDATAIN(ch1_data_in[8]),
	.INC(1'b1), 		// Always increment
	.ODATAIN(),			// Unused
	.RST(delay_calc_strb | delay_trig),
	.T(1'b1) 			// 1==INPUT/INTERNAL	0==OUTPUT
	);
	IODELAY # (
		.DELAY_SRC("I"),
		.HIGH_PERFORMANCE_MODE("TRUE"),
		.IDELAY_TYPE("VARIABLE"),
		.IDELAY_VALUE(0),
		.ODELAY_VALUE(0),
		.REFCLK_FREQUENCY(200.0),
		.SIGNAL_PATTERN("CLOCK")
	) IODELAY_CH1_DATA_9 (
	.DATAOUT(ch1_data_in_del[9]), 
	.C(clk40),
	.CE(adc_data_delay_ce), 
	.DATAIN(1'b0),		// Must be grounded
	.IDATAIN(ch1_data_in[9]),
	.INC(1'b1), 		// Always increment
	.ODATAIN(),			// Unused
	.RST(delay_calc_strb | delay_trig),
	.T(1'b1) 			// 1==INPUT/INTERNAL	0==OUTPUT
	);
	IODELAY # (
		.DELAY_SRC("I"),
		.HIGH_PERFORMANCE_MODE("TRUE"),
		.IDELAY_TYPE("VARIABLE"),
		.IDELAY_VALUE(0),
		.ODELAY_VALUE(0),
		.REFCLK_FREQUENCY(200.0),
		.SIGNAL_PATTERN("CLOCK")
	) IODELAY_CH1_DATA_10 (
	.DATAOUT(ch1_data_in_del[10]), 
	.C(clk40),
	.CE(adc_data_delay_ce), 
	.DATAIN(1'b0),		// Must be grounded
	.IDATAIN(ch1_data_in[10]),
	.INC(1'b1), 		// Always increment
	.ODATAIN(),			// Unused
	.RST(delay_calc_strb | delay_trig),
	.T(1'b1) 			// 1==INPUT/INTERNAL	0==OUTPUT
	);
	IODELAY # (
		.DELAY_SRC("I"),
		.HIGH_PERFORMANCE_MODE("TRUE"),
		.IDELAY_TYPE("VARIABLE"),
		.IDELAY_VALUE(0),
		.ODELAY_VALUE(0),
		.REFCLK_FREQUENCY(200.0),
		.SIGNAL_PATTERN("CLOCK")
	) IODELAY_CH1_DATA_11 (
	.DATAOUT(ch1_data_in_del[11]), 
	.C(clk40),
	.CE(adc_data_delay_ce), 
	.DATAIN(1'b0),		// Must be grounded
	.IDATAIN(ch1_data_in[11]),
	.INC(1'b1), 		// Always increment
	.ODATAIN(),			// Unused
	.RST(delay_calc_strb | delay_trig),
	.T(1'b1) 			// 1==INPUT/INTERNAL	0==OUTPUT
	);
	IODELAY # (
		.DELAY_SRC("I"),
		.HIGH_PERFORMANCE_MODE("TRUE"),
		.IDELAY_TYPE("VARIABLE"),
		.IDELAY_VALUE(0),
		.ODELAY_VALUE(0),
		.REFCLK_FREQUENCY(200.0),
		.SIGNAL_PATTERN("CLOCK")
	) IODELAY_CH1_DATA_12 (
	.DATAOUT(ch1_data_in_del[12]), 
	.C(clk40),
	.CE(adc_data_delay_ce), 
	.DATAIN(1'b0),		// Must be grounded
	.IDATAIN(ch1_data_in[12]),
	.INC(1'b1), 		// Always increment
	.ODATAIN(),			// Unused
	.RST(delay_calc_strb | delay_trig),
	.T(1'b1) 			// 1==INPUT/INTERNAL	0==OUTPUT
	);

// *****  Declare the 13 input delays for the ch2 data inputs  *****
// The have exactly the same inputs as the DRDY delays to retain the phase
// between data and DRDY
	IODELAY # (
		.DELAY_SRC("I"),
		.HIGH_PERFORMANCE_MODE("TRUE"),
		.IDELAY_TYPE("VARIABLE"),
		.IDELAY_VALUE(0),
		.ODELAY_VALUE(0),
		.REFCLK_FREQUENCY(200.0),
		.SIGNAL_PATTERN("CLOCK")
	) IODELAY_CH2_DATA_0 (
	.DATAOUT(ch2_data_in_del[0]), 
	.C(clk40),
	.CE(adc_data_delay_ce), 
	.DATAIN(1'b0),		// Must be grounded
	.IDATAIN(ch2_data_in[0]),
	.INC(1'b1), 		// Always increment
	.ODATAIN(),			// Unused
	.RST(delay_calc_strb | delay_trig),
	.T(1'b1) 			// 1==INPUT/INTERNAL	0==OUTPUT
	);
	IODELAY # (
		.DELAY_SRC("I"),
		.HIGH_PERFORMANCE_MODE("TRUE"),
		.IDELAY_TYPE("VARIABLE"),
		.IDELAY_VALUE(0),
		.ODELAY_VALUE(0),
		.REFCLK_FREQUENCY(200.0),
		.SIGNAL_PATTERN("CLOCK")
	) IODELAY_CH2_DATA_1 (
	.DATAOUT(ch2_data_in_del[1]), 
	.C(clk40),
	.CE(adc_data_delay_ce), 
	.DATAIN(1'b0),		// Must be grounded
	.IDATAIN(ch2_data_in[1]),
	.INC(1'b1), 		// Always increment
	.ODATAIN(),			// Unused
	.RST(delay_calc_strb | delay_trig),
	.T(1'b1) 			// 1==INPUT/INTERNAL	0==OUTPUT
	);
	IODELAY # (
		.DELAY_SRC("I"),
		.HIGH_PERFORMANCE_MODE("TRUE"),
		.IDELAY_TYPE("VARIABLE"),
		.IDELAY_VALUE(0),
		.ODELAY_VALUE(0),
		.REFCLK_FREQUENCY(200.0),
		.SIGNAL_PATTERN("CLOCK")
	) IODELAY_CH2_DATA_2 (
	.DATAOUT(ch2_data_in_del[2]), 
	.C(clk40),
	.CE(adc_data_delay_ce), 
	.DATAIN(1'b0),		// Must be grounded
	.IDATAIN(ch2_data_in[2]),
	.INC(1'b1), 		// Always increment
	.ODATAIN(),			// Unused
	.RST(delay_calc_strb | delay_trig),
	.T(1'b1) 			// 1==INPUT/INTERNAL	0==OUTPUT
	);
	IODELAY # (
		.DELAY_SRC("I"),
		.HIGH_PERFORMANCE_MODE("TRUE"),
		.IDELAY_TYPE("VARIABLE"),
		.IDELAY_VALUE(0),
		.ODELAY_VALUE(0),
		.REFCLK_FREQUENCY(200.0),
		.SIGNAL_PATTERN("CLOCK")
	) IODELAY_CH2_DATA_3 (
	.DATAOUT(ch2_data_in_del[3]), 
	.C(clk40),
	.CE(adc_data_delay_ce), 
	.DATAIN(1'b0),		// Must be grounded
	.IDATAIN(ch2_data_in[3]),
	.INC(1'b1), 		// Always increment
	.ODATAIN(),			// Unused
	.RST(delay_calc_strb | delay_trig),
	.T(1'b1) 			// 1==INPUT/INTERNAL	0==OUTPUT
	);
	IODELAY # (
		.DELAY_SRC("I"),
		.HIGH_PERFORMANCE_MODE("TRUE"),
		.IDELAY_TYPE("VARIABLE"),
		.IDELAY_VALUE(0),
		.ODELAY_VALUE(0),
		.REFCLK_FREQUENCY(200.0),
		.SIGNAL_PATTERN("CLOCK")
	) IODELAY_CH2_DATA_4 (
	.DATAOUT(ch2_data_in_del[4]), 
	.C(clk40),
	.CE(adc_data_delay_ce), 
	.DATAIN(1'b0),		// Must be grounded
	.IDATAIN(ch2_data_in[4]),
	.INC(1'b1), 		// Always increment
	.ODATAIN(),			// Unused
	.RST(delay_calc_strb | delay_trig),
	.T(1'b1) 			// 1==INPUT/INTERNAL	0==OUTPUT
	);
	IODELAY # (
		.DELAY_SRC("I"),
		.HIGH_PERFORMANCE_MODE("TRUE"),
		.IDELAY_TYPE("VARIABLE"),
		.IDELAY_VALUE(0),
		.ODELAY_VALUE(0),
		.REFCLK_FREQUENCY(200.0),
		.SIGNAL_PATTERN("CLOCK")
	) IODELAY_CH2_DATA_5 (
	.DATAOUT(ch2_data_in_del[5]), 
	.C(clk40),
	.CE(adc_data_delay_ce), 
	.DATAIN(1'b0),		// Must be grounded
	.IDATAIN(ch2_data_in[5]),
	.INC(1'b1), 		// Always increment
	.ODATAIN(),			// Unused
	.RST(delay_calc_strb | delay_trig),
	.T(1'b1) 			// 1==INPUT/INTERNAL	0==OUTPUT
	);
	IODELAY # (
		.DELAY_SRC("I"),
		.HIGH_PERFORMANCE_MODE("TRUE"),
		.IDELAY_TYPE("VARIABLE"),
		.IDELAY_VALUE(0),
		.ODELAY_VALUE(0),
		.REFCLK_FREQUENCY(200.0),
		.SIGNAL_PATTERN("CLOCK")
	) IODELAY_CH2_DATA_6 (
	.DATAOUT(ch2_data_in_del[6]), 
	.C(clk40),
	.CE(adc_data_delay_ce), 
	.DATAIN(1'b0),		// Must be grounded
	.IDATAIN(ch2_data_in[6]),
	.INC(1'b1), 		// Always increment
	.ODATAIN(),			// Unused
	.RST(delay_calc_strb | delay_trig),
	.T(1'b1) 			// 1==INPUT/INTERNAL	0==OUTPUT
	);
	IODELAY # (
		.DELAY_SRC("I"),
		.HIGH_PERFORMANCE_MODE("TRUE"),
		.IDELAY_TYPE("VARIABLE"),
		.IDELAY_VALUE(0),
		.ODELAY_VALUE(0),
		.REFCLK_FREQUENCY(200.0),
		.SIGNAL_PATTERN("CLOCK")
	) IODELAY_CH2_DATA_7 (
	.DATAOUT(ch2_data_in_del[7]), 
	.C(clk40),
	.CE(adc_data_delay_ce), 
	.DATAIN(1'b0),		// Must be grounded
	.IDATAIN(ch2_data_in[7]),
	.INC(1'b1), 		// Always increment
	.ODATAIN(),			// Unused
	.RST(delay_calc_strb | delay_trig),
	.T(1'b1) 			// 1==INPUT/INTERNAL	0==OUTPUT
	);
	IODELAY # (
		.DELAY_SRC("I"),
		.HIGH_PERFORMANCE_MODE("TRUE"),
		.IDELAY_TYPE("VARIABLE"),
		.IDELAY_VALUE(0),
		.ODELAY_VALUE(0),
		.REFCLK_FREQUENCY(200.0),
		.SIGNAL_PATTERN("CLOCK")
	) IODELAY_CH2_DATA_8 (
	.DATAOUT(ch2_data_in_del[8]), 
	.C(clk40),
	.CE(adc_data_delay_ce), 
	.DATAIN(1'b0),		// Must be grounded
	.IDATAIN(ch2_data_in[8]),
	.INC(1'b1), 		// Always increment
	.ODATAIN(),			// Unused
	.RST(delay_calc_strb | delay_trig),
	.T(1'b1) 			// 1==INPUT/INTERNAL	0==OUTPUT
	);
	IODELAY # (
		.DELAY_SRC("I"),
		.HIGH_PERFORMANCE_MODE("TRUE"),
		.IDELAY_TYPE("VARIABLE"),
		.IDELAY_VALUE(0),
		.ODELAY_VALUE(0),
		.REFCLK_FREQUENCY(200.0),
		.SIGNAL_PATTERN("CLOCK")
	) IODELAY_CH2_DATA_9 (
	.DATAOUT(ch2_data_in_del[9]), 
	.C(clk40),
	.CE(adc_data_delay_ce), 
	.DATAIN(1'b0),		// Must be grounded
	.IDATAIN(ch2_data_in[9]),
	.INC(1'b1), 		// Always increment
	.ODATAIN(),			// Unused
	.RST(delay_calc_strb | delay_trig),
	.T(1'b1) 			// 1==INPUT/INTERNAL	0==OUTPUT
	);
	IODELAY # (
		.DELAY_SRC("I"),
		.HIGH_PERFORMANCE_MODE("TRUE"),
		.IDELAY_TYPE("VARIABLE"),
		.IDELAY_VALUE(0),
		.ODELAY_VALUE(0),
		.REFCLK_FREQUENCY(200.0),
		.SIGNAL_PATTERN("CLOCK")
	) IODELAY_CH2_DATA_10 (
	.DATAOUT(ch2_data_in_del[10]), 
	.C(clk40),
	.CE(adc_data_delay_ce), 
	.DATAIN(1'b0),		// Must be grounded
	.IDATAIN(ch2_data_in[10]),
	.INC(1'b1), 		// Always increment
	.ODATAIN(),			// Unused
	.RST(delay_calc_strb | delay_trig),
	.T(1'b1) 			// 1==INPUT/INTERNAL	0==OUTPUT
	);
	IODELAY # (
		.DELAY_SRC("I"),
		.HIGH_PERFORMANCE_MODE("TRUE"),
		.IDELAY_TYPE("VARIABLE"),
		.IDELAY_VALUE(0),
		.ODELAY_VALUE(0),
		.REFCLK_FREQUENCY(200.0),
		.SIGNAL_PATTERN("CLOCK")
	) IODELAY_CH2_DATA_11 (
	.DATAOUT(ch2_data_in_del[11]), 
	.C(clk40),
	.CE(adc_data_delay_ce), 
	.DATAIN(1'b0),		// Must be grounded
	.IDATAIN(ch2_data_in[11]),
	.INC(1'b1), 		// Always increment
	.ODATAIN(),			// Unused
	.RST(delay_calc_strb | delay_trig),
	.T(1'b1) 			// 1==INPUT/INTERNAL	0==OUTPUT
	);
	IODELAY # (
		.DELAY_SRC("I"),
		.HIGH_PERFORMANCE_MODE("TRUE"),
		.IDELAY_TYPE("VARIABLE"),
		.IDELAY_VALUE(0),
		.ODELAY_VALUE(0),
		.REFCLK_FREQUENCY(200.0),
		.SIGNAL_PATTERN("CLOCK")
	) IODELAY_CH2_DATA_12 (
	.DATAOUT(ch2_data_in_del[12]), 
	.C(clk40),
	.CE(adc_data_delay_ce), 
	.DATAIN(1'b0),		// Must be grounded
	.IDATAIN(ch2_data_in[12]),
	.INC(1'b1), 		// Always increment
	.ODATAIN(),			// Unused
	.RST(delay_calc_strb | delay_trig),
	.T(1'b1) 			// 1==INPUT/INTERNAL	0==OUTPUT
	);

// *****  Declare the 13 input delays for the ch3 data inputs  *****
// The have exactly the same inputs as the DRDY delays to retain the phase
// between data and DRDY
	IODELAY # (
		.DELAY_SRC("I"),
		.HIGH_PERFORMANCE_MODE("TRUE"),
		.IDELAY_TYPE("VARIABLE"),
		.IDELAY_VALUE(0),
		.ODELAY_VALUE(0),
		.REFCLK_FREQUENCY(200.0),
		.SIGNAL_PATTERN("CLOCK")
	) IODELAY_CH3_DATA_0 (
	.DATAOUT(ch3_data_in_del[0]), 
	.C(clk40),
	.CE(adc_data_delay_ce), 
	.DATAIN(1'b0),		// Must be grounded
	.IDATAIN(ch3_data_in[0]),
	.INC(1'b1), 		// Always increment
	.ODATAIN(),			// Unused
	.RST(delay_calc_strb | delay_trig),
	.T(1'b1) 			// 1==INPUT/INTERNAL	0==OUTPUT
	);
	IODELAY # (
		.DELAY_SRC("I"),
		.HIGH_PERFORMANCE_MODE("TRUE"),
		.IDELAY_TYPE("VARIABLE"),
		.IDELAY_VALUE(0),
		.ODELAY_VALUE(0),
		.REFCLK_FREQUENCY(200.0),
		.SIGNAL_PATTERN("CLOCK")
	) IODELAY_CH3_DATA_1 (
	.DATAOUT(ch3_data_in_del[1]), 
	.C(clk40),
	.CE(adc_data_delay_ce), 
	.DATAIN(1'b0),		// Must be grounded
	.IDATAIN(ch3_data_in[1]),
	.INC(1'b1), 		// Always increment
	.ODATAIN(),			// Unused
	.RST(delay_calc_strb | delay_trig),
	.T(1'b1) 			// 1==INPUT/INTERNAL	0==OUTPUT
	);
	IODELAY # (
		.DELAY_SRC("I"),
		.HIGH_PERFORMANCE_MODE("TRUE"),
		.IDELAY_TYPE("VARIABLE"),
		.IDELAY_VALUE(0),
		.ODELAY_VALUE(0),
		.REFCLK_FREQUENCY(200.0),
		.SIGNAL_PATTERN("CLOCK")
	) IODELAY_CH3_DATA_2 (
	.DATAOUT(ch3_data_in_del[2]), 
	.C(clk40),
	.CE(adc_data_delay_ce), 
	.DATAIN(1'b0),		// Must be grounded
	.IDATAIN(ch3_data_in[2]),
	.INC(1'b1), 		// Always increment
	.ODATAIN(),			// Unused
	.RST(delay_calc_strb | delay_trig),
	.T(1'b1) 			// 1==INPUT/INTERNAL	0==OUTPUT
	);
	IODELAY # (
		.DELAY_SRC("I"),
		.HIGH_PERFORMANCE_MODE("TRUE"),
		.IDELAY_TYPE("VARIABLE"),
		.IDELAY_VALUE(0),
		.ODELAY_VALUE(0),
		.REFCLK_FREQUENCY(200.0),
		.SIGNAL_PATTERN("CLOCK")
	) IODELAY_CH3_DATA_3 (
	.DATAOUT(ch3_data_in_del[3]), 
	.C(clk40),
	.CE(adc_data_delay_ce), 
	.DATAIN(1'b0),		// Must be grounded
	.IDATAIN(ch3_data_in[3]),
	.INC(1'b1), 		// Always increment
	.ODATAIN(),			// Unused
	.RST(delay_calc_strb | delay_trig),
	.T(1'b1) 			// 1==INPUT/INTERNAL	0==OUTPUT
	);
	IODELAY # (
		.DELAY_SRC("I"),
		.HIGH_PERFORMANCE_MODE("TRUE"),
		.IDELAY_TYPE("VARIABLE"),
		.IDELAY_VALUE(0),
		.ODELAY_VALUE(0),
		.REFCLK_FREQUENCY(200.0),
		.SIGNAL_PATTERN("CLOCK")
	) IODELAY_CH3_DATA_4 (
	.DATAOUT(ch3_data_in_del[4]), 
	.C(clk40),
	.CE(adc_data_delay_ce), 
	.DATAIN(1'b0),		// Must be grounded
	.IDATAIN(ch3_data_in[4]),
	.INC(1'b1), 		// Always increment
	.ODATAIN(),			// Unused
	.RST(delay_calc_strb | delay_trig),
	.T(1'b1) 			// 1==INPUT/INTERNAL	0==OUTPUT
	);
	IODELAY # (
		.DELAY_SRC("I"),
		.HIGH_PERFORMANCE_MODE("TRUE"),
		.IDELAY_TYPE("VARIABLE"),
		.IDELAY_VALUE(0),
		.ODELAY_VALUE(0),
		.REFCLK_FREQUENCY(200.0),
		.SIGNAL_PATTERN("CLOCK")
	) IODELAY_CH3_DATA_5 (
	.DATAOUT(ch3_data_in_del[5]), 
	.C(clk40),
	.CE(adc_data_delay_ce), 
	.DATAIN(1'b0),		// Must be grounded
	.IDATAIN(ch3_data_in[5]),
	.INC(1'b1), 		// Always increment
	.ODATAIN(),			// Unused
	.RST(delay_calc_strb | delay_trig),
	.T(1'b1) 			// 1==INPUT/INTERNAL	0==OUTPUT
	);
	IODELAY # (
		.DELAY_SRC("I"),
		.HIGH_PERFORMANCE_MODE("TRUE"),
		.IDELAY_TYPE("VARIABLE"),
		.IDELAY_VALUE(0),
		.ODELAY_VALUE(0),
		.REFCLK_FREQUENCY(200.0),
		.SIGNAL_PATTERN("CLOCK")
	) IODELAY_CH3_DATA_6 (
	.DATAOUT(ch3_data_in_del[6]), 
	.C(clk40),
	.CE(adc_data_delay_ce), 
	.DATAIN(1'b0),		// Must be grounded
	.IDATAIN(ch3_data_in[6]),
	.INC(1'b1), 		// Always increment
	.ODATAIN(),			// Unused
	.RST(delay_calc_strb | delay_trig),
	.T(1'b1) 			// 1==INPUT/INTERNAL	0==OUTPUT
	);
	IODELAY # (
		.DELAY_SRC("I"),
		.HIGH_PERFORMANCE_MODE("TRUE"),
		.IDELAY_TYPE("VARIABLE"),
		.IDELAY_VALUE(0),
		.ODELAY_VALUE(0),
		.REFCLK_FREQUENCY(200.0),
		.SIGNAL_PATTERN("CLOCK")
	) IODELAY_CH3_DATA_7 (
	.DATAOUT(ch3_data_in_del[7]), 
	.C(clk40),
	.CE(adc_data_delay_ce), 
	.DATAIN(1'b0),		// Must be grounded
	.IDATAIN(ch3_data_in[7]),
	.INC(1'b1), 		// Always increment
	.ODATAIN(),			// Unused
	.RST(delay_calc_strb | delay_trig),
	.T(1'b1) 			// 1==INPUT/INTERNAL	0==OUTPUT
	);
	IODELAY # (
		.DELAY_SRC("I"),
		.HIGH_PERFORMANCE_MODE("TRUE"),
		.IDELAY_TYPE("VARIABLE"),
		.IDELAY_VALUE(0),
		.ODELAY_VALUE(0),
		.REFCLK_FREQUENCY(200.0),
		.SIGNAL_PATTERN("CLOCK")
	) IODELAY_CH3_DATA_8 (
	.DATAOUT(ch3_data_in_del[8]), 
	.C(clk40),
	.CE(adc_data_delay_ce), 
	.DATAIN(1'b0),		// Must be grounded
	.IDATAIN(ch3_data_in[8]),
	.INC(1'b1), 		// Always increment
	.ODATAIN(),			// Unused
	.RST(delay_calc_strb | delay_trig),
	.T(1'b1) 			// 1==INPUT/INTERNAL	0==OUTPUT
	);
	IODELAY # (
		.DELAY_SRC("I"),
		.HIGH_PERFORMANCE_MODE("TRUE"),
		.IDELAY_TYPE("VARIABLE"),
		.IDELAY_VALUE(0),
		.ODELAY_VALUE(0),
		.REFCLK_FREQUENCY(200.0),
		.SIGNAL_PATTERN("CLOCK")
	) IODELAY_CH3_DATA_9 (
	.DATAOUT(ch3_data_in_del[9]), 
	.C(clk40),
	.CE(adc_data_delay_ce), 
	.DATAIN(1'b0),		// Must be grounded
	.IDATAIN(ch3_data_in[9]),
	.INC(1'b1), 		// Always increment
	.ODATAIN(),			// Unused
	.RST(delay_calc_strb | delay_trig),
	.T(1'b1) 			// 1==INPUT/INTERNAL	0==OUTPUT
	);
	IODELAY # (
		.DELAY_SRC("I"),
		.HIGH_PERFORMANCE_MODE("TRUE"),
		.IDELAY_TYPE("VARIABLE"),
		.IDELAY_VALUE(0),
		.ODELAY_VALUE(0),
		.REFCLK_FREQUENCY(200.0),
		.SIGNAL_PATTERN("CLOCK")
	) IODELAY_CH3_DATA_10 (
	.DATAOUT(ch3_data_in_del[10]), 
	.C(clk40),
	.CE(adc_data_delay_ce), 
	.DATAIN(1'b0),		// Must be grounded
	.IDATAIN(ch3_data_in[10]),
	.INC(1'b1), 		// Always increment
	.ODATAIN(),			// Unused
	.RST(delay_calc_strb | delay_trig),
	.T(1'b1) 			// 1==INPUT/INTERNAL	0==OUTPUT
	);
	IODELAY # (
		.DELAY_SRC("I"),
		.HIGH_PERFORMANCE_MODE("TRUE"),
		.IDELAY_TYPE("VARIABLE"),
		.IDELAY_VALUE(0),
		.ODELAY_VALUE(0),
		.REFCLK_FREQUENCY(200.0),
		.SIGNAL_PATTERN("CLOCK")
	) IODELAY_CH3_DATA_11 (
	.DATAOUT(ch3_data_in_del[11]), 
	.C(clk40),
	.CE(adc_data_delay_ce), 
	.DATAIN(1'b0),		// Must be grounded
	.IDATAIN(ch3_data_in[11]),
	.INC(1'b1), 		// Always increment
	.ODATAIN(),			// Unused
	.RST(delay_calc_strb | delay_trig),
	.T(1'b1) 			// 1==INPUT/INTERNAL	0==OUTPUT
	);
	IODELAY # (
		.DELAY_SRC("I"),
		.HIGH_PERFORMANCE_MODE("TRUE"),
		.IDELAY_TYPE("VARIABLE"),
		.IDELAY_VALUE(0),
		.ODELAY_VALUE(0),
		.REFCLK_FREQUENCY(200.0),
		.SIGNAL_PATTERN("CLOCK")
	) IODELAY_CH3_DATA_12 (
	.DATAOUT(ch3_data_in_del[12]), 
	.C(clk40),
	.CE(adc_data_delay_ce), 
	.DATAIN(1'b0),		// Must be grounded
	.IDATAIN(ch3_data_in[12]),
	.INC(1'b1), 		// Always increment
	.ODATAIN(),			// Unused
	.RST(delay_calc_strb | delay_trig),
	.T(1'b1) 			// 1==INPUT/INTERNAL	0==OUTPUT
	);
	
	
// **********  Declare the DRDY differential input buffers *********
	IBUFDS #(
		.CAPACITANCE("DONT_CARE"),
		.DIFF_TERM("TRUE"), 
		.IBUF_DELAY_VALUE("0"),
		.IFD_DELAY_VALUE("AUTO"), 
		.IOSTANDARD("DEFAULT") 
	) IBUFDS_CH1_DRDY (
		.O(ch1_drdy),
		.I(ch1_drdy_p), 
		.IB(ch1_drdy_n)
	);
	IBUFDS #(
		.CAPACITANCE("DONT_CARE"),
		.DIFF_TERM("TRUE"), 
		.IBUF_DELAY_VALUE("0"),
		.IFD_DELAY_VALUE("AUTO"), 
		.IOSTANDARD("DEFAULT") 
	) IBUFDS_CH2_DRDY (
		.O(ch2_drdy),
		.I(ch2_drdy_p), 
		.IB(ch2_drdy_n)
	);
	IBUFDS #(
		.CAPACITANCE("DONT_CARE"),
		.DIFF_TERM("TRUE"), 
		.IBUF_DELAY_VALUE("0"),
		.IFD_DELAY_VALUE("AUTO"), 
		.IOSTANDARD("DEFAULT") 
	) IBUFDS_CH3_DRDY (
		.O(ch3_drdy),
		.I(ch3_drdy_p), 
		.IB(ch3_drdy_n)
	);
	
// **********  Declare the 13 ch1 data differential input buffers *********
	IBUFDS #(
		.CAPACITANCE("DONT_CARE"),
		.DIFF_TERM("TRUE"), 
		.IBUF_DELAY_VALUE("0"),
		.IFD_DELAY_VALUE("AUTO"), 
		.IOSTANDARD("DEFAULT") 
	) IBUFDS_CH1_DATA_0 (
		.I(ch1_data_in_p[0]),
		.IB(ch1_data_in_n[0]), 
		.O(ch1_data_in[0])
	);
	IBUFDS #(
		.CAPACITANCE("DONT_CARE"),
		.DIFF_TERM("TRUE"), 
		.IBUF_DELAY_VALUE("0"),
		.IFD_DELAY_VALUE("AUTO"), 
		.IOSTANDARD("DEFAULT") 
	) IBUFDS_CH1_DATA_1 (
		.I(ch1_data_in_p[1]),
		.IB(ch1_data_in_n[1]), 
		.O(ch1_data_in[1])
	);
	IBUFDS #(
		.CAPACITANCE("DONT_CARE"),
		.DIFF_TERM("TRUE"), 
		.IBUF_DELAY_VALUE("0"),
		.IFD_DELAY_VALUE("AUTO"), 
		.IOSTANDARD("DEFAULT") 
	) IBUFDS_CH1_DATA_2 (
		.I(ch1_data_in_p[2]),
		.IB(ch1_data_in_n[2]), 
		.O(ch1_data_in[2])
	);
	IBUFDS #(
		.CAPACITANCE("DONT_CARE"),
		.DIFF_TERM("TRUE"), 
		.IBUF_DELAY_VALUE("0"),
		.IFD_DELAY_VALUE("AUTO"), 
		.IOSTANDARD("DEFAULT") 
	) IBUFDS_CH1_DATA_3 (
		.I(ch1_data_in_p[3]),
		.IB(ch1_data_in_n[3]), 
		.O(ch1_data_in[3])
	);
	IBUFDS #(
		.CAPACITANCE("DONT_CARE"),
		.DIFF_TERM("TRUE"), 
		.IBUF_DELAY_VALUE("0"),
		.IFD_DELAY_VALUE("AUTO"), 
		.IOSTANDARD("DEFAULT") 
	) IBUFDS_CH1_DATA_4 (
		.I(ch1_data_in_p[4]),
		.IB(ch1_data_in_n[4]), 
		.O(ch1_data_in[4])
	);
	IBUFDS #(
		.CAPACITANCE("DONT_CARE"),
		.DIFF_TERM("TRUE"), 
		.IBUF_DELAY_VALUE("0"),
		.IFD_DELAY_VALUE("AUTO"), 
		.IOSTANDARD("DEFAULT") 
	) IBUFDS_CH1_DATA_5 (
		.I(ch1_data_in_p[5]),
		.IB(ch1_data_in_n[5]), 
		.O(ch1_data_in[5])
	);
	IBUFDS #(
		.CAPACITANCE("DONT_CARE"),
		.DIFF_TERM("TRUE"), 
		.IBUF_DELAY_VALUE("0"),
		.IFD_DELAY_VALUE("AUTO"), 
		.IOSTANDARD("DEFAULT") 
	) IBUFDS_CH1_DATA_6 (
		.I(ch1_data_in_p[6]),
		.IB(ch1_data_in_n[6]), 
		.O(ch1_data_in[6])
	);
	IBUFDS #(
		.CAPACITANCE("DONT_CARE"),
		.DIFF_TERM("TRUE"), 
		.IBUF_DELAY_VALUE("0"),
		.IFD_DELAY_VALUE("AUTO"), 
		.IOSTANDARD("DEFAULT") 
	) IBUFDS_CH1_DATA_7 (
		.I(ch1_data_in_p[7]),
		.IB(ch1_data_in_n[7]), 
		.O(ch1_data_in[7])
	);
	IBUFDS #(
		.CAPACITANCE("DONT_CARE"),
		.DIFF_TERM("TRUE"), 
		.IBUF_DELAY_VALUE("0"),
		.IFD_DELAY_VALUE("AUTO"), 
		.IOSTANDARD("DEFAULT") 
	) IBUFDS_CH1_DATA_8 (
		.I(ch1_data_in_p[8]),
		.IB(ch1_data_in_n[8]), 
		.O(ch1_data_in[8])
	);
	IBUFDS #(
		.CAPACITANCE("DONT_CARE"),
		.DIFF_TERM("TRUE"), 
		.IBUF_DELAY_VALUE("0"),
		.IFD_DELAY_VALUE("AUTO"), 
		.IOSTANDARD("DEFAULT") 
	) IBUFDS_CH1_DATA_9 (
		.I(ch1_data_in_p[9]),
		.IB(ch1_data_in_n[9]), 
		.O(ch1_data_in[9])
	);
	IBUFDS #(
		.CAPACITANCE("DONT_CARE"),
		.DIFF_TERM("TRUE"), 
		.IBUF_DELAY_VALUE("0"),
		.IFD_DELAY_VALUE("AUTO"), 
		.IOSTANDARD("DEFAULT") 
	) IBUFDS_CH1_DATA_10 (
		.I(ch1_data_in_p[10]),
		.IB(ch1_data_in_n[10]), 
		.O(ch1_data_in[10])
	);
	IBUFDS #(
		.CAPACITANCE("DONT_CARE"),
		.DIFF_TERM("TRUE"), 
		.IBUF_DELAY_VALUE("0"),
		.IFD_DELAY_VALUE("AUTO"), 
		.IOSTANDARD("DEFAULT") 
	) IBUFDS_CH1_DATA_11 (
		.I(ch1_data_in_p[11]),
		.IB(ch1_data_in_n[11]), 
		.O(ch1_data_in[11])
	);
	IBUFDS #(
		.CAPACITANCE("DONT_CARE"),
		.DIFF_TERM("TRUE"), 
		.IBUF_DELAY_VALUE("0"),
		.IFD_DELAY_VALUE("AUTO"), 
		.IOSTANDARD("DEFAULT") 
	) IBUFDS_CH1_DATA_12 (
		.I(ch1_data_in_p[12]),
		.IB(ch1_data_in_n[12]), 
		.O(ch1_data_in[12])
	);
	
// **********  Declare the 13 ch2 data differential input buffers *********
	IBUFDS #(
		.CAPACITANCE("DONT_CARE"),
		.DIFF_TERM("TRUE"), 
		.IBUF_DELAY_VALUE("0"),
		.IFD_DELAY_VALUE("AUTO"), 
		.IOSTANDARD("DEFAULT") 
	) IBUFDS_CH2_DATA_0 (
		.I(ch2_data_in_p[0]),
		.IB(ch2_data_in_n[0]), 
		.O(ch2_data_in[0])
	);
	IBUFDS #(
		.CAPACITANCE("DONT_CARE"),
		.DIFF_TERM("TRUE"), 
		.IBUF_DELAY_VALUE("0"),
		.IFD_DELAY_VALUE("AUTO"), 
		.IOSTANDARD("DEFAULT") 
	) IBUFDS_CH2_DATA_1 (
		.I(ch2_data_in_p[1]),
		.IB(ch2_data_in_n[1]), 
		.O(ch2_data_in[1])
	);
	IBUFDS #(
		.CAPACITANCE("DONT_CARE"),
		.DIFF_TERM("TRUE"), 
		.IBUF_DELAY_VALUE("0"),
		.IFD_DELAY_VALUE("AUTO"), 
		.IOSTANDARD("DEFAULT") 
	) IBUFDS_CH2_DATA_2 (
		.I(ch2_data_in_p[2]),
		.IB(ch2_data_in_n[2]), 
		.O(ch2_data_in[2])
	);
	IBUFDS #(
		.CAPACITANCE("DONT_CARE"),
		.DIFF_TERM("TRUE"), 
		.IBUF_DELAY_VALUE("0"),
		.IFD_DELAY_VALUE("AUTO"), 
		.IOSTANDARD("DEFAULT") 
	) IBUFDS_CH2_DATA_3 (
		.I(ch2_data_in_p[3]),
		.IB(ch2_data_in_n[3]), 
		.O(ch2_data_in[3])
	);
	IBUFDS #(
		.CAPACITANCE("DONT_CARE"),
		.DIFF_TERM("TRUE"), 
		.IBUF_DELAY_VALUE("0"),
		.IFD_DELAY_VALUE("AUTO"), 
		.IOSTANDARD("DEFAULT") 
	) IBUFDS_CH2_DATA_4 (
		.I(ch2_data_in_p[4]),
		.IB(ch2_data_in_n[4]), 
		.O(ch2_data_in[4])
	);
	IBUFDS #(
		.CAPACITANCE("DONT_CARE"),
		.DIFF_TERM("TRUE"), 
		.IBUF_DELAY_VALUE("0"),
		.IFD_DELAY_VALUE("AUTO"), 
		.IOSTANDARD("DEFAULT") 
	) IBUFDS_CH2_DATA_5 (
		.I(ch2_data_in_p[5]),
		.IB(ch2_data_in_n[5]), 
		.O(ch2_data_in[5])
	);
	IBUFDS #(
		.CAPACITANCE("DONT_CARE"),
		.DIFF_TERM("TRUE"), 
		.IBUF_DELAY_VALUE("0"),
		.IFD_DELAY_VALUE("AUTO"), 
		.IOSTANDARD("DEFAULT") 
	) IBUFDS_CH2_DATA_6 (
		.I(ch2_data_in_p[6]),
		.IB(ch2_data_in_n[6]), 
		.O(ch2_data_in[6])
	);
	IBUFDS #(
		.CAPACITANCE("DONT_CARE"),
		.DIFF_TERM("TRUE"), 
		.IBUF_DELAY_VALUE("0"),
		.IFD_DELAY_VALUE("AUTO"), 
		.IOSTANDARD("DEFAULT") 
	) IBUFDS_CH2_DATA_7 (
		.I(ch2_data_in_p[7]),
		.IB(ch2_data_in_n[7]), 
		.O(ch2_data_in[7])
	);
	IBUFDS #(
		.CAPACITANCE("DONT_CARE"),
		.DIFF_TERM("TRUE"), 
		.IBUF_DELAY_VALUE("0"),
		.IFD_DELAY_VALUE("AUTO"), 
		.IOSTANDARD("DEFAULT") 
	) IBUFDS_CH2_DATA_8 (
		.I(ch2_data_in_p[8]),
		.IB(ch2_data_in_n[8]), 
		.O(ch2_data_in[8])
	);
	IBUFDS #(
		.CAPACITANCE("DONT_CARE"),
		.DIFF_TERM("TRUE"), 
		.IBUF_DELAY_VALUE("0"),
		.IFD_DELAY_VALUE("AUTO"), 
		.IOSTANDARD("DEFAULT") 
	) IBUFDS_CH2_DATA_9 (
		.I(ch2_data_in_p[9]),
		.IB(ch2_data_in_n[9]), 
		.O(ch2_data_in[9])
	);
	IBUFDS #(
		.CAPACITANCE("DONT_CARE"),
		.DIFF_TERM("TRUE"), 
		.IBUF_DELAY_VALUE("0"),
		.IFD_DELAY_VALUE("AUTO"), 
		.IOSTANDARD("DEFAULT") 
	) IBUFDS_CH2_DATA_10 (
		.I(ch2_data_in_p[10]),
		.IB(ch2_data_in_n[10]), 
		.O(ch2_data_in[10])
	);
	IBUFDS #(
		.CAPACITANCE("DONT_CARE"),
		.DIFF_TERM("TRUE"), 
		.IBUF_DELAY_VALUE("0"),
		.IFD_DELAY_VALUE("AUTO"), 
		.IOSTANDARD("DEFAULT") 
	) IBUFDS_CH2_DATA_11 (
		.I(ch2_data_in_p[11]),
		.IB(ch2_data_in_n[11]), 
		.O(ch2_data_in[11])
	);
	IBUFDS #(
		.CAPACITANCE("DONT_CARE"),
		.DIFF_TERM("TRUE"), 
		.IBUF_DELAY_VALUE("0"),
		.IFD_DELAY_VALUE("AUTO"), 
		.IOSTANDARD("DEFAULT") 
	) IBUFDS_CH2_DATA_12 (
		.I(ch2_data_in_p[12]),
		.IB(ch2_data_in_n[12]), 
		.O(ch2_data_in[12])
	);
	
// **********  Declare the 13 ch3 data differential input buffers *********
	IBUFDS #(
		.CAPACITANCE("DONT_CARE"),
		.DIFF_TERM("TRUE"), 
		.IBUF_DELAY_VALUE("0"),
		.IFD_DELAY_VALUE("AUTO"), 
		.IOSTANDARD("DEFAULT") 
	) IBUFDS_CH3_DATA_0 (
		.I(ch3_data_in_p[0]),
		.IB(ch3_data_in_n[0]), 
		.O(ch3_data_in[0])
	);
	IBUFDS #(
		.CAPACITANCE("DONT_CARE"),
		.DIFF_TERM("TRUE"), 
		.IBUF_DELAY_VALUE("0"),
		.IFD_DELAY_VALUE("AUTO"), 
		.IOSTANDARD("DEFAULT") 
	) IBUFDS_CH3_DATA_1 (
		.I(ch3_data_in_p[1]),
		.IB(ch3_data_in_n[1]), 
		.O(ch3_data_in[1])
	);
	IBUFDS #(
		.CAPACITANCE("DONT_CARE"),
		.DIFF_TERM("TRUE"), 
		.IBUF_DELAY_VALUE("0"),
		.IFD_DELAY_VALUE("AUTO"), 
		.IOSTANDARD("DEFAULT") 
	) IBUFDS_CH3_DATA_2 (
		.I(ch3_data_in_p[2]),
		.IB(ch3_data_in_n[2]), 
		.O(ch3_data_in[2])
	);
	IBUFDS #(
		.CAPACITANCE("DONT_CARE"),
		.DIFF_TERM("TRUE"), 
		.IBUF_DELAY_VALUE("0"),
		.IFD_DELAY_VALUE("AUTO"), 
		.IOSTANDARD("DEFAULT") 
	) IBUFDS_CH3_DATA_3 (
		.I(ch3_data_in_p[3]),
		.IB(ch3_data_in_n[3]), 
		.O(ch3_data_in[3])
	);
	IBUFDS #(
		.CAPACITANCE("DONT_CARE"),
		.DIFF_TERM("TRUE"), 
		.IBUF_DELAY_VALUE("0"),
		.IFD_DELAY_VALUE("AUTO"), 
		.IOSTANDARD("DEFAULT") 
	) IBUFDS_CH3_DATA_4 (
		.I(ch3_data_in_p[4]),
		.IB(ch3_data_in_n[4]), 
		.O(ch3_data_in[4])
	);
	IBUFDS #(
		.CAPACITANCE("DONT_CARE"),
		.DIFF_TERM("TRUE"), 
		.IBUF_DELAY_VALUE("0"),
		.IFD_DELAY_VALUE("AUTO"), 
		.IOSTANDARD("DEFAULT") 
	) IBUFDS_CH3_DATA_5 (
		.I(ch3_data_in_p[5]),
		.IB(ch3_data_in_n[5]), 
		.O(ch3_data_in[5])
	);
	IBUFDS #(
		.CAPACITANCE("DONT_CARE"),
		.DIFF_TERM("TRUE"), 
		.IBUF_DELAY_VALUE("0"),
		.IFD_DELAY_VALUE("AUTO"), 
		.IOSTANDARD("DEFAULT") 
	) IBUFDS_CH3_DATA_6 (
		.I(ch3_data_in_p[6]),
		.IB(ch3_data_in_n[6]), 
		.O(ch3_data_in[6])
	);
	IBUFDS #(
		.CAPACITANCE("DONT_CARE"),
		.DIFF_TERM("TRUE"), 
		.IBUF_DELAY_VALUE("0"),
		.IFD_DELAY_VALUE("AUTO"), 
		.IOSTANDARD("DEFAULT") 
	) IBUFDS_CH3_DATA_7 (
		.I(ch3_data_in_p[7]),
		.IB(ch3_data_in_n[7]), 
		.O(ch3_data_in[7])
	);
	IBUFDS #(
		.CAPACITANCE("DONT_CARE"),
		.DIFF_TERM("TRUE"), 
		.IBUF_DELAY_VALUE("0"),
		.IFD_DELAY_VALUE("AUTO"), 
		.IOSTANDARD("DEFAULT") 
	) IBUFDS_CH3_DATA_8 (
		.I(ch3_data_in_p[8]),
		.IB(ch3_data_in_n[8]), 
		.O(ch3_data_in[8])
	);
	IBUFDS #(
		.CAPACITANCE("DONT_CARE"),
		.DIFF_TERM("TRUE"), 
		.IBUF_DELAY_VALUE("0"),
		.IFD_DELAY_VALUE("AUTO"), 
		.IOSTANDARD("DEFAULT") 
	) IBUFDS_CH3_DATA_9 (
		.I(ch3_data_in_p[9]),
		.IB(ch3_data_in_n[9]), 
		.O(ch3_data_in[9])
	);
	IBUFDS #(
		.CAPACITANCE("DONT_CARE"),
		.DIFF_TERM("TRUE"), 
		.IBUF_DELAY_VALUE("0"),
		.IFD_DELAY_VALUE("AUTO"), 
		.IOSTANDARD("DEFAULT") 
	) IBUFDS_CH3_DATA_10 (
		.I(ch3_data_in_p[10]),
		.IB(ch3_data_in_n[10]), 
		.O(ch3_data_in[10])
	);
	IBUFDS #(
		.CAPACITANCE("DONT_CARE"),
		.DIFF_TERM("TRUE"), 
		.IBUF_DELAY_VALUE("0"),
		.IFD_DELAY_VALUE("AUTO"), 
		.IOSTANDARD("DEFAULT") 
	) IBUFDS_CH3_DATA_11 (
		.I(ch3_data_in_p[11]),
		.IB(ch3_data_in_n[11]), 
		.O(ch3_data_in[11])
	);
	IBUFDS #(
		.CAPACITANCE("DONT_CARE"),
		.DIFF_TERM("TRUE"), 
		.IBUF_DELAY_VALUE("0"),
		.IFD_DELAY_VALUE("AUTO"), 
		.IOSTANDARD("DEFAULT") 
	) IBUFDS_CH3_DATA_12 (
		.I(ch3_data_in_p[12]),
		.IB(ch3_data_in_n[12]), 
		.O(ch3_data_in[12])
	);
	
endmodule


// *****************  DELAY_CALC  *********************************************
// v1.0 testbenched
//
// This module simply takes in three delay values and a synchronous strobe.
// When the strobe arrives, the 3 values are combined to calculate the tap setting
// of two IODELAY elements, with the two results being registered and stored
//
// data_offset_delay is used to vary the phase of the the data delays versus drdy
// In this way, constant offsets can be removed or sampling window measured
//
// For the ADC data IDELAYS, the formula is:
// data_offset_delay + delay_modifier - scan_delay
//
// For the ADC data and data ready IDELAYS, the formula is:
// delay_modifier - scan_delay
//
// Added a 32 count constant offset to data and drdy delays to allow -ve 
// delay modifier 
//
// For the ADC clock output ODELAY, the value is just scan_delay
//
// As scan_delay is increased, the phase between the logic 357 and the adc data
// is therefore preserved.  If the phase drifts (temperature etc), then this is 
// detected by the alignment monitor module which updates delay_modifier
//
// First, the register adc_data_delay_2s is written to.  This contains the 2's comp
// result of the the arithmetic (9-bit).  The output is based on this register,
// and saturates at 0 - 63.

module delay_calc (
	clk40,
	rst,
	data_offset_delay,
	delay_modifier,
	scan_delay,
	strb,
	adc_clock_delay,
	adc_data_delay,
	adc_drdy_delay,
	saturated
);

input clk40;
input rst;
input [6:0] data_offset_delay;
input [6:0] delay_modifier;
input [5:0] scan_delay;
input strb;

output [5:0] adc_clock_delay;
output [5:0] adc_data_delay;
output [5:0] adc_drdy_delay;
output saturated;

//Internal registers
reg [5:0] adc_clock_delay;
reg [7:0] adc_data_delay_2s;
reg [7:0] adc_drdy_delay_2s;

always @(posedge clk40 or posedge rst) begin
	if (rst) begin
		adc_clock_delay <= 0;
		adc_data_delay_2s <= 0;
		adc_drdy_delay_2s <= 0;
	end else begin
		if (strb) begin
			//Calculate the output delay values
			//Note that data_offset_delay is signed and scan is unsigned, delay_modifier is twos complement
			//The scan_delay is flipped to be negative here
			//Adding together gives twos complement number from -127 to 126 (8 bit)
			//therefore must pad the other numbers to 8-bit for the maths to work
			//The 32 sets a middlepoint of the idelay as default
			adc_data_delay_2s <= 8'd32 + {data_offset_delay[6],data_offset_delay} + {delay_modifier[6],delay_modifier} + (8'b1 + ~scan_delay);
			adc_drdy_delay_2s <= 8'd32 + {delay_modifier[6],delay_modifier} + (8'b1 + ~scan_delay);
			adc_clock_delay <= scan_delay;
		end
	end
end

//Check for saturation
assign adc_data_delay = (adc_data_delay_2s[7] ? 6'b0 : ( (adc_data_delay_2s[6:0] > 6'd63) ? 6'd63 : adc_data_delay_2s[5:0]));
assign adc_drdy_delay = (adc_drdy_delay_2s[7] ? 6'b0 : ( (adc_drdy_delay_2s[6:0] > 6'd63) ? 6'd63 : adc_drdy_delay_2s[5:0]));
assign saturated = ( (adc_data_delay_2s[7] ? 1 : ( (adc_data_delay_2s[6:0] > 6'd63) ? 1 : 0)) ||
							(adc_drdy_delay_2s[7] ? 1 : ( (adc_drdy_delay_2s[6:0] > 6'd63) ? 1 : 0)) );

endmodule





// *****************  ALIGN_MONITOR  ******************************************
//
// Only operates when align_en is high
//
// On the 40MHz domain the main_count counts out 127 sets of samples.  In each 
// sampling routine, sample_trig is taken high and synched onto the 357 domain.
// The 357 domain then samples the data ready on consec. rising, falling, rising edges.
// These 3 samples are then synched back to the 40MHz logic, and added to a running count.
// If all of sample 1 are the same, all of sample 3 are opposite to sample 1, and
// approx. 50% of sample 2 are set, then the 357 phase wrt data ready (and hence adc data)
// is correct.  If not, the delay_modifier is changed.  This modification is applied
// to the IDELAY on the adc data/data ready inputs.
//
// One complication is that the overall phase of data ready is not known.  In order
// that the sampling is consistant over successive sample_trigs, we must force samples 1
// and 3 to always be on given data ready values. This is done by taking a zeroth sample
// on the first 357 rising edge after sample_trig.  If this is 0, then continue, else
// delay all by a cycle of 357 to get into the correct phase 
//
// When the delay modifier charnges, a strobe is sent for 1 40MHz cycle
//
// *Following commented out for now*
// Additional complication.  When the clock phase is set perfectly badly, then the 
// sample 0 value depends on the jitter.  This leads to random samping in all
// sample 1, 2 & 3!  Hence additional check is implemented if sample 2 is within
// threshold.  If sample3 count !=0 or sample2 count != 127 then prang the delay mod
//
//
// IODELAY ar 64 tap, or 6-bit.  The delay_modifier is a 7-bit 2's comp. number which
// is comined in the delay_calc module with some nominal delay
// i.e is from -64 upto +63
//

//
//////////////////////////////////////////////////////////////////////////////////
module align_monitor( 
	clk357,
	drdy,
	clk40,
	rst,
	align_en,
	delay_modifier,
	delay_mod_strb,
	count1,		//Monitoring
	count2,		//Monitoring
	count3,		//Monitoring
	monitor_strb
);

input clk357;
input drdy;
input clk40;
input rst;
input align_en;
output [6:0] delay_modifier;
output delay_mod_strb;
output [6:0] count1;
output [6:0] count2;
output [6:0] count3;
output monitor_strb;

//Internal registers

//Taking sample_trig high initiates the sampling on 357 domain
reg sample_trig;
reg sample_trig_a;
reg sample_trig_b;
reg delay_mod_strb;

reg [1:0] sample_state;

// For samples
reg samp0;
reg samp1;
reg samp2;
reg samp3;

reg monitor_strb;

// Instantiate the double data input in the IOB
IDDR #(
	.DDR_CLK_EDGE("OPPOSITE_EDGE"), 
	.INIT_Q1(1'b0),
	.INIT_Q2(1'b0),
	.SRTYPE("ASYNC")
) DRDY_IDDR (
	.Q1(Q1),
	.Q2(Q2),
	.C(clk357), 
	.CE(1'b1), 
	.D(drdy),
	.R(rst),
	.S(1'b0) 
);

(* equivalent_register_removal = "no" *) reg align_en_a, align_en_b, align_en_slow_a, align_en_slow_b;

always @(posedge clk357 or posedge rst) begin
	if (rst) begin
		sample_trig_a <= 0;
		sample_trig_b <= 0;
		sample_state <= 0;
		samp0 <= 0;
		samp1 <= 0;
		samp2 <= 0;
		samp3 <= 0;
	end else begin
	align_en_a <= align_en;
	align_en_b <= align_en_a;
	 if (align_en_b) begin
		//Synchronise sample_trig
		sample_trig_a <= sample_trig;
		sample_trig_b <= sample_trig_a;
		
		//Take the samples if sample trig is high
		if (sample_trig_b) begin
			case (sample_state)
			2'd0: begin
				//Take zeroth sample
				samp0 <= Q1;
				sample_state <= 2'd1;
				end
			2'd1: begin
				if (~samp0) begin
					//We are on the correct phase, so continue
					samp1 <= Q1;
					samp2 <= Q2;
					//Increment state
					sample_state <= 2'd2;
				end else begin
					//Incorrect phase, so ignore this cycle and wait until next
					samp0 <= 0;
				end
				end
			2'd2: begin
				//Take third sample 
				samp3 <= Q1;
				//Increment state
				sample_state <= 2'd3;			
				end
			endcase
		end else begin
			//When sample_trig goes low, reset state
			sample_state <= 2'd0;
		end	
	 end	
	end
end


//This logic runs on 40MHz domain
//Assert sample_trig then synchronise the three samples to 40MHz
//Add the samples to three counters to track how many of each are set
//Do so n_samp times

//Secondly, increment or decrement the delay_modifier depending on whether 
//or not sample 2's count falls within a threshold range.  The sample1  and 3 counts
//determine which way to move (delay_modifier is twos comp)

reg [6:0] delay_modifier;

reg samp1_a;
reg samp2_a;
reg samp3_a;
reg samp1_b;
reg samp2_b;
reg samp3_b;


parameter counter_bits = 7;
parameter n_samp = 127;
parameter threshold_min = 20;
parameter threshold_max = 107;
reg [counter_bits-1:0] main_count;
reg [counter_bits-1:0] samp1_count;
reg [counter_bits-1:0] samp2_count;
reg [counter_bits-1:0] samp3_count;

//To store the final sample counter values for monitoring purposes
reg [counter_bits-1:0] count1_mon;
reg [counter_bits-1:0] count2_mon;
reg [counter_bits-1:0] count3_mon;

reg [1:0] state40;

always @(posedge clk40 or posedge rst) begin
	if (rst) begin
		sample_trig <= 0;
		delay_modifier <= 0;
		samp1_a <= 0;
		samp2_a <= 0;
		samp3_a <= 0;
		samp1_b <= 0;
		samp2_b <= 0;
		samp3_b <= 0;
		main_count <= 0;
		samp1_count <= 0;
		samp2_count <= 0;
		samp3_count <= 0;
		state40 <= 0;
		delay_mod_strb <= 0;
		monitor_strb <= 0;
	end else begin
	align_en_slow_a <= align_en;
	align_en_slow_b <= align_en_slow_a;
	 if (align_en_slow_b) begin
		if (main_count < n_samp) begin
			case (state40)
			3'd0: begin
				//Tell 357MHz logic to take some samples
				sample_trig <= 1;
				state40 <= 3'd1;
				//Turn off the strobe
				delay_mod_strb <= 0;
				monitor_strb <= 0;
				end
			3'd1: begin
				//Start synchronsing samples onto the 40MHz domain
				samp1_a <= samp1;
				samp2_a <= samp2;
				samp3_a <= samp3;
				sample_trig <= 0;
				state40 <= 3'd2;
				end
			3'd2: begin
				//Finish synching
				samp1_b <= samp1_a;
				samp2_b <= samp2_a;
				samp3_b <= samp3_a;
				state40 <= 3'd3;
				end
			3'd3: begin
				//Add to running totals
				samp1_count <= samp1_count + samp1_b;
				samp2_count <= samp2_count + samp2_b;
				samp3_count <= samp3_count + samp3_b;
				//Increment main counter and reset state
				main_count <= main_count + 1;
				state40 <= 3'd0;
				end
			endcase
		end else begin
			//Finished counting the samples
			//Must modify the delay if samp2_count is outside the threshold
			//Generally, unless the sampling point is well off, then all of sample 1
			//should be set or unset, and all of sample 3 the opposite
			//Just in case though, will take a majority decision for the possible case of the
			//sample point being well off the optimum position, allowing for correction
//			if (samp1_count >= samp2_count) begin
//				if (samp2_count < threshold_min)	delay_modifier = delay_modifier + (7'b1);
//				if (samp2_count > threshold_max)	delay_modifier = delay_modifier + (-7'b1);
//			end
//			if (samp1_count < samp2_count) begin
//				if (samp2_count < threshold_min)	delay_modifier = delay_modifier + (-7'b1);
//				if (samp2_count > threshold_max)	delay_modifier = delay_modifier + (7'b1);
//			end	
			
			//First check for 'perfect misphasing'
	//This was removed after tests at ATF showed occasional jumps by 20 saturating
	//the delays
	/*		if ( (samp1_count < threshold_max) || (samp3_count > threshold_min) ) begin
				//Hmmm.  Move delay_mod by half a 357 in which ever direction takes i closer
				//to zero to help avoid saturation
				if (delay_modifier[6]) begin
					//Negative
					delay_modifier <= delay_modifier + 7'd20;
					delay_mod_strb <= 1;		
				end else begin
					delay_modifier <= delay_modifier + (-7'd20);
					delay_mod_strb <= 1;		
				end
			end else begin */
			
				//Things see okay, so check whether samp2 is within threshold
				if ( (samp2_count < threshold_min) || (samp2_count > threshold_max) ) begin
					//Outside of threshold so modify but prevent wrap-around
					if (samp2_count > 64) begin
						if (delay_modifier != 7'b1000000) begin
							delay_modifier <= delay_modifier + (-7'b1);
							delay_mod_strb <= 1;
						end
					end else begin
						if (delay_modifier != 7'b0111111) begin
							delay_modifier <= delay_modifier + (7'b1);
							delay_mod_strb <= 1;				
						end
					end
				end
		//	end

			//Store values for monitoring and output strobe
			count1_mon <= samp1_count;
			count2_mon <= samp2_count;
			count3_mon <= samp3_count;		
			monitor_strb <= 1;
						
			//Additional check for 'perfect' misphasing
//			if ( (samp2_count < threshold_max) && (samp2_count > threshold_min) &&
//				( (samp1_count < 127) || (samp3_count > 0) ) ) begin
//					//Something ain't right.  Prang the delay by half a period in which
//					//ever direction takes it closer to zero
//					if (delay_modifier[6])
//						delay_modifier <= delay_modifier + 7'd20;
//					else
//						delay_modifier <= delay_modifier + (-7'd20);
//			end
			main_count <= 0;
			samp1_count <= 0;
			samp2_count <= 0;
			samp3_count <= 0;
		end
	 end
	end
end

// Output the temp monitored counters
assign count1 = count1_mon;
assign count2 = count2_mon;
assign count3 = count3_mon;

endmodule


///////////////// ** iodelay_incrementor ** //////////////////////////////////////////
//
// This module is clocked at 40MHz.  It waits for a trigger pulse synchronous to 40Mhz,
// at which point it counts up to the spec_delay input in units of 40MHz using its
// internal 6 bit counter.  During this time, it outputs an inc_en strobe which is to be
// connected to an idelay element's ce.  In this way, the idelay's tap is set to the value
// of spec_delay.  The module exposes the counter value as actual_delay for debugging/monitoring
//
// Notes:  This element must be reset together with its associated idelay!!!!!
//			  The 6-bit counter will wrap around with the idelay's 6-bit tap count
//
	
module iodelay_incrementor(
	clk40,
	rst,
	count_trig,
	spec_delay,
	inc_en,
	actual_delay
);

// Ports
input 			clk40;
input 			rst;
input 			count_trig;
input  [5:0] 	spec_delay;
output			inc_en;
output [5:0]	actual_delay;	
		
// Internal registers
reg [5:0]	actual_delay;
reg			inc_en;

always @(posedge clk40 or posedge rst) begin
	if (rst) begin
		inc_en <= 0;
		actual_delay <= 0;
	end else begin
		if (inc_en) begin
			//Triggered
			if (actual_delay == spec_delay) begin
				inc_en <= 0;
			end else begin
				actual_delay <= actual_delay + 1;
			end
		end else begin
			if (count_trig) begin
				//Trigger idelay count
				inc_en <= 1;
			end
		end
	end
end

endmodule
