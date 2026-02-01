`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:12:19 02/01/2026 
// Design Name: 
// Module Name:    JK_using_D_T_SR 
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
module JK_using_D_T_SR(
    input J,K,reset,clk,
	 output Q_T,Q_D,Q_SR
    );
	 wire w1,w2,w3,w4,w5,w6,w7,w8;
	 
	 assign w1=~Q_SR&J;
	 assign w2=Q_SR&K;
	 
	 SR_flipflop SR(.S(w1),.R(w2),.reset(reset),.clk(clk),.Q(Q_SR));
	 
	 assign w3=~Q_D&J;
	 assign w4=~K&Q_D;
	 assign w5=w3|w4;
	 
	 D_flipflop D(.D(w5),.reset(reset),.clk(clk),.Q(Q_D));
	 
	 assign w6=Q_T&K;
	 assign w7=~Q_T&J;
	 assign w8=w6|w7;
	 
    T_flipflop  T(.T(w8),.reset(reset),.clk(clk),.Q(Q_T));

endmodule
