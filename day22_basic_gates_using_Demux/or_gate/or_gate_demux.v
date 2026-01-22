`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:39:00 01/11/2026 
// Design Name: 
// Module Name:    or_gate_demux 
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
module or_gate_demux(
input a,b,
output or_o
    );
wire w1,w2,w3,w4,w5,w6,w8;

Demultiplexer_2x1 demux1(.I(1'b1),.sel(a),.y0(w1),.y1(w2));
Demultiplexer_2x1 demux2(.I(1'b1),.sel(b),.y0(w3),.y1(w4));

Demultiplexer_2x1 demux3(.I(w3),.sel(w1),.y0(w5),.y1(w6));

Demultiplexer_2x1 demux4(.I(1'b1),.sel(w6),.y0(or_o),.y1(w8));







endmodule
