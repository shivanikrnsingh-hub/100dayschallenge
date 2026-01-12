`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:01:56 01/12/2026 
// Design Name: 
// Module Name:    demu_xor_xnor 
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
module demu_xor_xnor(
 input a,b,
 output xor_o,xnor_o
    );
	 wire  w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14,w15,w16,w17,w18;
   Demultiplexer_2x1 dmux1(.I(b),.sel(a),.y0(w1),.y1(w2));
	Demultiplexer_2x1 dmux2(.I(a),.sel(b),.y0(w4),.y1(w3));
	
//	----------------orgate _for xor_----------------------
  
Demultiplexer_2x1 demux3(.I(1'b1),.sel(w1),.y0(w5),.y1(w7));
Demultiplexer_2x1 demux4(.I(1'b1),.sel(w4),.y0(w6),.y1(w8));

Demultiplexer_2x1 demux5(.I(w6),.sel(w5),.y0(w9),.y1(w10));

Demultiplexer_2x1 demux6(.I(1'b1),.sel(w10),.y0(xor_o),.y1(w11)); 
//	----------------xnorgate _for xor_----------------------

Demultiplexer_2x1 demux7(.I(1'b1),.sel(w2),.y0(w12),.y1(w14));
Demultiplexer_2x1 demux8(.I(1'b1),.sel(w3),.y0(w13),.y1(w15));

Demultiplexer_2x1 demux9(.I(w13),.sel(w12),.y0(w16),.y1(w17));

Demultiplexer_2x1 demux10(.I(1'b1),.sel(w17),.y0(xnor_o),.y1(w18));


endmodule
