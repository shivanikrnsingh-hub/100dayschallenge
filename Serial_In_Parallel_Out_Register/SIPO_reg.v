`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:58:51 02/04/2026 
// Design Name: 
// Module Name:    SIPO_reg 
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
module SIPO_reg(
        input reset,clk,serial_in,
		  output [2:0] parallel_out
    );
	 
	 	    D_flipflop d1(.D(serial_in),.clk(clk),.reset(reset),.Q(parallel_out[2]));
	       D_flipflop d2(.D(parallel_out[2]),.clk(clk),.reset(reset),.Q(parallel_out[1]));
	       D_flipflop d3(.D(parallel_out[1]),.clk(clk),.reset(reset),.Q(parallel_out[0]));
		 


endmodule
