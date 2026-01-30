`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:44:10 01/30/2026 
// Design Name: 
// Module Name:    asynchronous_and_synchronous_reset 
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
module asynchronous_and_synchronous_reset(
 input clk,reset,in,
 output reg syn_out,asyn_out
    );
   //--------------------------------synchronous reset---------------------------
	
	always@(posedge clk)
	  begin  
		 if(reset)
		 syn_out<=1'b0;
		 else
		 syn_out<=in;
     end  

  //---------------------------------asynchronous reset--------------------------

  always@(posedge clk or posedge reset)
    begin
      if(reset)
       asyn_out<=1'b0;
      else
       asyn_out<=in;
    end
	 
endmodule
