`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:18:59 02/12/2026 
// Design Name: 
// Module Name:    gray_counter 
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
module gray_counter(
      input clk,reset,
		output reg [3:0] counter
     );

reg [3:0] count;

   always@(posedge clk)
	   begin
		if(reset)
		 begin
		 counter<=0;
		 count<=0;
		 end
		 else
		 begin
		 count<=count+1;
		 counter<={count[3],count[3]^count[2],count[2]^count[1],count[1]^count[0]};
		 end
		end 
		 
endmodule
