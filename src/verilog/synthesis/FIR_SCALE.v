////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: K.39
//  \   \         Application: netgen
//  /   /         Filename: FIR_SCALE.v
// /___/   /\     Timestamp: Wed Mar 24 14:52:18 2010
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -w -sim -ofmt verilog C:\XilinxProjects\FONT5_9Chan\tmp\_cg\FIR_SCALE.ngc C:\XilinxProjects\FONT5_9Chan\tmp\_cg\FIR_SCALE.v 
// Device	: 5vlx50tff1136-3
// Input file	: C:/XilinxProjects/FONT5_9Chan/tmp/_cg/FIR_SCALE.ngc
// Output file	: C:/XilinxProjects/FONT5_9Chan/tmp/_cg/FIR_SCALE.v
// # of Modules	: 1
// Design Name	: FIR_SCALE
// Xilinx        : C:\Xilinx\10.1\ISE
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Development System Reference Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module FIR_SCALE (
  clk, a, b, p
);
  input clk;
  input [41 : 0] a;
  input [6 : 0] b;
  output [48 : 0] p;
  
  // synthesis translate_off
  
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/bdel_temp<0><0>[0] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/bdel_temp<0><0>[1] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/bdel_temp<0><0>[2] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/bdel_temp<0><0>[3] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/bdel_temp<0><0>[4] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/bdel_temp<0><0>[5] ;
  wire \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/bdel_temp<0><0>[10] ;
  wire \BU2/N1 ;
  wire NLW_VCC_P_UNCONNECTED;
  wire NLW_GND_G_UNCONNECTED;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_PATTERNBDETECT_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_PATTERNDETECT_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_OVERFLOW_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_UNDERFLOW_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_CARRYCASCOUT_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_MULTSIGNOUT_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_P<47>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_P<46>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_P<45>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_P<44>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_P<43>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_P<42>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_P<41>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_P<40>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_P<39>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_P<38>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_P<37>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_P<36>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_P<35>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_P<34>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_P<33>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_P<32>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_P<31>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_P<30>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_P<29>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_P<28>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_P<27>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_P<26>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_P<25>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_P<24>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_P<23>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_P<22>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_P<21>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_P<20>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_P<19>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_P<18>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_P<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_ACOUT<29>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_ACOUT<28>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_ACOUT<27>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_ACOUT<26>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_ACOUT<25>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_ACOUT<24>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_ACOUT<23>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_ACOUT<22>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_ACOUT<21>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_ACOUT<20>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_ACOUT<19>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_ACOUT<18>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_ACOUT<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_ACOUT<16>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_ACOUT<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_ACOUT<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_ACOUT<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_ACOUT<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_ACOUT<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_ACOUT<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_ACOUT<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_ACOUT<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_ACOUT<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_ACOUT<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_ACOUT<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_ACOUT<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_ACOUT<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_ACOUT<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_ACOUT<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_ACOUT<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_CARRYOUT<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_CARRYOUT<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_CARRYOUT<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_CARRYOUT<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_PATTERNBDETECT_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_PATTERNDETECT_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_OVERFLOW_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_UNDERFLOW_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_CARRYCASCOUT_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_MULTSIGNOUT_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_P<47>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_P<46>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_P<45>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_P<44>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_P<43>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_BCOUT<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_BCOUT<16>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_BCOUT<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_BCOUT<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_BCOUT<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_BCOUT<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_BCOUT<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_BCOUT<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_BCOUT<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_BCOUT<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_BCOUT<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_BCOUT<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_BCOUT<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_BCOUT<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_BCOUT<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_BCOUT<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_BCOUT<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_BCOUT<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_ACOUT<29>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_ACOUT<28>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_ACOUT<27>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_ACOUT<26>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_ACOUT<25>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_ACOUT<24>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_ACOUT<23>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_ACOUT<22>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_ACOUT<21>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_ACOUT<20>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_ACOUT<19>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_ACOUT<18>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_ACOUT<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_ACOUT<16>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_ACOUT<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_ACOUT<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_ACOUT<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_ACOUT<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_ACOUT<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_ACOUT<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_ACOUT<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_ACOUT<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_ACOUT<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_ACOUT<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_ACOUT<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_ACOUT<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_ACOUT<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_ACOUT<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_ACOUT<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_ACOUT<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_CARRYOUT<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_CARRYOUT<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_CARRYOUT<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_CARRYOUT<0>_UNCONNECTED ;
  wire [16 : 0] p_2;
  wire [16 : 0] \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<0><0> ;
  wire [17 : 0] \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> ;
  wire [42 : 0] \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<1><0> ;
  wire [17 : 0] \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/bcout<0><0> ;
  wire [47 : 0] \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> ;
  wire [24 : 0] \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp0<1><0> ;
  wire [47 : 0] \BU2/pcasc ;
  assign
    \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp0<1><0> [24] = a[41],
    \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp0<1><0> [23] = a[40],
    \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp0<1><0> [22] = a[39],
    \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp0<1><0> [21] = a[38],
    \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp0<1><0> [20] = a[37],
    \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp0<1><0> [19] = a[36],
    \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp0<1><0> [18] = a[35],
    \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp0<1><0> [17] = a[34],
    \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp0<1><0> [16] = a[33],
    \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp0<1><0> [15] = a[32],
    \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp0<1><0> [14] = a[31],
    \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp0<1><0> [13] = a[30],
    \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp0<1><0> [12] = a[29],
    \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp0<1><0> [11] = a[28],
    \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp0<1><0> [10] = a[27],
    \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp0<1><0> [9] = a[26],
    \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp0<1><0> [8] = a[25],
    \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp0<1><0> [7] = a[24],
    \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp0<1><0> [6] = a[23],
    \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp0<1><0> [5] = a[22],
    \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp0<1><0> [4] = a[21],
    \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp0<1><0> [3] = a[20],
    \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp0<1><0> [2] = a[19],
    \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp0<1><0> [1] = a[18],
    \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp0<1><0> [0] = a[17],
    \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [16] = a[16],
    \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [15] = a[15],
    \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [14] = a[14],
    \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [13] = a[13],
    \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [12] = a[12],
    \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [11] = a[11],
    \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [10] = a[10],
    \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [9] = a[9],
    \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [8] = a[8],
    \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [7] = a[7],
    \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [6] = a[6],
    \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [5] = a[5],
    \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [4] = a[4],
    \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [3] = a[3],
    \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [2] = a[2],
    \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [1] = a[1],
    \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [0] = a[0],
    \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/bdel_temp<0><0>[10]  = b[6],
    \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/bdel_temp<0><0>[5]  = b[5],
    \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/bdel_temp<0><0>[4]  = b[4],
    \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/bdel_temp<0><0>[3]  = b[3],
    \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/bdel_temp<0><0>[2]  = b[2],
    \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/bdel_temp<0><0>[1]  = b[1],
    \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/bdel_temp<0><0>[0]  = b[0],
    p[48] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<1><0> [31],
    p[47] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<1><0> [30],
    p[46] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<1><0> [29],
    p[45] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<1><0> [28],
    p[44] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<1><0> [27],
    p[43] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<1><0> [26],
    p[42] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<1><0> [25],
    p[41] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<1><0> [24],
    p[40] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<1><0> [23],
    p[39] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<1><0> [22],
    p[38] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<1><0> [21],
    p[37] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<1><0> [20],
    p[36] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<1><0> [19],
    p[35] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<1><0> [18],
    p[34] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<1><0> [17],
    p[33] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<1><0> [16],
    p[32] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<1><0> [15],
    p[31] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<1><0> [14],
    p[30] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<1><0> [13],
    p[29] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<1><0> [12],
    p[28] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<1><0> [11],
    p[27] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<1><0> [10],
    p[26] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<1><0> [9],
    p[25] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<1><0> [8],
    p[24] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<1><0> [7],
    p[23] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<1><0> [6],
    p[22] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<1><0> [5],
    p[21] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<1><0> [4],
    p[20] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<1><0> [3],
    p[19] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<1><0> [2],
    p[18] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<1><0> [1],
    p[17] = \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<1><0> [0],
    p[16] = p_2[16],
    p[15] = p_2[15],
    p[14] = p_2[14],
    p[13] = p_2[13],
    p[12] = p_2[12],
    p[11] = p_2[11],
    p[10] = p_2[10],
    p[9] = p_2[9],
    p[8] = p_2[8],
    p[7] = p_2[7],
    p[6] = p_2[6],
    p[5] = p_2[5],
    p[4] = p_2[4],
    p[3] = p_2[3],
    p[2] = p_2[2],
    p[1] = p_2[1],
    p[0] = p_2[0];
  VCC   VCC_0 (
    .P(NLW_VCC_P_UNCONNECTED)
  );
  GND   GND_1 (
    .G(NLW_GND_G_UNCONNECTED)
  );
  DSP48E #(
    .ACASCREG ( 1 ),
    .ALUMODEREG ( 0 ),
    .AREG ( 1 ),
    .AUTORESET_PATTERN_DETECT ( "FALSE" ),
    .AUTORESET_PATTERN_DETECT_OPTINV ( "MATCH" ),
    .A_INPUT ( "DIRECT" ),
    .BCASCREG ( 1 ),
    .BREG ( 1 ),
    .B_INPUT ( "DIRECT" ),
    .CARRYINREG ( 0 ),
    .CARRYINSELREG ( 0 ),
    .CREG ( 0 ),
    .PATTERN ( 48'h000000000000 ),
    .MREG ( 1 ),
    .MULTCARRYINREG ( 0 ),
    .OPMODEREG ( 0 ),
    .PREG ( 1 ),
    .SEL_MASK ( "MASK" ),
    .SEL_PATTERN ( "PATTERN" ),
    .SEL_ROUNDING_MASK ( "SEL_MASK" ),
    .SIM_MODE ( "SAFE" ),
    .USE_MULT ( "MULT_S" ),
    .USE_PATTERN_DETECT ( "NO_PATDET" ),
    .USE_SIMD ( "ONE48" ),
    .MASK ( 48'h000000000000 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E  (
    .CARRYIN(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17]),
    .CEA1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17]),
    .CEA2(\BU2/N1 ),
    .CEB1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17]),
    .CEB2(\BU2/N1 ),
    .CEC(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17]),
    .CECTRL(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17]),
    .CEP(\BU2/N1 ),
    .CEM(\BU2/N1 ),
    .CECARRYIN(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17]),
    .CEMULTCARRYIN(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17]),
    .CLK(clk),
    .RSTA(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17]),
    .RSTB(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17]),
    .RSTC(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17]),
    .RSTCTRL(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17]),
    .RSTP(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17]),
    .RSTM(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17]),
    .RSTALLCARRYIN(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17]),
    .CEALUMODE(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17]),
    .RSTALUMODE(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17]),
    .PATTERNBDETECT
