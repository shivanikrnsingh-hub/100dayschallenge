`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:53:30 02/01/2026 
// Design Name: 
// Module Name:    SR_latch_using_jk_t_d_ff 
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
module SR_latch_using_jk_t_d_ff(
   input S,R,reset,clk,
	output  Q_jk,Q_T,Q_D

    );
    
	 wire w1,w2,w3,w4,w5;
	 
    JK_flipflop JK(.J(S),.K(R),.reset(reset),.clk(clk),.Q(Q_jk));
	 assign w1=~R&Q_D;
	 assign w2=w1|S;
	 
	 D_flipflop D(.D(w2),.reset(reset),.clk(clk),.Q(Q_D));
	 assign w3=R&Q_T;
	 assign w4=~Q_T&S;
	 assign w5=w3|w4;
	 
	 T_flipflop  T(.T(w5),.reset(reset),.clk(clk),.Q(Q_T));
	 
	 
endmodule
