`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:52:07 02/12/2026 
// Design Name: 
// Module Name:    Mod-N_counter 
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
module Mod_N_counter #(
     parameter N=6,
	  parameter length=3    
    ) 
	(input clk,reset,
	output reg [length-1:0] counter);
	
	always@(posedge clk)
	 begin
	 if(reset)
	 counter<=0;
	 else
	  begin
	  if(counter==N-1)
	     counter<=0;
	  else
        counter<=counter+1;
      end
     end		


endmodule
