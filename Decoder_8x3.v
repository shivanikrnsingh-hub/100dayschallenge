`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:54:24 01/12/2026 
// Design Name: 
// Module Name:    Decoder_8x3 
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
module Decoder_8x3(
   input [2:0] in,
	output reg [7:0] out
    );
  
  always@(*)
    begin
	 out=8'b00000000;
	  case(in)
	   3'b000:out[0]=1'b1;
		3'b001:out[1]=1'b1;
	   3'b010:out[2]=1'b1;	  
		3'b011:out[3]=1'b1;
	   3'b100:out[4]=1'b1;
	   3'b101:out[5]=1'b1;
	   3'b110:out[6]=1'b1;
	   3'b111:out[7]=1'b1;
		
		endcase
		end

	  

		
	    

endmodule
