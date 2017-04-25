`timescale 1ns / 1ps

///////////////// ** font5_ctrl_reg_357 ** //////////////////////////////////////////
//
// This module contains the control registers for the font5 9 channel daq firmware
// Clocked at 357MHz
//
// It consists of 7-bit registers, with 5 bit addresses
// Data, data strobe and address to be written are all to be provided asynchronously
// and brought onto this clock domain (logic 357)
//
// Also includes logic for readbacks.  This is identical to the DAQ RAM readout
// logic, and transmits each ctrl reg in turn on 40MHz
//
// -Signal-				-Address-
//	trig_delay				0				
//	trig_out_delay			1
//	trig_out_en				2
//	p1_bunch1pos			{4, 3}
//	p1_bunch2pos			{6, 5}
//	p1_bunch3pos			{8, 7}	
//	p2_bunch1pos			{10, 9}
//	p2_bunch2pos			{12, 11}
//	p2_bunch3pos			{14, 13}	
//	p3_bunch1pos			{16, 15}
//	p3_bunch2pos			{18, 17}
//	p3_bunch3pos			{20, 19}	
//	k1_fb_on					21[0]			Note register 21 holds several 1 bit flags for dac control
//	k2_fb_on					21[1]
//	k1_delayloop_on		21[2]
//	k2_delayloop_on		21[3]
//	k1_const_dac_en		21[4]
//	k2_const_dac_en		21[5]
//	k1_const_dac_out		{23, 22}
//	k2_const_dac_out		{25, 24}
//	clk2_16_edge_sel		26
// sample_hold_off		27
// big_trig_delay			{29,28}
// trig_out_delay2		30

module font5_ctrl_reg_357 (	
	clk,
	rst,
	addr,
	data,
	data_strb,
	tx_en,
	tx_clk,
	tx_data_ready,
	tx_data,
	tx_data_loaded,
	tx_complete,	
	trig_delay,					
	trig_out_delay,	
	trig_out_en,		
	p1_bunch1pos,			
	p1_bunch2pos,			
	p1_bunch3pos,			
	p2_bunch1pos,			
	p2_bunch2pos,			
	p2_bunch3pos,		
	p3_bunch1pos,		
	p3_bunch2pos,			
	p3_bunch3pos,			
	k1_fb_on,				
	k2_fb_on,				
	k1_delayloop_on,			
	k2_delayloop_on,			
	k1_const_dac_en,			
	k2_const_dac_en,			
	k1_const_dac_out,		
	k2_const_dac_out,		
	clk2_16_edge_sel,
	sample_hold_off,
	big_trig_delay,
	trig_out_delay2
	//sync_en
);

// Parameters
//parameter N_CTRL_REGS = 32;
parameter N_CTRL_REGS = 31;


// Ports
input					clk;
input					rst;
input		[4:0]		addr;
input		[6:0]		data;
input					data_strb;
input					tx_en;
input					tx_clk;
input					tx_data_loaded;
output				tx_data_ready;
output				tx_data;
output				tx_complete;
output 	[6:0]		trig_delay;					
output 	[6:0]		trig_out_delay;		
output 				trig_out_en;				
output 	[7:0]		p1_bunch1pos;			
output 	[7:0]		p1_bunch2pos;			
output 	[7:0]		p1_bunch3pos;			
output  	[7:0]		p2_bunch1pos;			
output 	[7:0]		p2_bunch2pos;			
output 	[7:0]		p2_bunch3pos;		
output 	[7:0]		p3_bunch1pos;		
output 	[7:0]		p3_bunch2pos;			
output 	[7:0]		p3_bunch3pos;			
output 				k1_fb_on;				
output 				k2_fb_on;				
output			 	k1_delayloop_on;			
output 				k2_delayloop_on;			
output 				k1_const_dac_en;			
output 				k2_const_dac_en;			
output 	[12:0]	k1_const_dac_out;		
output  	[12:0]	k2_const_dac_out;		
output 				clk2_16_edge_sel;		
output 	[6:0]		sample_hold_off;
output 	[11:0] 	big_trig_delay;
output 	[6:0]		trig_out_delay2;
//output				sync_en;
	
// Internal registers
reg [6:0] ctrl_regs [0:N_CTRL_REGS-1];
reg [4:0] addr1;
reg [4:0] addr2;
reg [6:0] data1;
reg [6:0] data2;
reg strb1;
reg strb2;

// For for loop
integer i;

always @(posedge clk or posedge rst) begin
	if (rst) begin
		for (i=0; i < N_CTRL_REGS; i=i+1) begin
			ctrl_regs[i] <= 0;
		end
		addr1 <= 0;
		addr2 <= 0;
		data1 <= 0;
		data2 <= 0;
		strb1 <= 0;
		strb2 <= 0;
	end else begin
		//Synchronise the inputs
		addr1 <= addr;
		addr2 <= addr1;
		data1 <= data;
		data2 <= data1;
		strb1 <= data_strb;
		strb2 <= strb1;
		
		//When the strobe is present, store data at addr
		if (strb2) begin
			ctrl_regs[addr2] <= data2;
		end
	end
end



//Produce output signals
wire [6:0] temp1, temp2, temp3, temp4, temp5, temp6, temp7, temp8, temp9, temp10, temp11, temp12, temp13;//, temp14;

assign trig_delay = ctrl_regs[0];			
assign trig_out_delay = ctrl_regs[1];
assign trig_out_en = (ctrl_regs[2]==0) ? 0 : 1;

assign temp1 = ctrl_regs[4];
assign p1_bunch1pos  = {temp1[0], ctrl_regs[3]};
assign temp2 = ctrl_regs[6];
assign p1_bunch2pos  = {temp2[0], ctrl_regs[5]};
assign temp3 = ctrl_regs[8];
assign p1_bunch3pos  = {temp3[0], ctrl_regs[7]};

assign temp4 = ctrl_regs[10];
assign p2_bunch1pos  = {temp4[0], ctrl_regs[9]};
assign temp5 = ctrl_regs[12];
assign p2_bunch2pos  = {temp5[0], ctrl_regs[11]};
assign temp6 = ctrl_regs[14];
assign p2_bunch3pos  = {temp6[0], ctrl_regs[13]};

assign temp7 = ctrl_regs[16];
assign p3_bunch1pos  = {temp7[0], ctrl_regs[15]};
assign temp8 = ctrl_regs[18];
assign p3_bunch2pos  = {temp8[0], ctrl_regs[17]};
assign temp9 = ctrl_regs[20];
assign p3_bunch3pos  = {temp9[0], ctrl_regs[19]};
		
assign temp10 = ctrl_regs[21];
assign k1_fb_on = temp10[0];				
assign k2_fb_on = temp10[1];				
assign k1_delayloop_on = temp10[2];			
assign k2_delayloop_on = temp10[3];			
assign k1_const_dac_en = temp10[4];			
assign k2_const_dac_en = temp10[5];
			
assign temp12 = ctrl_regs[23];
assign k1_const_dac_out	= {temp12[5:0], ctrl_regs[22]};

assign temp13 = ctrl_regs[25];
assign k2_const_dac_out	= {temp13[5:0], ctrl_regs[24]};

assign clk2_16_edge_sel	= (ctrl_regs[26]==0) ? 0 : 1;	
assign sample_hold_off = ctrl_regs[27];

assign temp11 = ctrl_regs[29];
assign big_trig_delay = {temp11[4:0], ctrl_regs[28]};

assign trig_out_delay2 = ctrl_regs[30];

//assign temp14 = ctrl_regs[31];
//assign sync_en = temp14[0];


// Readback logic.  This works as the DAQ RAM readback.  Each ctrl reg is
// stepped trhough in turn, with its data presented until transmitted by the uart
reg [4:0]   tx_cnt;
reg			tx_data_ready;
reg			tx_data_loaded1;
reg			tx_data_loaded2;
reg 			tx_complete;
reg [7:0]	tx_data;
always @(posedge tx_clk or posedge rst) begin
	if (rst) begin
		tx_cnt <= 0;
		tx_data_ready <= 0;
		tx_data_loaded1 <= 0;
		tx_data_loaded2 <= 0;
		tx_complete <= 0;
	end else begin
		//tx_data_loaded is asserted by the UART once it has loaded the current
		//data word.  Since the UART operates on the baud clock domain, synchronise
		tx_data_loaded1 <= tx_data_loaded;
		tx_data_loaded2 <= tx_data_loaded1;
		if (!tx_complete) begin
			if (tx_en) begin
				//Transmission of RAM contents enabled
				if (!tx_data_ready && !tx_data_loaded2) begin
					if (tx_cnt == N_CTRL_REGS) begin
							//We have transmitted the data from the last address
							tx_complete <= 1;
					end else begin
						//Load the data from RAM address currently specified by tx_cnt
						tx_data_ready <= 1;
					end
				end else begin
					if (tx_data_ready && tx_data_loaded2) begin
						//Data word has been loaded to the uart.  tx_data_loaded will stay 
						//high until the UART transmission has finished
						tx_data_ready <= 0;
						tx_cnt <= tx_cnt + 1;
					end
				end
			end
		end else begin
			//Transmission is complete.  Wait for enable to go low, then reset tx logic
			if (!tx_en) begin
				tx_cnt <= 0;
				tx_data_ready <= 0;
				tx_data_loaded1 <= 0;
				tx_data_loaded2 <= 0;
				tx_complete <= 0;
			end
		end
	end
end
			
// Logic to append leading 1 to ram output to designate as data word
always @(posedge tx_clk) tx_data <= {1'b1, ctrl_regs[tx_cnt]};


endmodule





///////////////// ** font5_ctrl_reg_40 ** //////////////////////////////////////////
//
// This module contains the control registers for the font5 9 channel daq firmware
// Clocked at 40MHz
//
// It consists of 7-bit registers, 5-bit addresses
// Data, data strobe and address to be written are all to be provided 'asynchronously'
// and brought onto this clock domain (40 MHz, note signals also provided @40 MHz
//
// -Signal-				-Address-
//	p1_align_ch_sel		0
//	p2_align_ch_sel		1
//	p3_align_ch_sel		2
//	p1_offset_delay		3
//	p2_offset_delay		4
//	p3_offset_delay		5
//	p1_scan_delay			6
//	p2_scan_delay			7
//	p3_scan_delay			8
//	master357_delay		9
//
// k1_b2_offset		{11, 10}
// k1_b3_offset		{13, 12}
// 
// Ring clock threshold code 14
// Trigger threshold code	  15
//
// k1_fir_k1		 16

//	k2_b2_offset		{18, 17}
//	k2_b3_offset		{20, 19}
//	k2_fir_k1				21

// k1_bunch_strb_sel		22




module font5_ctrl_reg_40 (	
	clk,
	rst,
	addr,
	data,
	data_strb,
	tx_en,
	tx_clk,
	tx_data_ready,
	tx_data,
	tx_data_loaded,
	tx_complete,	
	p1_align_ch_sel,
	p2_align_ch_sel,
	p3_align_ch_sel,
	p1_offset_delay,
	p2_offset_delay,
	p3_offset_delay,
	p1_scan_delay,
	p2_scan_delay,
	p3_scan_delay,
	master357_delay,
	k1_b2_offset,
	k1_b3_offset,
	ring_clk_thresh_code,
	trig_thresh_code,
	k1_fir_k1,
	k2_b2_offset,
	k2_b3_offset,
	k2_fir_k1,
	k1_bunch_strb_sel
	//slow_clk_gate_en
	
//	k2_bunch_strb_sel
);

// Parameters
//parameter N_CTRL_REGS = 32;
parameter N_CTRL_REGS = 23;

// Ports
input					clk;
input					rst;
input		[4:0]		addr;
input		[6:0]		data;
input					data_strb;
input					tx_en;
input					tx_clk;
input					tx_data_loaded;
output				tx_data_ready;
output				tx_data;
output				tx_complete;
//output 	[1:0]		p1_align_ch_sel;	
//output 	[1:0]		p2_align_ch_sel;
`ifdef DIGIN_UART_RX
	output 	[6:0]		p1_align_ch_sel;	// For SR variant //modified 16/6/16 for doug Special version
	output 	[6:0]		p2_align_ch_sel; // For SR variant  //modified 16/6/16 for doug Special version
