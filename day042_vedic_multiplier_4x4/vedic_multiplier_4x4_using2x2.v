`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:39:12 01/29/2026 
// Design Name: 
// Module Name:    vedic_multiplier4x4_using2x2 
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
module vedic_multiplier4x4_using2x2(
   input [3:0] A,B,
	output [7:0] M
	
    );
    wire [3:0] m1,m2,m3,m4,s1,s2,s3;
	 wire c1,c2,c3;
	 
vedic_multiplier_2x2 v1(.A(A[1:0]),.B(B[1:0]),.M(m1));
vedic_multiplier_2x2 v2(.A(A[3:2]),.B(B[1:0]),.M(m2));
vedic_multiplier_2x2 v3(.A(A[1:0]),.B(B[3:2]),.M(m3));
vedic_multiplier_2x2 v4(.A(A[3:2]),.B(B[3:2]),.M(m4));


bit4_RCA a1(.a(m2),.b(m3),.cin(1'b0),.sum(s1),.cout(c1));
bit4_RCA a2(.a(s1),.b({2'b00,m1[3:2]}),.cin(1'b0),.sum(s2),.cout(c2));
bit4_RCA a3(.a(m4),.b({c1,1'b0,s2[3:2]}),.cin(1'b0),.sum(s3),.cout(c3));

assign M ={s3,s2[1:0],m1[1:0]};




endmodule
