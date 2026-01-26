`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:50:41 01/26/2026 
// Design Name: 
// Module Name:    vedic_multiplier 
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
module vedic_multiplier_2x2(
 input [1:0] A,B,
 output [3:0] M
    );
wire[2:0] W;
wire C;
and a1(M[0],A[0],B[0]);
and a2(W[0],A[0],B[1]);
and a3(W[1],A[1],B[0]);
and a5(W[2],A[1],B[1]);

HA ha1(.sum(M[1]),.cout(C),.a(W[0]),.b(W[1]));
HA ha2(.sum(M[2]),.cout(M[3]),.a(W[C]),.b(W[2]));




endmodule