`else
	output 	[5:0]		p1_align_ch_sel;	// For SR variant
	output 	[5:0]		p2_align_ch_sel; // For SR variant
`endif
//output 	[1:0]		p3_align_ch_sel;
`ifdef UART2_SELF_TEST
	output 	[6:0]		p3_align_ch_sel; // For SR variant  //modified 16/6/16 for doug Special version
`else
	output 	[5:0]		p3_align_ch_sel; // For SR variant
`endif
output 	[6:0]		p1_offset_delay;
output 	[6:0]		p2_offset_delay;
output 	[6:0]		p3_offset_delay;
output 	[5:0]		p1_scan_delay;
output 	[5:0]		p2_scan_delay;
output 	[5:0]		p3_scan_delay;
output 	[5:0]		master357_delay;
output 	[12:0]	k1_b2_offset;
output 	[12:0]	k1_b3_offset;
output	[6:0]		ring_clk_thresh_code;
output	[6:0] 	trig_thresh_code;
output   [6:0]    k1_fir_k1;
output   [12:0]  	k2_b2_offset;
output   [12:0]  	k2_b3_offset;
output   [6:0]   	k2_fir_k1;
output				k1_bunch_strb_sel;
//output				slow_clk_gate_en;
//output	[5:0]		k1_bunch_strb_sel;
//output	[5:0]		k2_bunch_strb_sel;

// Internal registers
reg [6:0] ctrl_regs [0:N_CTRL_REGS-1];
reg [4:0] addr1;
reg [4:0] addr2;
reg [6:0] data1;
reg [6:0] data2;
reg strb1;
reg strb2;

// For for loop
integer i;

always @(posedge clk or posedge rst) begin
	if (rst) begin
		for (i=0; i < N_CTRL_REGS; i=i+1) begin
			ctrl_regs[i] <= 0;
		end
		addr1 <= 0;
		addr2 <= 0;
		data1 <= 0;
		data2 <= 0;
		strb1 <= 0;
		strb2 <= 0;
	end else begin
		//Synchronise the inputs
		addr1 <= addr;
		addr2 <= addr1;
		data1 <= data;
		data2 <= data1;
		strb1 <= data_strb;
		strb2 <= strb1;
		
		//When the strobe is present, store data at addr
		if (strb2) begin
			ctrl_regs[addr2] <= data2;
		end
	end
end

//Produce output signals

//wire [6:0] temp1, temp2, temp3, temp5, temp6, temp7, temp8, temp9, temp10; //Commented 11/10/16 for more compact code!
wire [6:0] temp5, temp6, temp7, temp8, temp9, temp10;
wire [6:0] temp11, temp12, temp14, temp15, temp16;//, temp17;

/*assign temp1 = ctrl_regs[0];				//Commented 11/10/16 for more compact code!
//assign p1_align_ch_sel = temp1[1:0];
assign p1_align_ch_sel = temp1[5:0]; // For SR variant
assign temp2 = ctrl_regs[1];
//assign p2_align_ch_sel = temp2[1:0]; 
assign p2_align_ch_sel = temp2[5:0]; // For SR variant
assign temp3 = ctrl_regs[2];
//assign p3_align_ch_sel = temp3[1:0];
assign p3_align_ch_sel = temp3[5:0]; // For SR variant*/

`ifdef DIGIN_UART_RX
	assign p1_align_ch_sel = ctrl_regs[0][6:0]; // For SR variant //modified 16/6/16 for doug Special version
	assign p2_align_ch_sel = ctrl_regs[1][6:0]; // For SR variant //modified 16/6/16 for doug Special version 
