`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:42:17 01/13/2026 
// Design Name: 
// Module Name:    or_g_decoder 
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
module or_g_decoder(
 input a,b,
 output or_o
    );
	 
wire[3:0] w;	 
decoder_2x4 demux1(.in({a,b}),.out(w));
assign or_o=w[3]|w[1]|w[2];

endmodule
