`timescale 1ns / 1ps
// *****************  DAQ_sequencer ******************************************
//
// Modified for 9 channel
//
// Clocked at 40MHz
//
// This module is a state machine to control the sequence in which the various
// structures holding data for the DAQ stream are enabled.
//
// It Waits idle until it detects the falling edge of the store_strb.  At this
// point all data for the pulse have been collected and are ready to transmit
// over the UART.  
//
// The module can write values directly to the UART for framing and timestamp purposes,
// monitoring until the values are transmited.
//
// A 7-bit counter is implemented which increments every 40ms.  The value of
// this counter is transmitted at the start of each pulse to provide a timestamp
//
// It can also enable the DAQ_RAMs and monitor until they have exposed all of
// data.  To enable a DAQ_RAM, trans_en is taken high.  The appropriate DAQ_RAM
// output must be connected to the UART externally by multiplexing based on trans_state
// Once that DAQ_RAM has finished, trans_done goes high and the state increments
//
// When all data have finally been transmitted, a reset signal is sent to the DAQ_RAMS
// Reset is also sent when the sequencer module is itself reset


module DAQ_sequencer(
	clk40,
	rst,
	strobe,
	trans_done,
	trans_state,
	trans_en,
	rst_out,
	trig_rdy,
	rs232_tx_empty,
	rs232_tx_buffer,
	rs232_tx_ld
);

input 		clk40;
input rst;
input strobe;
input trans_done;
input rs232_tx_empty;
output [5:0] trans_state;
output trans_en;
output rst_out;
output reg trig_rdy = 1'b0; //added by GBC 11/11/15 for use with BoardSynchroniser
output [7:0] rs232_tx_buffer;
output  		 rs232_tx_ld;


// Internal registers
reg [5:0] trans_state;
reg trans_en;
reg rst_out;

reg  		 rs232_tx_ld;
reg 		 rs232_tx_pending;
reg [7:0] rs232_tx_buffer;

reg [6:0] count_40ms;

reg strobe_a;
reg strobe_b;
reg rs232_tx_empty_a;
reg rs232_tx_empty_b;

// State parameterisation
parameter TRANS_WAIT = 				6'd0;
parameter TRANS_STAMP_FRAME =		6'd1;
parameter TRANS_STAMP =				6'd2;
parameter TRANS_P1_XDIF_FRAME = 	6'd3;
parameter TRANS_P1_XDIF = 			6'd4;
parameter TRANS_P1_YDIF_FRAME =	6'd5;
parameter TRANS_P1_YDIF = 			6'd6;
parameter TRANS_P1_SUM_FRAME =	6'd7;
parameter TRANS_P1_SUM = 			6'd8;
parameter TRANS_P2_XDIF_FRAME = 	6'd9;
parameter TRANS_P2_XDIF = 			6'd10;
parameter TRANS_P2_YDIF_FRAME =	6'd11;
parameter TRANS_P2_YDIF = 			6'd12;
parameter TRANS_P2_SUM_FRAME =	6'd13;
parameter TRANS_P2_SUM = 			6'd14;
parameter TRANS_P3_XDIF_FRAME = 	6'd15;
parameter TRANS_P3_XDIF = 			6'd16;
parameter TRANS_P3_YDIF_FRAME =	6'd17;
parameter TRANS_P3_YDIF = 			6'd18;
parameter TRANS_P3_SUM_FRAME =	6'd19;
parameter TRANS_P3_SUM = 			6'd20;
parameter TRANS_DAC_K1_FRAME =	6'd21;
parameter TRANS_DAC_K1 = 			6'd22;
parameter TRANS_DAC_K2_FRAME =	6'd23;
parameter TRANS_DAC_K2 = 			6'd24;
parameter TRANS_357_RB_FRAME = 	6'd25;
parameter TRANS_357_RB =			6'd26;
parameter TRANS_40_RB_FRAME = 	6'd27;
parameter TRANS_40_RB =				6'd28;
parameter TRANS_MON_RB_FRAME = 	6'd29;
parameter TRANS_MON_RB = 			6'd30;
parameter TRANS_TERM_BYTE = 		6'd31;

always @(posedge clk40 or posedge rst) begin
	if (rst) begin
		strobe_a <= 0;
		strobe_b <= 0;
		rs232_tx_empty_a <= 0;
		rs232_tx_empty_b <= 0;
		trans_state <= TRANS_WAIT;
		trans_en <= 0;
		//Propogate reset
		rst_out <= 1;
		trig_rdy <= 1'b1; //added by GBC 11/11/15 for use with BoardSynchroniser
	end else begin
		//Synchronise the uart empty signal
		rs232_tx_empty_a <= rs232_tx_empty;
		rs232_tx_empty_b <= rs232_tx_empty_a;
		//Synchronise the strobe
		strobe_a <= strobe;
		strobe_b <= strobe_a;
		//On falling edge of strobe, move to first transmission state
		if (~strobe_a && strobe_b) begin
			trans_state <= TRANS_STAMP_FRAME;
		end else begin
			//STATE MACHINE
			case (trans_state)
				TRANS_WAIT: begin
					//Reset internal registers
					rs232_tx_ld <= 0;
					rs232_tx_pending <= 0;
					//If neither channel is transmitting, ensure the daq_ram reset is low
					rst_out <= 0;
					trig_rdy <= trig_rdy; //added by GBC 11/11/15 for use with BoardSynchroniser
				end
				TRANS_STAMP_FRAME: begin
					//Transmit timestamp frame byte
					trig_rdy <= 1'b0; //added by GBC 11/11/15 for use with BoardSynchroniser
					if (!rs232_tx_ld && rs232_tx_empty_b) begin
						if (rs232_tx_pending) begin
							//Transmission complete
							rs232_tx_pending <= 0;
							//Move to next state
							trans_state <= TRANS_STAMP;
						end else begin
							//uart is empty.  Load byte to transmit
							rs232_tx_buffer <= 8'd31;
							rs232_tx_ld <= 1;
						end
					end else begin
						if (rs232_tx_ld && !rs232_tx_empty_b) begin
							//byte loaded to uart.  
							//rs232_tx_empty will stay low until transmission complete
							rs232_tx_ld <= 0;
							rs232_tx_pending <= 1;
						end
					end
				end
				TRANS_STAMP: begin
					trig_rdy <= trig_rdy; //added by GBC 11/11/15 for use with BoardSynchroniser
					//Transmit current timestamp as data
					if (!rs232_tx_ld && rs232_tx_empty_b) begin
						if (rs232_tx_pending) begin
							//Transmission complete
							rs232_tx_pending <= 0;
							//Move to next state
							trans_state <= TRANS_P1_XDIF_FRAME;
						end else begin
							//uart is empty.  Load timestamp byte to transmit
							rs232_tx_buffer <= {1'b1, count_40ms};
							rs232_tx_ld <= 1;
						end
					end else begin
						if (rs232_tx_ld && !rs232_tx_empty_b) begin
							//byte loaded to uart.  
							//rs232_tx_empty will stay low until transmission complete
							rs232_tx_ld <= 0;
							rs232_tx_pending <= 1;
						end
					end
				end					
				TRANS_P1_XDIF_FRAME: begin
					trig_rdy <= trig_rdy; //added by GBC 11/11/15 for use with BoardSynchroniser
					//Send P1 xdif frame byte directly to uart
					if (!rs232_tx_ld && rs232_tx_empty_b) begin
						if (rs232_tx_pending) begin
							//Transmission complete
							rs232_tx_pending <= 0;
							//Move to next state and enable DAQ_RAM transmission
							trans_en 	<= 1;
							trans_state <= TRANS_P1_XDIF;
						end else begin
							//uart is empty.  Load byte to transmit
							rs232_tx_buffer <= 8'd16;
							rs232_tx_ld <= 1;
						end
					end else begin
						if (rs232_tx_ld && !rs232_tx_empty_b) begin
							//byte loaded to uart.  
							//uart_tx_empty will stay low until transmission complete
							rs232_tx_ld <= 0;
							rs232_tx_pending <= 1;
						end
					end				
				end
				TRANS_P1_XDIF: begin
					trig_rdy <= trig_rdy; //added by GBC 11/11/15 for use with BoardSynchroniser
					//Transmit until done, then start next
					if (trans_en) begin
						if (trans_done) begin
							trans_en 	<= 0;
							trans_state <= TRANS_P1_YDIF_FRAME;
						end
					end 
				end
				TRANS_P1_YDIF_FRAME: begin
					trig_rdy <= trig_rdy; //added by GBC 11/11/15 for use with BoardSynchroniser
					//Send P1 ydif frame byte directly to uart
					if (!rs232_tx_ld && rs232_tx_empty_b) begin
						if (rs232_tx_pending) begin
							rs232_tx_pending <= 0;
							trans_en 	<= 1;
							trans_state <= TRANS_P1_YDIF;
						end else begin
							//uart is empty.  Load byte to transmit
							rs232_tx_buffer <= 8'd18;
							rs232_tx_ld <= 1;
						end
					end else begin
						if (rs232_tx_ld && !rs232_tx_empty_b) begin
							//byte loaded to uart.  
							//uart_tx_empty will stay low until transmission complete
							rs232_tx_ld <= 0;
							rs232_tx_pending <= 1;
						end
					end				
				end
				TRANS_P1_YDIF: begin
					trig_rdy <= trig_rdy; //added by GBC 11/11/15 for use with BoardSynchroniser
					//Transmit until done, then start next
					if (trans_en) begin
						if (trans_done) begin
							trans_en 	<= 0;
							trans_state <= TRANS_P1_SUM_FRAME;
						end
					end 
				end				
				TRANS_P1_SUM_FRAME: begin
					trig_rdy <= trig_rdy; //added by GBC 11/11/15 for use with BoardSynchroniser
					//Send P1 sum frame byte directly to uart
					if (!rs232_tx_ld && rs232_tx_empty_b) begin
						if (rs232_tx_pending) begin
							//Transmission complete
							rs232_tx_pending <= 0;
							//Move to next state and enable DAQ_RAM transmission
							trans_en 	<= 1;
							trans_state <= TRANS_P1_SUM;
						end else begin
							//uart is empty.  Load byte to transmit
							rs232_tx_buffer <= 8'd20;
							rs232_tx_ld <= 1;
						end
					end else begin
						if (rs232_tx_ld && !rs232_tx_empty_b) begin
							//byte loaded to uart.  
							//uart_tx_empty will stay low until transmission complete
							rs232_tx_ld <= 0;
							rs232_tx_pending <= 1;
						end
					end				
				end
				TRANS_P1_SUM: begin
					trig_rdy <= trig_rdy; //added by GBC 11/11/15 for use with BoardSynchroniser
					//Transmit until done, then move to default state
					if (trans_en) begin
						if (trans_done) begin
							trans_en 	<= 0;
							trans_state <= TRANS_P2_XDIF_FRAME;
						end
					end 
				end
				TRANS_P2_XDIF_FRAME: begin
					trig_rdy <= trig_rdy; //added by GBC 11/11/15 for use with BoardSynchroniser
					//Send P2 xdif frame byte directly to uart
					if (!rs232_tx_ld && rs232_tx_empty_b) begin
						if (rs232_tx_pending) begin
							//Transmission complete
							rs232_tx_pending <= 0;
							//Move to next state and enable DAQ_RAM transmission
							trans_en 	<= 1;
							trans_state <= TRANS_P2_XDIF;
						end else begin
							//uart is empty.  Load byte to transmit
							rs232_tx_buffer <= 8'd21;
							rs232_tx_ld <= 1;
						end
					end else begin
						if (rs232_tx_ld && !rs232_tx_empty_b) begin
							//byte loaded to uart.  
							//uart_tx_empty will stay low until transmission complete
							rs232_tx_ld <= 0;
							rs232_tx_pending <= 1;
						end
					end				
				end
				TRANS_P2_XDIF: begin
					trig_rdy <= trig_rdy; //added by GBC 11/11/15 for use with BoardSynchroniser
					//Transmit until done, then start next
					if (trans_en) begin
						if (trans_done) begin
							trans_en 	<= 0;
							trans_state <= TRANS_P2_YDIF_FRAME;
						end
					end 
				end
				TRANS_P2_YDIF_FRAME: begin
					trig_rdy <= trig_rdy; //added by GBC 11/11/15 for use with BoardSynchroniser
					//Send P2 ydif frame byte directly to uart
					if (!rs232_tx_ld && rs232_tx_empty_b) begin
						if (rs232_tx_pending) begin
							rs232_tx_pending <= 0;
							trans_en 	<= 1;
							trans_state <= TRANS_P2_YDIF;
						end else begin
							//uart is empty.  Load byte to transmit
							rs232_tx_buffer <= 8'd22;
							rs232_tx_ld <= 1;
						end
					end else begin
						if (rs232_tx_ld && !rs232_tx_empty_b) begin
							//byte loaded to uart.  
							//uart_tx_empty will stay low until transmission complete
							rs232_tx_ld <= 0;
							rs232_tx_pending <= 1;
						end
					end				
				end
				TRANS_P2_YDIF: begin
					trig_rdy <= trig_rdy; //added by GBC 11/11/15 for use with BoardSynchroniser
					//Transmit until done, then start next
					if (trans_en) begin
						if (trans_done) begin
							trans_en 	<= 0;
							trans_state <= TRANS_P2_SUM_FRAME;
						end
					end 
				end				
				TRANS_P2_SUM_FRAME: begin
					trig_rdy <= trig_rdy; //added by GBC 11/11/15 for use with BoardSynchroniser
					//Send P2 sum frame byte directly to uart
					if (!rs232_tx_ld && rs232_tx_empty_b) begin
						if (rs232_tx_pending) begin
							//Transmission complete
							rs232_tx_pending <= 0;
							//Move to next state and enable DAQ_RAM transmission
							trans_en 	<= 1;
							trans_state <= TRANS_P2_SUM;
						end else begin
							//uart is empty.  Load byte to transmit
							rs232_tx_buffer <= 8'd23;
							rs232_tx_ld <= 1;
						end
					end else begin
						if (rs232_tx_ld && !rs232_tx_empty_b) begin
							//byte loaded to uart.  
							//uart_tx_empty will stay low until transmission complete
							rs232_tx_ld <= 0;
							rs232_tx_pending <= 1;
						end
					end				
				end
				TRANS_P2_SUM: begin
					trig_rdy <= trig_rdy; //added by GBC 11/11/15 for use with BoardSynchroniser
					//Transmit until done, then move to default state
					if (trans_en) begin
						if (trans_done) begin
							trans_en 	<= 0;
							trans_state <= TRANS_P3_XDIF_FRAME;
						end
					end 
				end
				TRANS_P3_XDIF_FRAME: begin
					trig_rdy <= trig_rdy; //added by GBC 11/11/15 for use with BoardSynchroniser
					//Send P3 xdif frame byte directly to uart
					if (!rs232_tx_ld && rs232_tx_empty_b) begin
						if (rs232_tx_pending) begin
							//Transmission complete
							rs232_tx_pending <= 0;
							//Move to next state and enable DAQ_RAM transmission
							trans_en 	<= 1;
							trans_state <= TRANS_P3_XDIF;
						end else begin
							//uart is empty.  Load byte to transmit
							rs232_tx_buffer <= 8'd24;
							rs232_tx_ld <= 1;
						end
					end else begin
						if (rs232_tx_ld && !rs232_tx_empty_b) begin
							//byte loaded to uart.  
							//uart_tx_empty will stay low until transmission complete
							rs232_tx_ld <= 0;
							rs232_tx_pending <= 1;
						end
					end				
				end
				TRANS_P3_XDIF: begin
					trig_rdy <= trig_rdy; //added by GBC 11/11/15 for use with BoardSynchroniser
					//Transmit until done, then start next
					if (trans_en) begin
						if (trans_done) begin
							trans_en 	<= 0;
							trans_state <= TRANS_P3_YDIF_FRAME;
						end
					end 
				end
				TRANS_P3_YDIF_FRAME: begin
					trig_rdy <= trig_rdy; //added by GBC 11/11/15 for use with BoardSynchroniser
					//Send P3 ydif frame byte directly to uart
					if (!rs232_tx_ld && rs232_tx_empty_b) begin
						if (rs232_tx_pending) begin
							rs232_tx_pending <= 0;
							trans_en 	<= 1;
							trans_state <= TRANS_P3_YDIF;
						end else begin
							//uart is empty.  Load byte to transmit
							rs232_tx_buffer <= 8'd25;
							rs232_tx_ld <= 1;
						end
					end else begin
						if (rs232_tx_ld && !rs232_tx_empty_b) begin
							//byte loaded to uart.  
							//uart_tx_empty will stay low until transmission complete
							rs232_tx_ld <= 0;
							rs232_tx_pending <= 1;
						end
					end				
				end
				TRANS_P3_YDIF: begin
					trig_rdy <= trig_rdy; //added by GBC 11/11/15 for use with BoardSynchroniser
					//Transmit until done, then start next
					if (trans_en) begin
						if (trans_done) begin
							trans_en 	<= 0;
							trans_state <= TRANS_P3_SUM_FRAME;
						end
					end 
				end				
				TRANS_P3_SUM_FRAME: begin
					trig_rdy <= trig_rdy; //added by GBC 11/11/15 for use with BoardSynchroniser
					//Send P3 sum frame byte directly to uart
					if (!rs232_tx_ld && rs232_tx_empty_b) begin
						if (rs232_tx_pending) begin
							//Transmission complete
							rs232_tx_pending <= 0;
							//Move to next state and enable DAQ_RAM transmission
							trans_en 	<= 1;
							trans_state <= TRANS_P3_SUM;
						end else begin
							//uart is empty.  Load byte to transmit
							rs232_tx_buffer <= 8'd26;
							rs232_tx_ld <= 1;
						end
					end else begin
						if (rs232_tx_ld && !rs232_tx_empty_b) begin
							//byte loaded to uart.  
							//uart_tx_empty will stay low until transmission complete
							rs232_tx_ld <= 0;
							rs232_tx_pending <= 1;
						end
					end				
				end
				TRANS_P3_SUM: begin
					trig_rdy <= trig_rdy; //added by GBC 11/11/15 for use with BoardSynchroniser
					//Transmit until done, and move to next state
					if (trans_en) begin
						if (trans_done) begin
							trans_en 	<= 0;
							trans_state <= TRANS_DAC_K1_FRAME;
						end
					end 
				end								
				TRANS_DAC_K1_FRAME: begin
					trig_rdy <= trig_rdy; //added by GBC 11/11/15 for use with BoardSynchroniser
					if (!rs232_tx_ld && rs232_tx_empty_b) begin
						if (rs232_tx_pending) begin
							//Transmission complete
							rs232_tx_pending <= 0;
							//Move to next state and enable DAQ_RAM transmission
							trans_en 	<= 1;
							trans_state <= TRANS_DAC_K1;
						end else begin
							//uart is empty.  Load byte to transmit
							rs232_tx_buffer <= 8'd29;
							rs232_tx_ld <= 1;
						end
					end else begin
						if (rs232_tx_ld && !rs232_tx_empty_b) begin
							//byte loaded to uart.  
							//uart_tx_empty will stay low until transmission complete
							rs232_tx_ld <= 0;
							rs232_tx_pending <= 1;
						end
					end				
				end
				TRANS_DAC_K1: begin
					trig_rdy <= trig_rdy; //added by GBC 11/11/15 for use with BoardSynchroniser
					//Transmit until done, and move to next state
					if (trans_en) begin
						if (trans_done) begin
							trans_en 	<= 0;
							trans_state <= TRANS_DAC_K2_FRAME;
						end
					end 
				end												
				TRANS_DAC_K2_FRAME: begin
					trig_rdy <= trig_rdy; //added by GBC 11/11/15 for use with BoardSynchroniser
					if (!rs232_tx_ld && rs232_tx_empty_b) begin
						if (rs232_tx_pending) begin
							//Transmission complete
							rs232_tx_pending <= 0;
							//Move to next state and enable DAQ_RAM transmission
							trans_en 	<= 1;
							trans_state <= TRANS_DAC_K2;
						end else begin
							//uart is empty.  Load byte to transmit
							rs232_tx_buffer <= 8'd30;
							rs232_tx_ld <= 1;
						end
					end else begin
						if (rs232_tx_ld && !rs232_tx_empty_b) begin
							//byte loaded to uart.  
							//uart_tx_empty will stay low until transmission complete
							rs232_tx_ld <= 0;
							rs232_tx_pending <= 1;
						end
					end				
				end
				TRANS_DAC_K2: begin
					trig_rdy <= trig_rdy; //added by GBC 11/11/15 for use with BoardSynchroniser
					//Transmit until done, and move to next state
					if (trans_en) begin
						if (trans_done) begin
							trans_en 	<= 0;
							trans_state <= TRANS_357_RB_FRAME;
						end
					end 
				end						
				TRANS_357_RB_FRAME: begin
					trig_rdy <= trig_rdy; //added by GBC 11/11/15 for use with BoardSynchroniser
					//Send 357MHz readback frame byte directly to uart
					if (!rs232_tx_ld && rs232_tx_empty_b) begin
						if (rs232_tx_pending) begin
							//Transmission complete
							rs232_tx_pending <= 0;
							//Move to next state and enable control reg transmission
							trans_en 	<= 1;
							trans_state <= TRANS_357_RB;
						end else begin
							//uart is empty.  Load byte to transmit
							rs232_tx_buffer <= 8'd27;
							rs232_tx_ld <= 1;
						end
					end else begin
						if (rs232_tx_ld && !rs232_tx_empty_b) begin
							//byte loaded to uart.  
							//uart_tx_empty will stay low until transmission complete
							rs232_tx_ld <= 0;
							rs232_tx_pending <= 1;
						end
					end				
				end
				TRANS_357_RB: begin
					trig_rdy <= trig_rdy; //added by GBC 11/11/15 for use with BoardSynchroniser
					//Transmit until done, then move to next state
					if (trans_en) begin
						if (trans_done) begin
							trans_en 	<= 0;
							trans_state <= TRANS_40_RB_FRAME;
						end
					end 
				end				
				TRANS_40_RB_FRAME: begin
					trig_rdy <= trig_rdy; //added by GBC 11/11/15 for use with BoardSynchroniser
					//Send 40MHz readback frame byte directly to uart
					if (!rs232_tx_ld && rs232_tx_empty_b) begin
						if (rs232_tx_pending) begin
							//Transmission complete
							rs232_tx_pending <= 0;
							//Move to next state and enable control reg transmission
							trans_en 	<= 1;
							trans_state <= TRANS_40_RB;
						end else begin
							//uart is empty.  Load byte to transmit
							rs232_tx_buffer <= 8'd28;
							rs232_tx_ld <= 1;
						end
					end else begin
						if (rs232_tx_ld && !rs232_tx_empty_b) begin
							//byte loaded to uart.  
							//uart_tx_empty will stay low until transmission complete
							rs232_tx_ld <= 0;
							rs232_tx_pending <= 1;
						end
					end				
				end
				TRANS_40_RB: begin
					trig_rdy <= trig_rdy; //added by GBC 11/11/15 for use with BoardSynchroniser
					//Transmit until done, then send reset and move to default state
					if (trans_en) begin
						if (trans_done) begin
							trans_en 	<= 0;
							trans_state <= TRANS_MON_RB_FRAME;
						end
					end 
				end	
				TRANS_MON_RB_FRAME: begin
					trig_rdy <= trig_rdy; //added by GBC 11/11/15 for use with BoardSynchroniser
					//Send monitor readback frame byte directly to uart
					if (!rs232_tx_ld && rs232_tx_empty_b) begin
						if (rs232_tx_pending) begin
							//Transmission complete
							rs232_tx_pending <= 0;
							//Move to next state and enable control reg transmission
							trans_en 	<= 1;
							trans_state <= TRANS_MON_RB;
						end else begin
							//uart is empty.  Load byte to transmit
							rs232_tx_buffer <= 8'd15;
							rs232_tx_ld <= 1;
						end
					end else begin
						if (rs232_tx_ld && !rs232_tx_empty_b) begin
							//byte loaded to uart.  
							//uart_tx_empty will stay low until transmission complete
							rs232_tx_ld <= 0;
							rs232_tx_pending <= 1;
						end
					end				
				end
				TRANS_MON_RB: begin
					trig_rdy <= trig_rdy; //added by GBC 11/11/15 for use with BoardSynchroniser
					//Transmit until done, then send reset and move to default state
					if (trans_en) begin
						if (trans_done) begin
							trans_en 	<= 0;
							//rst_out 		<= 1;
							//trans_state <= TRANS_WAIT;
							trans_state <= TRANS_TERM_BYTE;
						end
					end 
				end	
				TRANS_TERM_BYTE: begin
				//Send monitor readback frame byte directly to uart
					if (!rs232_tx_ld && rs232_tx_empty_b) begin
						if (rs232_tx_pending) begin
							//Transmission complete
							rs232_tx_pending <= 0;
							//Move to next state and enable control reg transmission
							trans_en 	<= 0;
							rst_out		<= 1;
							trans_state <= TRANS_WAIT;
							trig_rdy <= 1'b1; //added by GBC 11/11/15 for use with BoardSynchroniser
						end else begin
							//uart is empty.  Load byte to transmit
							rs232_tx_buffer <= 8'd14;
							rs232_tx_ld <= 1;
							trig_rdy <= trig_rdy; //added by GBC 11/11/15 for use with BoardSynchroniser
						end
					end else begin
						if (rs232_tx_ld && !rs232_tx_empty_b) begin
							//byte loaded to uart.  
							//uart_tx_empty will stay low until transmission complete
							rs232_tx_ld <= 0;
							rs232_tx_pending <= 1;
							trig_rdy <= trig_rdy; //added by GBC 11/11/15 for use with BoardSynchroniser
						end
					end				
				end
			endcase
		end
	end
end

// Implement the 40ms 7-bit counter
reg [20:0]	cycle_count;
always @(posedge clk40) begin
	if (cycle_count == 21'd1600000) begin
		cycle_count <= 0;
		count_40ms <= count_40ms + 1;
	end else begin
		cycle_count <= cycle_count + 1;
	end
end

endmodule



// *****************  monitor_readback ******************************************
//
// Accepts several readback inputs (7-bits), which are clocked into registers
// on the 40MHz
//
// It contains transmission logic identical to the DAQ_RAM, and is triggered
// last in the DAQ cycle to transmit its register contents as data
//

module monitor_readback(
	clk,
	rst,
	tx_en,
	tx_clk,
	tx_data_ready,
	tx_data,
	tx_data_loaded,
	tx_complete,
	rb0,
	rb1,
	rb2,
	rb3,
	rb4,
	rb5,
	rb6,
	rb7,
	rb8,
	rb9,
	rb10,
	rb11,
	rb12
	//rb12,
	//rb13
);

//parameter N_READBACKS = 14;
parameter N_READBACKS = 13;


// Ports
input					clk;
input					rst;
input					tx_en;
input					tx_clk;
input					tx_data_loaded;
output				tx_data_ready;
output				tx_data;
output				tx_complete;
input	  [6:0]		rb0;
input	  [6:0]		rb1;
input	  [6:0]		rb2;
input	  [6:0]		rb3;
input	  [6:0]		rb4;
input	  [6:0]		rb5;
input	  [6:0]		rb6;
input	  [6:0]		rb7;
input	  [6:0]		rb8;
input	  [6:0]		rb9;
input	  [6:0]		rb10;
input	  [6:0]		rb11;
input	  [6:0]		rb12;
//input	  [6:0]		rb13;

// Registers
reg [6:0] readbacks_a [0:N_READBACKS-1];
reg [6:0] readbacks_b [0:N_READBACKS-1];

// For for loop
integer i;

always @(posedge clk or posedge rst) begin
	if (rst) begin
		for (i=0; i < N_READBACKS; i=i+1) begin
			readbacks_a[i] <= 0;
			readbacks_b[i] <= 0;
		end
	end else begin
		// Synchronise readbacks
		readbacks_a[0]		<=	rb0;
		readbacks_a[1]		<=	rb1;
		readbacks_a[2]		<=	rb2;
		readbacks_a[3]		<=	rb3;
		readbacks_a[4]		<=	rb4;
		readbacks_a[5]		<=	rb5;
		readbacks_a[6]		<=	rb6;
		readbacks_a[7]		<=	rb7;
		readbacks_a[8]		<=	rb8;
		readbacks_a[9]		<=	rb9;
		readbacks_a[10]	<=	rb10;
		readbacks_a[11]	<=	rb11;
		readbacks_a[12]	<=	rb12;
		//readbacks_a[13]	<=	rb13;
		for (i=0; i < N_READBACKS; i=i+1) begin
			readbacks_b[i] <= readbacks_a[i];
		end
	end
end

// Readback logic.  This works as the DAQ RAM readback.  Each readback is
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
					if (tx_cnt == N_READBACKS) begin
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
always @(posedge tx_clk) tx_data <= {1'b1, readbacks_b[tx_cnt]};

endmodule


//
//// *****************  dac_readback ******************************************
////
//// The dac output is loaded into a register array.  Each dac clock is used 
//// as a strobe to load the values at 357MHz.  The clocks are 5.6ns pulses,
//// so there will be 2 values clocked in per clock (i.e 6 per pulse, though each pair 
//// of values should be identical)
////
//// It contains transmission logic identical to the DAQ_RAM, and is triggered
//// last in the DAQ cycle to transmit its register contents as data
//
//module dac_readback(
//	reset,
//	tx_en,
//	tx_clk,
//	tx_data_ready,
//	tx_data,
//	tx_data_loaded,
//	tx_complete,
//	wr_clk,
//	wr_en,
//	wr_data
//);
//
//// Parameters
//parameter ARRAY_SIZE = 6;
//
//
//// Ports
//input				reset;
//input				tx_en;
//input				tx_clk;
//input				tx_data_loaded;
//output			tx_data_ready;
//output [7:0]	tx_data;
//output			tx_complete;
//input 			wr_clk;
//input 			wr_en;
//input  [13:0] 	wr_data;
//
//// Internal registers
//reg [10:0]  tx_cnt;
//reg			tx_data_ready;
//reg			tx_data_loaded1;
//reg			tx_data_loaded2;
//reg 			tx_complete;
//reg [7:0]	tx_data;
//reg [9:0]	wr_addr;
//
////Declare register array
//
