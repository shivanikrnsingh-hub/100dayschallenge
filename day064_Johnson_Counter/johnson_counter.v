`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:54:48 02/12/2026 
// Design Name: 
// Module Name:    johnson_counter 
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
module johnson_counter#(parameter N=4)(
    input clk,reset,
	 output reg [N-1:0] counter
    );
  
   always@(posedge clk)
	  begin
	    if(reset)
		 counter<=0;
		 else
		 counter<={~counter[0],counter[N-1:1]};
	 end	 

endmodule
