`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:25:42 02/12/2026 
// Design Name: 
// Module Name:    ring_counter 
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
module ring_counter #(parameter N=4)(input clk,reset,
   output reg [N-1:0] counter 
    );
	 
	 always@(posedge clk)
	  begin
	  if(reset)
	  counter<=1;
	  else
	  counter<={counter[0],counter[N-1:1]};
	  
	  end

endmodule
