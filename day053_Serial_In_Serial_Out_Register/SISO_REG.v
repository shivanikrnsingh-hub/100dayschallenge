`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:37:06 02/04/2026 
// Design Name: 
// Module Name:    SISO_REG 
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
module SISO_REG(
    input serial_in,clk,reset,
	 output serial_out
    );

   wire q0,q1;

   D_flipflop D1(.D(serial_in),.clk(clk),.reset(reset),.Q(q0));
   D_flipflop D2(.D(q0),.clk(clk),.reset(reset),.Q(q1));
   D_flipflop D3(.D(q1),.clk(clk),.reset(reset),.Q(serial_out));
	
	
   
	
	
	
endmodule
