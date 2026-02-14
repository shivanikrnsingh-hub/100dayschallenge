`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:37:14 02/13/2026 
// Design Name: 
// Module Name:    frequency_divider_even 
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
module frequency_divider_even(
        input clk,reset,
		  output clk_by4
    );
   wire clk_by2;
  D_flipflop d1(.clk(clk),.reset(reset),.D(~clk_by4),.Q(clk_by2));
  D_flipflop d2(.clk(clk),.reset(reset),.D(clk_by2),.Q(clk_by4));
  

endmodule