(\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_PATTERNBDETECT_UNCONNECTED ),
    .PATTERNDETECT
(\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_PATTERNDETECT_UNCONNECTED ),
    .OVERFLOW
(\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_OVERFLOW_UNCONNECTED ),
    .UNDERFLOW
(\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_UNDERFLOW_UNCONNECTED ),
    .CARRYCASCIN(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17]),
    .CARRYCASCOUT
(\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_CARRYCASCOUT_UNCONNECTED ),
    .MULTSIGNIN(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17]),
    .MULTSIGNOUT
(\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_MULTSIGNOUT_UNCONNECTED ),
    .A({\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [16], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [15], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [14], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [13], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [12], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [11], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [10], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [9], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [8], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [7], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [6], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [5], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [4], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [3], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [2], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [1], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [0]}),
    .PCIN({\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17]}),
    .B({\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/bdel_temp<0><0>[10] , 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/bdel_temp<0><0>[10] , 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/bdel_temp<0><0>[10] , 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/bdel_temp<0><0>[10] , 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/bdel_temp<0><0>[10] , 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/bdel_temp<0><0>[10] , 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/bdel_temp<0><0>[10] , 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/bdel_temp<0><0>[10] , 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/bdel_temp<0><0>[10] , 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/bdel_temp<0><0>[10] , 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/bdel_temp<0><0>[10] , 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/bdel_temp<0><0>[10] , 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/bdel_temp<0><0>[5] , 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/bdel_temp<0><0>[4] , 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/bdel_temp<0><0>[3] , 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/bdel_temp<0><0>[2] , 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/bdel_temp<0><0>[1] , 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/bdel_temp<0><0>[0] }),
    .C({\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17]}),
    .CARRYINSEL({\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17]}),
    .OPMODE({\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], \BU2/N1 , \BU2/N1 , 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], \BU2/N1 , 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], \BU2/N1 }),
    .BCIN({\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17]}),
    .ALUMODE({\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17]}),
    .PCOUT({\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [47], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [46], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [45], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [44], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [43], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [42], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [41], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [40], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [39], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [38], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [37], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [36], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [35], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [34], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [33], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [32], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [31], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [30], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [29], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [28], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [27], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [26], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [25], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [24], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [23], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [22], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [21], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [20], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [19], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [18], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [16], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [15], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [14], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [13], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [12], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [11], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [10], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [9], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [8], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [7], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [6], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [5], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [4], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [3], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [2], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [1], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [0]}),
    .P({\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_P<47>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_P<46>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_P<45>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_P<44>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_P<43>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_P<42>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_P<41>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_P<40>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_P<39>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_P<38>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_P<37>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_P<36>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_P<35>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_P<34>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_P<33>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_P<32>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_P<31>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_P<30>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_P<29>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_P<28>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_P<27>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_P<26>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_P<25>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_P<24>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_P<23>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_P<22>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_P<21>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_P<20>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_P<19>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_P<18>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_P<17>_UNCONNECTED , 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<0><0> [16], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<0><0> [15], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<0><0> [14], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<0><0> [13], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<0><0> [12], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<0><0> [11], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<0><0> [10], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<0><0> [9], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<0><0> [8], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<0><0> [7], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<0><0> [6], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<0><0> [5], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<0><0> [4], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<0><0> [3], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<0><0> [2], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<0><0> [1], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<0><0> [0]}),
    .BCOUT({\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/bcout<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/bcout<0><0> [16], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/bcout<0><0> [15], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/bcout<0><0> [14], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/bcout<0><0> [13], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/bcout<0><0> [12], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/bcout<0><0> [11], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/bcout<0><0> [10], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/bcout<0><0> [9], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/bcout<0><0> [8], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/bcout<0><0> [7], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/bcout<0><0> [6], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/bcout<0><0> [5], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/bcout<0><0> [4], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/bcout<0><0> [3], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/bcout<0><0> [2], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/bcout<0><0> [1], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/bcout<0><0> [0]}),
    .ACIN({\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17]}),
    .ACOUT({
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_ACOUT<29>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_ACOUT<28>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_ACOUT<27>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_ACOUT<26>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_ACOUT<25>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_ACOUT<24>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_ACOUT<23>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_ACOUT<22>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_ACOUT<21>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_ACOUT<20>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_ACOUT<19>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_ACOUT<18>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_ACOUT<17>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_ACOUT<16>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_ACOUT<15>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_ACOUT<14>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_ACOUT<13>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_ACOUT<12>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_ACOUT<11>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_ACOUT<10>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_ACOUT<9>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_ACOUT<8>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_ACOUT<7>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_ACOUT<6>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_ACOUT<5>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_ACOUT<4>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_ACOUT<3>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_ACOUT<2>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_ACOUT<1>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_ACOUT<0>_UNCONNECTED }),
    .CARRYOUT({
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_CARRYOUT<3>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_CARRYOUT<2>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_CARRYOUT<1>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].iDSP48E_CARRYOUT<0>_UNCONNECTED })
  );
  DSP48E #(
    .ACASCREG ( 2 ),
    .ALUMODEREG ( 0 ),
    .AREG ( 2 ),
    .AUTORESET_PATTERN_DETECT ( "FALSE" ),
    .AUTORESET_PATTERN_DETECT_OPTINV ( "MATCH" ),
    .A_INPUT ( "DIRECT" ),
    .BCASCREG ( 1 ),
    .BREG ( 1 ),
    .B_INPUT ( "CASCADE" ),
    .CARRYINREG ( 0 ),
    .CARRYINSELREG ( 0 ),
    .CREG ( 0 ),
    .PATTERN ( 48'h000000000000 ),
    .MREG ( 1 ),
    .MULTCARRYINREG ( 0 ),
    .OPMODEREG ( 0 ),
    .PREG ( 1 ),
    .SEL_MASK ( "MASK" ),
    .SEL_PATTERN ( "PATTERN" ),
    .SEL_ROUNDING_MASK ( "SEL_MASK" ),
    .SIM_MODE ( "SAFE" ),
    .USE_MULT ( "MULT_S" ),
    .USE_PATTERN_DETECT ( "NO_PATDET" ),
    .USE_SIMD ( "ONE48" ),
    .MASK ( 48'h000000000000 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E  (
    .CARRYIN(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17]),
    .CEA1(\BU2/N1 ),
    .CEA2(\BU2/N1 ),
    .CEB1(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17]),
    .CEB2(\BU2/N1 ),
    .CEC(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17]),
    .CECTRL(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17]),
    .CEP(\BU2/N1 ),
    .CEM(\BU2/N1 ),
    .CECARRYIN(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17]),
    .CEMULTCARRYIN(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17]),
    .CLK(clk),
    .RSTA(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17]),
    .RSTB(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17]),
    .RSTC(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17]),
    .RSTCTRL(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17]),
    .RSTP(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17]),
    .RSTM(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17]),
    .RSTALLCARRYIN(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17]),
    .CEALUMODE(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17]),
    .RSTALUMODE(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17]),
    .PATTERNBDETECT
