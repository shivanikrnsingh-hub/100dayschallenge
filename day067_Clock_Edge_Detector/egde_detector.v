`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:32:01 02/13/2026 
// Design Name: 
// Module Name:    egde_detector 
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
module egde_detector(
    input clk,reset,clk_in,
	 output rising_edge,falling_edge,dual_edge
	 );

    reg synch0,synch1;

    always@(posedge clk or posedge reset)
	 begin
	  
	  if(reset)
	    begin
	  synch0<=0;
	  synch1<=0;
	    end
	  else
	    begin
	   synch0<=clk_in;
		synch1<=synch0;
     end
	  end
	  assign rising_edge=synch0&(~synch1);
	  assign falling_edge=(~synch0)&synch1;
	  assign dual_edge=synch0^synch1;
	  

endmodule
