`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:22:09 01/12/2026 
// Design Name: 
// Module Name:    nor_g_demux 
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
module nor_g_demux( input a,b,
output nor_o
    );
wire w1,w2,w3,w4,w5;

Demultiplexer_2x1 demux1(.I(1'b1),.sel(a),.y0(w1),.y1(w2));
Demultiplexer_2x1 demux2(.I(1'b1),.sel(b),.y0(w3),.y1(w4));
Demultiplexer_2x1 demux3(.I(w3),.sel(w1),.y0(w5),.y1(nor_o));



endmodule
