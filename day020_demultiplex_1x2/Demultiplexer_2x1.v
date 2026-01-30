`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:59:21 01/10/2026 
// Design Name: 
// Module Name:    Demultiplexer_2x1 
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
module Demultiplexer_2x1(
   input I,sel,
	output y0,y1
    );
   
	assign{y0,y1}=sel?{1'b0,I}:{I,1'b0};

endmodule
