`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:57:07 01/31/2026
// Design Name:   T_flipflop
// Module Name:   /home/ise/verilog_projects/challenge100days2/T_ff_tb.v
// Project Name:  challenge100days2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: T_flipflop
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module T_ff_tb;

	// Inputs
	reg T;
	reg reset;
	reg clk;

	// Outputs
	wire Q;

	// Instantiate the Unit Under Test (UUT)
	T_flipflop uut (
		.T(T), 
		.reset(reset), 
		.clk(clk), 
		.Q(Q)
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
	   $monitor("T=%d,reset=%d,clk=%d,Q=%d",T,reset,clk,Q);
		#80;
		$finish;
	end	
      
endmodule

