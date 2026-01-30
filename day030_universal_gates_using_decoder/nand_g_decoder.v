`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    05:47:30 01/16/2026 
// Design Name: 
// Module Name:    nand_g_decoder 
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
module nand_g_decoder(
   input a,b,
	output nand_o
    );
wire [3:0] w;

decoder_2x4 decoder1(.in({a,b}),.out(w));


assign nand_o=~w[3];
endmodule
