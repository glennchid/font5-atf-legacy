`timescale 1ns / 1ps


// UART wants the LSB first

// RX modified to accept 40 MHz clock and receive at 115200 bps
// Note 40e6 / 115200 = 347.2222 and 347.2 / 2 = 173.6  ~= 174 cycles

// For 460800
// 40e6 / 460800 = 86.8 and 86.8 / 2 =~= 43

// For 230400
// 40e6 / 230400 = 173.6 and 173.6/2 = 86.8

// Modified for 460800 baud rate

module uart2_rx #(parameter WIDTH = 8, parameter real BAUD = 9600) (	
	input reset,
	input clk,
	input uld_rx_data,
	output reg [WIDTH-1:0] rx_data = {WIDTH{1'b0}},
	input rx_enable,
	input rx_in,
	output reg byte_rdy = 1'b0
);

//parameter ML505 = 0; //default to 0 if not specified
//parameter BAUD = 9600; // default to 9600 Baud

//Variable/custom Baud rate little-endian 8N1 UART-RX 

`ifdef ML505 localparam real CLK_FREQ = 100e6;
`else localparam real CLK_FREQ = 40e6;
`endif

localparam BAUD_CNT_SIZE = bits_to_fit(CLK_FREQ/BAUD);
localparam BIT_CNT_SIZE = bits_to_fit(WIDTH+2);

localparam [BAUD_CNT_SIZE-1:0] FRAME_WIDTH = CLK_FREQ/BAUD;
localparam [BAUD_CNT_SIZE-1:0] FRAME_MIDPOINT = FRAME_WIDTH/2;


// Internal registers
reg [WIDTH-1:0]    rx_reg = {WIDTH{1'b0}};
reg [BAUD_CNT_SIZE-1:0]    rx_sample_cnt = {BAUD_CNT_SIZE{1'b0}};
reg [BIT_CNT_SIZE-1:0]    rx_cnt = {BIT_CNT_SIZE{1'b0}};  
(* ASYNC_REG = "true" *) reg          rx_da = 1'b1, rx_db = 1'b1;
reg          rx_busy = 1'b0;

// UART RX Logic
always @ (posedge clk) begin
	if (reset) begin
		rx_reg        <= {WIDTH{1'b0}}; 
		rx_data       <= {WIDTH{1'b0}};
		rx_sample_cnt <= {BAUD_CNT_SIZE{1'b0}};
		rx_cnt        <= {BIT_CNT_SIZE{1'b0}};
		byte_rdy		  <= 1'b0;
		rx_da        <= 1'b1;
		rx_db         <= 1'b1;
		rx_busy       <= 1'b0;
	end else begin // if (~reset)
		if (rx_enable) begin // Receive data only when rx is enabled
			// Synchronize the asynch signal
			rx_da <= rx_in;
			rx_db <= rx_da;
			
			rx_data <= (uld_rx_data) ? rx_reg : rx_data;
			/*if (uld_uart_data) begin // drive ouputs first
				byte_rdy <= 1'b0;
				//else byte_rdy <= byte_recd;
				//byte_rdy <= (uld_uart_data) ? 
				
			end else if (rx_busy) begin //drive logic, counters etc*/
			
			if (rx_busy) begin //drive logic, counters etc
				if (rx_sample_cnt == FRAME_WIDTH) begin 
					rx_sample_cnt <= {BAUD_CNT_SIZE{1'b0}};
					rx_cnt <= rx_cnt + 1;
					case (rx_cnt)
						{BIT_CNT_SIZE{1'b0}}: begin
							rx_busy <= ~rx_db;
							byte_rdy <= (uld_rx_data) ? 1'b0 : byte_rdy;
							end
						WIDTH+1: begin
							rx_busy <= 1'b0;
							byte_rdy <= rx_db;
							end
						default: begin
							rx_reg[rx_cnt - 1'b1] <= rx_db;
							byte_rdy <= (uld_rx_data) ? 1'b0 : byte_rdy;
							end
					endcase
				end else begin
					rx_sample_cnt <= rx_sample_cnt + 1'b1;
					byte_rdy <= (uld_rx_data) ? 1'b0 : byte_rdy;
				end
			end else begin //if (~rx_busy)
				rx_busy <= ~rx_db;
				rx_sample_cnt <= FRAME_MIDPOINT;
				rx_cnt        <= 1'b0;	 
				byte_rdy <= (uld_rx_data) ? 1'b0 : byte_rdy;
				//rx_reg <= 8'd0;
			end // if (~rx_busy)
		end else begin // if (~rx_enable)
			rx_reg        <= {WIDTH{1'b0}}; 
			rx_data       <= {WIDTH{1'b0}};
			rx_sample_cnt <= {BAUD_CNT_SIZE{1'b0}};
			rx_cnt        <= {BIT_CNT_SIZE{1'b0}};
			byte_rdy		  <= 1'b0;
			rx_da         <= 1'b1;
			rx_db         <= 1'b1;
			rx_busy       <= 1'b0;	
		end	// if (~rx_enable)	
	end //if (~reset)		
end //always
		
function integer clog2;
input integer value;
begin
	value = value-1;
	for (clog2=0; value>0;clog2=clog2+1)
		value = value>>1;
end
endfunction

function integer bits_to_fit;
  input [31:0] value;
  for (bits_to_fit=0; value>0; bits_to_fit=bits_to_fit+1)
    value = value >> 1;
endfunction
		
endmodule
