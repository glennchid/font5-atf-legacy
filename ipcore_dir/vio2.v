///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2017 Xilinx, Inc.
// All Rights Reserved
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor     : Xilinx
// \   \   \/     Version    : 14.7
//  \   \         Application: Xilinx CORE Generator
//  /   /         Filename   : vio2.v
// /___/   /\     Timestamp  : Tue Apr 25 16:03:55 GMT Daylight Time 2017
// \   \  /  \
//  \___\/\___\
//
// Design Name: Verilog Synthesis Wrapper
///////////////////////////////////////////////////////////////////////////////
// This wrapper is used to integrate with Project Navigator and PlanAhead

`timescale 1ns/1ps

module vio2(
    CONTROL,
    CLK,
    SYNC_IN,
    SYNC_OUT) /* synthesis syn_black_box syn_noprune=1 */;


inout [35 : 0] CONTROL;
input CLK;
input [25 : 0] SYNC_IN;
output [7 : 0] SYNC_OUT;

endmodule
