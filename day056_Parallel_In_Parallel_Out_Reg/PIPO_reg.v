`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:19:33 02/05/2026 
// Design Name: 
// Module Name:    PIPO_reg 
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
module PIPO_reg(
    input clk,reset,
	 input [2:0] parallel_in,
	 output [2:0] parallel_out
	 
	 );
	 
	 D_flipflop d1(.D(parallel_in[2]),.clk(clk),.reset(reset),.Q(parallel_out[2]));
	 D_flipflop d2(.D(parallel_in[1]),.clk(clk),.reset(reset),.Q(parallel_out[1]));
	 D_flipflop d3(.D(parallel_in[0]),.clk(clk),.reset(reset),.Q(parallel_out[0]));
	 


endmodule
