`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:46:53 01/13/2015 
// Design Name: 
// Module Name:    auxOut_select 
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
module auxOut_select(
    input clk,
    input FONT5_detect,
	 input auxOutA,
	 input auxOutB,
    (* IOB = "TRUE" *) output reg auxOutA1,
    (* IOB = "TRUE" *) output reg auxOutB1,
    (* IOB = "TRUE" *) output reg auxOutA2,
    (* IOB = "TRUE" *) output reg auxOutB2
    );
	 
(* IOB = "TRUE" *) reg FONT5_detect_a;
reg FONT5_detect_b;
 
always @(posedge clk) begin
	FONT5_detect_a <= FONT5_detect;
	FONT5_detect_b <= FONT5_detect_a;
	auxOutA1 <= (FONT5_detect_b) ? auxOutA : 1'bz;
	auxOutB1 <= (FONT5_detect_b) ? auxOutB : 1'bz;
	auxOutA2 <= (FONT5_detect_b) ? 1'bz : ~auxOutA; // NB: auxOuts on FONT5A boards use inverting buffers
	auxOutB2 <= (FONT5_detect_b) ? 1'bz : ~auxOutB; // NB: auxOuts on FONT5A boards use inverting buffers
end

endmodule
