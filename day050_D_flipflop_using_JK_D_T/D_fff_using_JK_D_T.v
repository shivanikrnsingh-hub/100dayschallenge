`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:12:58 02/01/2026 
// Design Name: 
// Module Name:    D_fff_using_JK_D_T 
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
module D_fff_using_JK_SR_T(
     
	  input D,reset,clk,
	  output Q_JK,Q_SR,Q_T
    );

  wire w;
  
  SR_flipflop SR(.S(D),.R(~D),.Q(Q_SR),.reset(reset),.clk(clk));
   
  JK_flipflop JK(.J(D),.K(~D),.Q(Q_JK),.reset(reset),.clk(clk));
  
  assign w=D^Q_T;
  T_flipflop  T(.T(w),.Q(Q_T),.reset(reset),.clk(clk));
  
  
  
  
  
  
endmodule
