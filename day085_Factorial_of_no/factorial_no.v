`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:42:52 03/07/2026 
// Design Name: 
// Module Name:    factorial_no 
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
module factorial_no(
    input clk,reset,start,
	 input [3:0] num_in,
	 output reg [31:0] result,
	 output reg done
    );

   reg [3:0] counter;

     always@(posedge clk)
	  begin
	  if(reset)begin
	  result<=1;
	  done<=0;
	  counter<=0;
	  end
	  else if(start)
	        begin
			  if(counter<num_in)begin
			     counter<=counter+1;
				  result<=result*(counter+1);
				  done<=0;
	           end
				  else
				  done<=1'b1;
	        end
    end
endmodule
