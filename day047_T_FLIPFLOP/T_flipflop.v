`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:51:43 01/31/2026 
// Design Name: 
// Module Name:    T_flipflop 
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
module T_flipflop(
      input T,reset,clk,
		output reg Q
   
    );

   always@(posedge clk)
	  begin
	   if(reset)
       Q<=1'b0;
      else
		 begin
       if(T)
         Q<=~Q;
        else
         Q<=Q;		  
         end
			end
			
endmodule
