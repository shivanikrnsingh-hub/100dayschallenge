`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:37:12 01/11/2026 
// Design Name: 
// Module Name:    nand_g_demux 
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
module nand_g_demux(
input a,b,
output nand_o
    );
	 
wire w1,w2,w3;

Demultiplexer_2x1 demux1(.I(b),.sel(a),.y0(w1),.y1(w2));
Demultiplexer_2x1 demux2(.I(1'b1),.sel(w2),.y0(nand_o),.y1(w3));



endmodule
