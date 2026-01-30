`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:19:45 01/16/2026 
// Design Name: 
// Module Name:    Binary_to_Gray 
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
module Binary_to_Gray(
  input [3:0] in_binary,
  output [3:0] out_gray
    );

buf buf1(out_gray[3],in_binary[3]);
xor xor1(out_gray[2],in_binary[3],in_binary[2]);
xor xor2(out_gray[1],in_binary[2],in_binary[1]);
xor xor3(out_gray[0],in_binary[1],in_binary[0]);



endmodule
