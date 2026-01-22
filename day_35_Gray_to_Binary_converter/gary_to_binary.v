`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:41:26 01/16/2026 
// Design Name: 
// Module Name:    gary_to_binary 
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
module gary_to_binary(
  
  input [3:0] in_gray,
  output [3:0] out_binary
    );

   buf buf1(out_binary[3],in_gray[3]);
	xor xor1(out_binary[2],in_gray[2],out_binary[3]);
	xor xor2(out_binary[1],in_gray[1],out_binary[2]);
	xor xor3(out_binary[0],in_gray[0],out_binary[1]);

	
endmodule
