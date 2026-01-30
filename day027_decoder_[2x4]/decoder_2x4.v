`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:46:23 01/12/2026 
// Design Name: 
// Module Name:    decoder_2x4 
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
module decoder_2x4(
 input [1:0] in,
 output reg [3:0] out
    );
   always@(*)
	 begin
	  out=4'b0000;
	  case(in)
	   2'b00:out[0]=1'b1;
	   2'b01:out[1]=1'b1;
	   2'b10:out[2]=1'b1;
	   2'b11:out[3]=1'b1;
		endcase
		
	end	
		

endmodule
