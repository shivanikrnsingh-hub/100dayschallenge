`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:03:23 02/04/2026 
// Design Name: 
// Module Name:    Dual_edge_triggered_flipflop 
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
module Dual_edge_triggered_flipflop(
       input reset,clk,D,
		 output Q
		 
    );
    
	 
	 reg Q1,Q2;
	 
    assign Q=clk?Q1:Q2;
     
    always@(posedge clk)
	 begin
	 if(reset)
	 Q1<=1'b0;
	 else
	 Q1<=D;
	 end
	 
	 always@(negedge clk)
	  begin
	   if(reset)
		Q2<=1'b0;
		else
		Q2<=D;
		end
	 
endmodule