`else
	assign p1_align_ch_sel = ctrl_regs[0][5:0]; // For SR variant
	assign p2_align_ch_sel = ctrl_regs[1][5:0]; // For SR variant
`endif
`ifdef UART2_SELF_TEST
	assign p3_align_ch_sel = ctrl_regs[2][6:0]; // For SR variant //modified 16/6/16 for doug Special version
`else
	assign p3_align_ch_sel = ctrl_regs[2][5:0]; // For SR variant 
`endif



assign temp5 = ctrl_regs[3];
assign p1_offset_delay = temp5[6:0];
assign temp6 = ctrl_regs[4];
assign p2_offset_delay = temp6[6:0];
assign temp7 = ctrl_regs[5];
assign p3_offset_delay = temp7[6:0];

assign temp8 = ctrl_regs[6];
assign p1_scan_delay = temp8[5:0];
assign temp9 = ctrl_regs[7];
assign p2_scan_delay = temp9[5:0];
assign temp10 = ctrl_regs[8];
assign p3_scan_delay = temp10[5:0];

assign master357_delay	= ctrl_regs[9][5:0];

assign temp11 = ctrl_regs[11];
assign k1_b2_offset = {temp11[5:0], ctrl_regs[10]};

assign temp12 = ctrl_regs[13];
assign k1_b3_offset = {temp12[5:0], ctrl_regs[12]};

assign ring_clk_thresh_code = ctrl_regs[14];
assign trig_thresh_code = ctrl_regs[15];

//assign temp13 = ctrl_regs[16];
assign k1_fir_k1 = ctrl_regs[16];

assign temp14 = ctrl_regs[18];
assign k2_b2_offset = {temp14[5:0], ctrl_regs[17]};
assign temp15 = ctrl_regs[20];
assign k2_b3_offset = {temp15[5:0], ctrl_regs[19]};
assign k2_fir_k1 = ctrl_regs[21];

assign temp16 = ctrl_regs[22];
assign k1_bunch_strb_sel = temp16[0];

//assign temp17 = ctrl_regs[23];
//assign k2_bunch_strb_sel = temp17[5:0];

//assign temp17 = ctrl_regs[31];
//assign slow_clk_gate_en = temp17[0];

// Readback logic.  This works as the DAQ RAM readback.  Each ctrl reg is
// stepped trhough in turn, with its data presented until transmitted by the uart
reg [4:0]   tx_cnt;
reg			tx_data_ready;
reg			tx_data_loaded1;
reg			tx_data_loaded2;
reg 			tx_complete;
reg [7:0]	tx_data;
always @(posedge tx_clk or posedge rst) begin
	if (rst) begin
		tx_cnt <= 0;
		tx_data_ready <= 0;
		tx_data_loaded1 <= 0;
		tx_data_loaded2 <= 0;
		tx_complete <= 0;
	end else begin
		//tx_data_loaded is asserted by the UART once it has loaded the current
		//data word.  Since the UART operates on the baud clock domain, synchronise
		tx_data_loaded1 <= tx_data_loaded;
		tx_data_loaded2 <= tx_data_loaded1;
		if (!tx_complete) begin
			if (tx_en) begin
				//Transmission of RAM contents enabled
				if (!tx_data_ready && !tx_data_loaded2) begin
					if (tx_cnt == N_CTRL_REGS) begin
							//We have transmitted the data from the last address
							tx_complete <= 1;
					end else begin
						//Load the data from RAM address currently specified by tx_cnt
						tx_data_ready <= 1;
					end
				end else begin
					if (tx_data_ready && tx_data_loaded2) begin
						//Data word has been loaded to the uart.  tx_data_loaded will stay 
						//high until the UART transmission has finished
						tx_data_ready <= 0;
						tx_cnt <= tx_cnt + 1;
					end
				end
			end
		end else begin
			//Transmission is complete.  Wait for enable to go low, then reset tx logic
			if (!tx_en) begin
				tx_cnt <= 0;
				tx_data_ready <= 0;
				tx_data_loaded1 <= 0;
				tx_data_loaded2 <= 0;
				tx_complete <= 0;
			end
		end
	end
end

// Logic to append leading 1 to output to designate as data word
always @(posedge tx_clk) tx_data <= {1'b1, ctrl_regs[tx_cnt]};

endmodule






///////////////// ** uart_decoder ** //////////////////////////////////////////
//
// This module listens to the UART RX data and interprets bytes as commands/data
// Clocked at the UART RX clock period of 40MHz
// Bytes are unloaded from UART manually
//
// MSB set implies data
// MSB unset implies command
//
// A command with bit 6 set specifies the address of a 7-bit control register, which becomes 
// current.  The less significant 6 bits hold the address (0-63)
// Of the control register addresses, 0-31 are dedicated to the 357 MHz domain registers
// and 32-63 indicate a 40 MHz register address with the LS 5 bits (i.e 0-31 again)
//
// Given an address 0-31
// The state reverts to the default STATE_CTRL_REGS_357
// Any subsequent data received are to be written to the current 357 control register
//
// Given an address 32-63 the state becomes STATE_CTRL_REGS_40
// Any subsequent data are written to the current 40 control register
//
// This module exposes the control reg data along with a single cycle strobe
// The current address is exposed continuously
//
// A command with bit 6 unset and bit 5 set specifies a RAM, which becomes current
// The less significant 5 bits are the RAM select (0-31, used in demultiplexing)
// The state changes to STATE_FILL_RAM
// An internal RAM address counter is set to zero
// Any subsequent data are output with single cycle strobe, incrementing the RAM addr count
// The RAM addr count is continuously exposed
//
// Note when using larger LUT, need to write addr 0-2, skip 3, 4-6, skip 7 etc.  This
// corresponds to not using the LUT's uppermost 7 bits.  The gain LUTs (select 0,1) require
// this.  Other LUTs do not
//
// A command with both bit 5 and 6 unset is a reserved command
// Includes XON/XOFF characters (0x11 / 0x13)
// Commands:
// 7'd0 == Full reset (sets full_reset output high for one cycle)
// 7'd1 == p1_delay_trig (sets delay_trig high for once cycle)
// 7'd2 == p2_delay_trig (sets delay_trig high for once cycle)
// 7'd3 == p3_delay_trig (sets delay_trig high for once cycle)
//
// For master 357Mhz delay.  First write new delay value to the ctrl_reg
// Then must send reset, followed by trigger.  Delay will then increment to new value
// 7'd4 == clk357_idelay_rst	
// 7'd5 == clk357_idelay_trig
//
// For trim DACS.  First load the trim dac LUT then send the trigger to update them
// 7'd6 == trim_dac_trig
//
// Reserved for framing bytes in the data stream
// 7'd15 == Monitor readback
// 7'd16 == P1 ch1		(0x10)
// 7'd18 == P1 ch2		(0x12)
// 7'd20 == P1 ch3		(0x14)
// 7'd21 == P2 ch1		(0x15)
// 7'd22 == P2 ch2		(0x16)
// 7'd23 == P2 ch3		(0x17)
// 7'd24 == P3 ch1		(0x18)
// 7'd25 == P3 ch2		(0x19)
// 7'd26 == P3 ch3		(0x1A)
// 7'd27 == 357MHz ctrl reg readback	(0x1B)
// 7'd28 == 40MHz  ctrl reg readback	(0x1C)
// 7'd29 == K1 DAC readback (0x1D)
// 7'd30 == K2 DAC readback (0x1E)
// 7'd31 == Timestamp readback (0x1F)


module uart_decoder(	
	clk40,
	rst,
	byte,
	byte_ready,
	byte_unload,
	current_addr_357,
	data_strobe_357,
	data_out_357,
	current_addr_40,
	data_strobe_40,
	data_out_40,
	ram_addr,
	ram_select,
	ram_data,
	ram_data_strobe,
	full_reset,
	p1_delay_trig,
	p2_delay_trig,
	p3_delay_trig,
	clk357_idelay_rst,
	clk357_idelay_trig,
	trim_dac_trig	
	//trim_dac_trig,
	//pulse_ctr_rst
);

// State register values
parameter STATE_CTRL_REGS_357	= 2'b00;
parameter STATE_CTRL_REGS_40	= 2'b01;
parameter STATE_FILL_RAM		= 2'b10;

// Ports
input				 clk40;
input 			 rst;
input		[7:0]	 byte;
input				 byte_ready;
output			 byte_unload;
output	[4:0]	 current_addr_357;
output			 data_strobe_357;
output	[6:0]	 data_out_357;
output	[4:0]	 current_addr_40;
output			 data_strobe_40;
output	[6:0]	 data_out_40;
output	[14:0] ram_addr;
output	[6:0]	 ram_data;
output			 ram_data_strobe;
output	[4:0]	 ram_select;
output		 	 full_reset;
output          p1_delay_trig;
output 			 p2_delay_trig;
output 			 p3_delay_trig;
output 			 clk357_idelay_rst;
output 			 clk357_idelay_trig;
output			 trim_dac_trig;
//output 			 pulse_ctr_rst;

// Internal registers
reg				 byte_unload;
reg		[4:0]  current_addr_357;
reg				 data_strobe_357;
reg		[6:0]  data_out_357;
reg		[4:0]  current_addr_40;
reg				 data_strobe_40;
reg		[6:0]  data_out_40;
reg		[14:0] ram_addr;
reg		[6:0]	 ram_data;
reg				 ram_data_strobe;
reg		[4:0]	 ram_select;
reg		 		 full_reset;
reg    	       p1_delay_trig;
reg 				 p2_delay_trig;
reg	 			 p3_delay_trig;
reg	 			 clk357_idelay_rst;
reg	 			 clk357_idelay_trig;
reg				 trim_dac_trig;
//reg 				 pulse_ctr_rst;
reg		[1:0]	 ram_addr_skip;

reg		[1:0]	 state_register;
		
always @(posedge clk40 or posedge rst) begin
	if (rst) begin
		// Enter default state (loading 357MHz domain control registers)
		state_register <= STATE_CTRL_REGS_357;
		byte_unload <= 0;
		current_addr_357 <= 0;
		data_out_357 <= 0;
		data_strobe_357 <= 0;
		current_addr_40 <= 0;
		data_out_40 <= 0;
		data_strobe_40 <= 0;
		ram_data <= 0;
		ram_addr <= 0;
		ram_data_strobe <= 0;
		ram_select <= 0;
		full_reset <= 0;
		p1_delay_trig <= 0;
		p2_delay_trig <= 0;
		p3_delay_trig <= 0;
		clk357_idelay_rst <= 0;
		clk357_idelay_trig <= 0;
		ram_addr_skip <= 0;
		//pulse_ctr_rst <= 0;
	end else begin
		//Waiting for byte_ready (synchronous to clk)
		if (byte_ready && ~byte_unload) begin
			//Byte ready, unload it
			byte_unload <= 1;
		end else begin
			if (~byte_ready && byte_unload) begin
				//Byte has been unloaded
				//DECODE BYTE HERE
				if (byte[7]) begin
					//Byte contains data.  Redirect according to state
					if (state_register == STATE_CTRL_REGS_357) begin
						data_out_357 <= byte[6:0];
						data_strobe_357 <= 1;
					end else begin 
						if (state_register == STATE_CTRL_REGS_40) begin
							data_out_40 <= byte[6:0];
							data_strobe_40 <= 1;
						end else begin 
							if (state_register == STATE_FILL_RAM) begin
								//If sent to a RAM, increment the internal RAM address counter
		//						ram_addr <= ram_addr + 1;
								ram_data <= byte[6:0];
								ram_data_strobe <= 1;	
							end
						end
					end
				end else begin
					//Byte contains command
					if (byte[6]) begin
						//This command specifies a control register
						if (byte[5]) begin
							//Control reg in 40MHz domain
							state_register <= STATE_CTRL_REGS_40;
							current_addr_40 <= byte[4:0];
						end else begin
							//Control reg in 357MHz domain
							state_register <= STATE_CTRL_REGS_357;
							current_addr_357 <= byte[4:0];
						end
					end else begin
						if (byte[5]) begin
							//This command specifies a RAM select
							state_register <= STATE_FILL_RAM;
							ram_select <= byte[4:0];
							//Reset ram address counter
							ram_addr <= 0;
							ram_addr_skip <= 0;
						end else begin
							//This is a reserved command
							case(byte[4:0])
								5'd0: full_reset   		 <= 1;
								5'd1: p1_delay_trig 		 <= 1;
								5'd2: p2_delay_trig 		 <= 1;
								5'd3: p3_delay_trig 		 <= 1;
								5'd4: clk357_idelay_rst  <= 1;
								5'd5: clk357_idelay_trig <= 1;
								5'd6: trim_dac_trig		 <= 1;
								//5'd8: pulse_ctr_rst		 <= 1;
							endcase
						end
					end
				end
				byte_unload <= 0;
			end else begin
				//Reset the strobes after one cycle.   
				data_strobe_357    <= 0;
				data_strobe_40     <= 0;
				ram_data_strobe    <= 0;
				full_reset		    <= 0;				
				p1_delay_trig 	    <= 0;
				p2_delay_trig 	    <= 0;
				p3_delay_trig 	    <= 0;
				clk357_idelay_rst  <= 0;
				clk357_idelay_trig <= 0; 
				trim_dac_trig		 <= 0;
				//pulse_ctr_rst 		 <= 0;
				
				//Count RAM strobes to increment address
				//Skip the empty entries for FB LUTs, but not for the trim dac lut
				if (ram_data_strobe) begin
					ram_addr_skip <= ram_addr_skip + 1;
					if ((ram_select != 5'd2) && (ram_addr_skip == 2'd2)) begin
						ram_addr <= ram_addr + 2;
						ram_addr_skip <= 0;
					end else begin
						ram_addr <= ram_addr + 1;
					end
				end
			end
		end
	end
end

endmodule


///////////////// ** reset_ctrl ** //////////////////////////////////////////
//
// This module is clocked at 40MHz.  It waits for a trigger pulse synchronous to
// 40MHz before initiating one of two reset routines
//
// idelay_rst_trig causes a reset of the idelayctrl and idelay instances.  The idelayctrl
// is has its asynch reset held high for 3 cycles of 40MHz (75ns - the minimum reset time is 50ns)
// Both idelay resets are then asserted (synchronous to 40MHz as req'd) for a cycle
//
// The 200MHz clock used by idelayctrl is produced with a DCM and must be stable prior
// to reset.  full_rst_trig causes the DCM to be reset first using its asynch reset line
// The DCM nominally takes 10ms to lock, after which the reset must be held for a further
// 200ms to ensure stability.  The idelayctrl reset must be tied to the the DCMs locked signal
//
// 210ms = 8,400,000 cycles of 40MHz (24-bit counter)

module reset_ctrl(
	clk40,
	full_rst_trig,
	dcm_rst,
	idelay_rst_trig,
	idelay_rst
);

// Ports
input 	clk40;
input 	idelay_rst_trig;
input		full_rst_trig;
output 	dcm_rst;
output 	idelay_rst;

// Internal registers
reg 			dcm_rst;
reg 			idelay_rst;
reg 			rst_flag;
reg [23:0]	rst_count;

always @(posedge clk40) begin
	if (rst_flag) begin
		//Triggered
		rst_count <= rst_count + 1;
		case (rst_count)
			24'd0: begin
				//Begin resetting DCM
				dcm_rst <= 1;
			end
			24'd8500000: begin
				//212.5ms have passed.  Stop reset then reset idelayctrl
				dcm_rst <= 0;
			end
			24'd8500010: begin
				//idelayctrl is reset.  Now do idelays
				idelay_rst <= 1;
			end
			24'd8500020: begin
				//Finished
				idelay_rst <= 0;
				rst_flag <= 0;
			end
		endcase
	end else begin
		//Not triggered yet
		if (idelay_rst_trig) begin
			//Trigger partial reset
			rst_flag <= 1;
			rst_count <= 8500010;
		end else begin
			//Trigger full reset
			if (full_rst_trig) begin
				rst_flag <= 1;
				rst_count <= 0;
			end
		end
	end
end

endmodule

		


			
		
		
		