`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:50:12 02/01/2026
// Design Name:   JK_using_D_T_SR
// Module Name:   /home/ise/verilog_projects/challenge100days2/JK_using_SR_D_Tff_tb.v
// Project Name:  challenge100days2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: JK_using_D_T_SR
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module JK_using_SR_D_Tff_tb;

	// Inputs
	reg J;
	reg K;
	reg reset;
	reg clk;

	// Outputs
	wire Q_T;
	wire Q_D;
	wire Q_SR;

	// Instantiate the Unit Under Test (UUT)
	JK_using_D_T_SR uut (
		.J(J), 
		.K(K), 
		.reset(reset), 
		.clk(clk), 
		.Q_T(Q_T), 
		.Q_D(Q_D), 
		.Q_SR(Q_SR)
	);

	initial begin
		// Initialize Inputs
		J = 0;
		K = 0;
		reset = 1;
		clk = 0;
		
		#10;
		reset=0;

	end
	
	initial begin 
	forever #5 clk=~clk;
	end
	
	always
	 begin 
	 
	 J=1;
	 K=1;
	 #10;
	 J=0;
	 K=1;
    #10;
	 
	 J=1;
	 K=0;
	 #10;
	 
	 J=0;
	 K=0;
	 #10;
	 end
	 
	 initial begin
	 $monitor("J,K,reset,clk,Q_D,Q_jk,Q_T",J,K,reset,clk,Q_D,Q_SR,Q_T);
	 #120;
	 $finish;
	 end
      
endmodule

