`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:12:22 02/01/2026
// Design Name:   T_ff_using_SR_D_JK
// Module Name:   /home/ise/verilog_projects/challenge100days2/T_FF_using_D_SR_JK_tb.v
// Project Name:  challenge100days2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: T_ff_using_SR_D_JK
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module T_FF_using_D_SR_JK_tb;

	// Inputs
	reg T;
	reg reset;
	reg clk;

	// Outputs
	wire Q_SR;
	wire Q_JK;
	wire Q_D;

	// Instantiate the Unit Under Test (UUT)
	T_ff_using_SR_D_JK uut (
		.T(T), 
		.reset(reset), 
		.clk(clk), 
		.Q_SR(Q_SR), 
		.Q_JK(Q_JK), 
		.Q_D(Q_D)
	);

initial begin
		// Initialize Inputs
		T = 0;
		reset = 1;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#10;
		reset=0;
        
		// Add stimulus here

	end
	
	initial begin
	forever #5 clk=~clk;
	end
	
	always begin
	
	T=1;
	#10;
	T=0;
	#10;
	
	end
	
	initial 
	 begin
	   $monitor("T=%d,reset=%d,clk=%d,Q_D=%d,Q_JK=%d,Q_SR=%d",T,reset,clk,Q_D,Q_JK,Q_SR);
		#80;
		$finish;
	end	
      
endmodule

