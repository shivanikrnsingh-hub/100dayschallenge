`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:04:38 02/13/2026 
// Design Name: 
// Module Name:    frequency_divider_odd 
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
module frequency_divider_odd(
     input reset,clk,
	  output  clk_by7
    );
wire [2:0] q;
wire temp;
Mod_7_counter m7(.clk(clk),.reset(reset),.counter(q));

D_flipflop d (.clk(~clk),.reset(reset),.D(q[1]),.Q(temp));

or(clk_by7,q[1],temp);


endmodule