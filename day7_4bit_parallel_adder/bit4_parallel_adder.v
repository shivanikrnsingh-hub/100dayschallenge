`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:23:46 01/08/2026 
// Design Name: 
// Module Name:    bit4_parallel_adder 
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
module bit4_parallel_adder(
input [3:0] a,b ,
input cin,
output [3:0] sum,
output carry
    );
wire [2:0] c;

full_adder fa1(.a(a[0]),.b(b[0]),.cin(cin),.sum(sum[0]),.cout(c[0]));
full_adder fa2(.a(a[1]),.b(b[1]),.cin(c[0]),.sum(sum[1]),.cout(c[1]));
full_adder fa3(.a(a[2]),.b(b[2]),.cin(c[1]),.sum(sum[2]),.cout(c[2]));
full_adder fa4(.a(a[3]),.b(b[3]),.cin(c[2]),.sum(sum[3]),.cout(carry));



endmodule
