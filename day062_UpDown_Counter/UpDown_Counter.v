`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:40:40 02/12/2026 
// Design Name: 
// Module Name:    UpDown_Counter 
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
module UpDown_Counter#(parameter  N=4)
   (
    input clk,reset,mode,
	 output reg [N-1:0] counter
    );
   
   always@(posedge clk)
	
	begin
	
	if(reset)
	counter<=0;
	else
	 
	if(mode==1)
	  if(counter==2*N-1)
	  counter<=0;
	  else
	  counter<=counter+1;
   else
	  if(counter==0)
     counter<=2*N-1;
	  else
	  counter<=counter-1;
	end
endmodule
