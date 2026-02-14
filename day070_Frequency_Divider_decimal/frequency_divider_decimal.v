`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:17:41 02/13/2026 
// Design Name: 
// Module Name:    frequency_divider_decimal 
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
module frequency_divider_decimal(
     input clk,reset,
	  output clk_7by2
    );
    wire q1,q2;
	 frequency_divider_odd f1(.clk(clk),.reset(reset),.clk_by7(q1));
	Dual_edge_triggered_flipflop d1 (.clk(clk),.reset(reset),.D(q1),.Q(q2));
	 xor(clk_7by2,q1,q2);

endmodule
