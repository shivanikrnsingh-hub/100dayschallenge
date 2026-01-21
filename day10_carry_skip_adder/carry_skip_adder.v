`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:37:22 01/08/2026 
// Design Name: 
// Module Name:    carry_skip_adder 
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
module carry_skip_adder(
input [3:0] a,b,
input cin,
output [3:0] sum,
output cout
    );
wire c,sel;
wire[3:0] p;

bit4_parallel_adder pa1(a,b,cin,sum,c);

xor (p[0],a[0],b[0]),
    (p[1],a[1],b[1]),
	 (p[2],a[2],b[2]),
	 (p[3],a[3],b[3]);
	 
and (sel,p[0],p[1],p[2],p[3]);
assign cout = (sel ? cin:c) ;   

endmodule
