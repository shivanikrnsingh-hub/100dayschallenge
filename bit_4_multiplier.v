`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:14:47 01/08/2026 
// Design Name: 
// Module Name:    bit_4_multiplier 
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
module bit_4_multiplier(
 input [3:0] a,b,
 output [7:0] out
    );
	 
	wire [7:0] t1,t2,t3,t4;
assign t1=b[0]?(a<<0):8'b0;
assign t2=b[1]?(a<<1):8'b0;
assign t3=b[2]?(a<<2):8'b0;
assign t4=b[3]?(a<<3):8'b0;

assign out=t1+t2+t3+t4;



endmodule
