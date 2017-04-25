`timescale 1ns / 1ps
//`define TWO_BYTE_DECODE
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:54:33 12/16/2015 
// Design Name: 
// Module Name:    uart_unload.v 
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
module uart_unload2 #(parameter BYTE_WIDTH = 8, WORD_WIDTH = 13) (
    input rst,
    input clk,
    input byte_rdy,
	 `ifdef TWO_BYTE_DECODE
		input [BYTE_WIDTH-1:0] din,
		output reg signed [WORD_WIDTH-1:0] d1out,
		output reg signed [WORD_WIDTH-1:0] d2out,
		//output reg kicker_addr,
		//output decode_err;
	 `endif
    output reg unload_uart
    );

reg byte_rdy_b = 1'b0;
`ifdef TWO_BYTE_DECODE
	reg [BYTE_WIDTH-2:0] data_tmp = {BYTE_WIDTH-1{1'b0}};
`endif

always @(posedge clk) begin
	if (rst) begin
		unload_uart <= 1'b0;
		byte_rdy_b <= 1'b0;
		`ifdef TWO_BYTE_DECODE
			data_tmp <= {BYTE_WIDTH-1{1'b0}};
			d1out <= {WORD_WIDTH{1'b0}};
			d2out <= {WORD_WIDTH{1'b0}};
			//decode_err <= 1'b0;
		`endif
	end else begin
		byte_rdy_b <= byte_rdy;
		unload_uart <= (byte_rdy & ~byte_rdy_b) ? 1'b1 : 1'b0;
		`ifdef TWO_BYTE_DECODE
			if(din[BYTE_WIDTH-1]) begin
				d1out <= (din[BYTE_WIDTH-2]) ? d1out : {din[BYTE_WIDTH-3:0], data_tmp};
				d2out <= (din[BYTE_WIDTH-2]) ? {din[BYTE_WIDTH-3:0], data_tmp} : d2out;
			end else data_tmp <= din[BYTE_WIDTH-2:0];
			//kicker_addr <= (din[BYTE_WIDTH-1]) ? din[BYTE_WIDTH-2] : kicker_addr;
			//decode_err <= (din[BYTE_WIDTH-1]) ? (din[BYTE_WIDTH-2] == din[BYTE_WIDTH-3]) ? decode_err;
		`endif
	end
end
endmodule
