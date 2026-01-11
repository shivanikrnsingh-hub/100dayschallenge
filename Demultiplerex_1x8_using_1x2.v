`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:21:44 01/11/2026 
// Design Name: 
// Module Name:    Demultiplerex_1x8_using_1x2 
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
module Demultiplerex_1x8_using_1x2(
   input I,
	input [2:0] sel,
	output y0,y1,y2,y3,y4,y5,y6,y7
    );
   wire[5:0] z;
	Demultiplexer_2x1 dmux1(sel[2],I,z[0],z[1]);
	
	Demultiplexer_2x1 dmux2(sel[1],z[0],z[2],z[3]);
	Demultiplexer_2x1 dmux3(sel[1],z[1],z[4],z[5]);
	
	Demultiplexer_2x1 dmux4(sel[0],z[2],y0,y1);
	Demultiplexer_2x1 dmux5(sel[0],z[3],y2,y3);
   Demultiplexer_2x1 dmux6(sel[0],z[4],y4,y5);
	Demultiplexer_2x1 dmux7(sel[0],z[5],y6,y7);

	
	

endmodule
