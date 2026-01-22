`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:03:01 01/16/2026 
// Design Name: 
// Module Name:    n_bit_square 
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
module n_bit_square#(parameter N=8)(
 
 input [N-1:0] num,
 output reg [2*N-1:0] result
    );
	 
	reg [2*N-1:0] temp;
	
	always@(*)
	  begin
	  
	  temp=num*num;
	  result=temp;
	  
	  end
	 




endmodule
