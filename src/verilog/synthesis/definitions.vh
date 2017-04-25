//`define BUILD_ATF2IP_2BPM
//`define CLK357_PLL

//`define UART2_BAUD 115200
`define UART2_BAUD 1843200

`define DIGIN_UART_RX
`define TWO_BYTE_DECODE
//`define UART2_SELF_TEST

// The following macros must be defined on the command line (Synthesis options) //
// This is due to compile order issues. ///
/*
DIGIN_UART_RX
UART2_SELF_TEST
TWO_BYTE_DECODE
*/