(\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_PATTERNBDETECT_UNCONNECTED ),
    .PATTERNDETECT
(\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_PATTERNDETECT_UNCONNECTED ),
    .OVERFLOW
(\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_OVERFLOW_UNCONNECTED ),
    .UNDERFLOW
(\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_UNDERFLOW_UNCONNECTED ),
    .CARRYCASCIN(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17]),
    .CARRYCASCOUT
(\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_CARRYCASCOUT_UNCONNECTED ),
    .MULTSIGNIN(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17]),
    .MULTSIGNOUT
(\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_MULTSIGNOUT_UNCONNECTED ),
    .A({\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp0<1><0> [24], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp0<1><0> [23], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp0<1><0> [22], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp0<1><0> [21], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp0<1><0> [20], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp0<1><0> [19], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp0<1><0> [18], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp0<1><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp0<1><0> [16], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp0<1><0> [15], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp0<1><0> [14], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp0<1><0> [13], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp0<1><0> [12], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp0<1><0> [11], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp0<1><0> [10], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp0<1><0> [9], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp0<1><0> [8], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp0<1><0> [7], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp0<1><0> [6], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp0<1><0> [5], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp0<1><0> [4], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp0<1><0> [3], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp0<1><0> [2], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp0<1><0> [1], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp0<1><0> [0]}),
    .PCIN({\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [47], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [46], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [45], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [44], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [43], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [42], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [41], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [40], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [39], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [38], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [37], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [36], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [35], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [34], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [33], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [32], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [31], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [30], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [29], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [28], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [27], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [26], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [25], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [24], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [23], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [22], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [21], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [20], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [19], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [18], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [16], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [15], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [14], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [13], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [12], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [11], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [10], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [9], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [8], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [7], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [6], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [5], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [4], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [3], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [2], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [1], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pcout<0><0> [0]}),
    .B({\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17]}),
    .C({\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17]}),
    .CARRYINSEL({\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17]}),
    .OPMODE({\BU2/N1 , \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], \BU2/N1 , 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], \BU2/N1 , 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], \BU2/N1 }),
    .BCIN({\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/bcout<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/bcout<0><0> [16], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/bcout<0><0> [15], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/bcout<0><0> [14], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/bcout<0><0> [13], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/bcout<0><0> [12], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/bcout<0><0> [11], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/bcout<0><0> [10], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/bcout<0><0> [9], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/bcout<0><0> [8], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/bcout<0><0> [7], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/bcout<0><0> [6], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/bcout<0><0> [5], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/bcout<0><0> [4], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/bcout<0><0> [3], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/bcout<0><0> [2], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/bcout<0><0> [1], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/bcout<0><0> [0]}),
    .ALUMODE({\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17]}),
    .PCOUT({\BU2/pcasc [47], \BU2/pcasc [46], \BU2/pcasc [45], \BU2/pcasc [44], \BU2/pcasc [43], \BU2/pcasc [42], \BU2/pcasc [41], \BU2/pcasc [40], 
\BU2/pcasc [39], \BU2/pcasc [38], \BU2/pcasc [37], \BU2/pcasc [36], \BU2/pcasc [35], \BU2/pcasc [34], \BU2/pcasc [33], \BU2/pcasc [32], 
\BU2/pcasc [31], \BU2/pcasc [30], \BU2/pcasc [29], \BU2/pcasc [28], \BU2/pcasc [27], \BU2/pcasc [26], \BU2/pcasc [25], \BU2/pcasc [24], 
\BU2/pcasc [23], \BU2/pcasc [22], \BU2/pcasc [21], \BU2/pcasc [20], \BU2/pcasc [19], \BU2/pcasc [18], \BU2/pcasc [17], \BU2/pcasc [16], 
\BU2/pcasc [15], \BU2/pcasc [14], \BU2/pcasc [13], \BU2/pcasc [12], \BU2/pcasc [11], \BU2/pcasc [10], \BU2/pcasc [9], \BU2/pcasc [8], \BU2/pcasc [7], 
\BU2/pcasc [6], \BU2/pcasc [5], \BU2/pcasc [4], \BU2/pcasc [3], \BU2/pcasc [2], \BU2/pcasc [1], \BU2/pcasc [0]}),
    .P({\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_P<47>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_P<46>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_P<45>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_P<44>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_P<43>_UNCONNECTED , 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<1><0> [42], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<1><0> [41], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<1><0> [40], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<1><0> [39], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<1><0> [38], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<1><0> [37], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<1><0> [36], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<1><0> [35], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<1><0> [34], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<1><0> [33], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<1><0> [32], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<1><0> [31], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<1><0> [30], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<1><0> [29], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<1><0> [28], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<1><0> [27], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<1><0> [26], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<1><0> [25], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<1><0> [24], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<1><0> [23], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<1><0> [22], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<1><0> [21], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<1><0> [20], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<1><0> [19], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<1><0> [18], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<1><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<1><0> [16], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<1><0> [15], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<1><0> [14], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<1><0> [13], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<1><0> [12], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<1><0> [11], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<1><0> [10], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<1><0> [9], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<1><0> [8], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<1><0> [7], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<1><0> [6], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<1><0> [5], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<1><0> [4], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<1><0> [3], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<1><0> [2], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<1><0> [1], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<1><0> [0]}),
    .BCOUT({
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_BCOUT<17>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_BCOUT<16>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_BCOUT<15>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_BCOUT<14>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_BCOUT<13>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_BCOUT<12>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_BCOUT<11>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_BCOUT<10>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_BCOUT<9>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_BCOUT<8>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_BCOUT<7>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_BCOUT<6>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_BCOUT<5>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_BCOUT<4>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_BCOUT<3>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_BCOUT<2>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_BCOUT<1>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_BCOUT<0>_UNCONNECTED }),
    .ACIN({\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17], 
\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17]}),
    .ACOUT({
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_ACOUT<29>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_ACOUT<28>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_ACOUT<27>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_ACOUT<26>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_ACOUT<25>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_ACOUT<24>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_ACOUT<23>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_ACOUT<22>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_ACOUT<21>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_ACOUT<20>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_ACOUT<19>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_ACOUT<18>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_ACOUT<17>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_ACOUT<16>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_ACOUT<15>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_ACOUT<14>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_ACOUT<13>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_ACOUT<12>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_ACOUT<11>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_ACOUT<10>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_ACOUT<9>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_ACOUT<8>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_ACOUT<7>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_ACOUT<6>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_ACOUT<5>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_ACOUT<4>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_ACOUT<3>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_ACOUT<2>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_ACOUT<1>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_ACOUT<0>_UNCONNECTED }),
    .CARRYOUT({
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_CARRYOUT<3>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_CARRYOUT<2>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_CARRYOUT<1>_UNCONNECTED , 
\NLW_BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[1].bppDSP48E[0].iDSP48E_CARRYOUT<0>_UNCONNECTED })
  );
  VCC   \BU2/XST_VCC  (
    .P(\BU2/N1 )
  );
  GND   \BU2/XST_GND  (
    .G(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/adel30_temp<0><0> [17])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].need_output_delay.output_delay/dout_i_16  (
    .C(clk),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<0><0> [16]),
    .Q(p_2[16])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].need_output_delay.output_delay/dout_i_15  (
    .C(clk),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<0><0> [15]),
    .Q(p_2[15])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].need_output_delay.output_delay/dout_i_14  (
    .C(clk),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<0><0> [14]),
    .Q(p_2[14])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].need_output_delay.output_delay/dout_i_13  (
    .C(clk),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<0><0> [13]),
    .Q(p_2[13])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].need_output_delay.output_delay/dout_i_12  (
    .C(clk),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<0><0> [12]),
    .Q(p_2[12])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].need_output_delay.output_delay/dout_i_11  (
    .C(clk),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<0><0> [11]),
    .Q(p_2[11])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].need_output_delay.output_delay/dout_i_10  (
    .C(clk),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<0><0> [10]),
    .Q(p_2[10])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].need_output_delay.output_delay/dout_i_9  (
    .C(clk),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<0><0> [9]),
    .Q(p_2[9])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].need_output_delay.output_delay/dout_i_8  (
    .C(clk),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<0><0> [8]),
    .Q(p_2[8])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].need_output_delay.output_delay/dout_i_7  (
    .C(clk),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<0><0> [7]),
    .Q(p_2[7])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].need_output_delay.output_delay/dout_i_6  (
    .C(clk),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<0><0> [6]),
    .Q(p_2[6])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].need_output_delay.output_delay/dout_i_5  (
    .C(clk),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<0><0> [5]),
    .Q(p_2[5])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].need_output_delay.output_delay/dout_i_4  (
    .C(clk),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<0><0> [4]),
    .Q(p_2[4])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].need_output_delay.output_delay/dout_i_3  (
    .C(clk),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<0><0> [3]),
    .Q(p_2[3])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].need_output_delay.output_delay/dout_i_2  (
    .C(clk),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<0><0> [2]),
    .Q(p_2[2])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].need_output_delay.output_delay/dout_i_1  (
    .C(clk),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<0><0> [1]),
    .Q(p_2[1])
  );
  FD #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/use_DSP48E.appDSP48E[0].bppDSP48E[0].need_output_delay.output_delay/dout_i_0  (
    .C(clk),
    .D(\BU2/U0/i_synth.i_synth_model/gEMBEDDED_MULT.gEMB_MULTS_only.gDSP.iDSP/pi<0><0> [0]),
    .Q(p_2[0])
  );

// synthesis translate_on

endmodule

// synthesis translate_off

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

    wire GSR;
    wire GTS;
    wire PRLD;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

// synthesis translate_on
