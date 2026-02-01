`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:02:47 02/01/2026 
// Design Name: 
// Module Name:    T_ff_using_SR_D_JK 
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
module T_ff_using_SR_D_JK(
   input T,reset,clk,
	output Q_SR,Q_JK,Q_D
    );
  wire w1,w2,w3;
  
  assign w1=T&(~Q_SR);
  assign w2=T&Q_SR;
  
  SR_flipflop SR(.S(w1),.R(w2),.reset(reset),.clk(clk),.Q(Q_SR));
  
  JK_flipflop JK(.J(T),.K(T),.clk(clk),.reset(reset),.Q(Q_JK));
  
  assign w3=T^Q_D;
  
  D_flipflop D(.D(w3),.clk(clk),.reset(reset),.Q(Q_D));
  
endmodule
