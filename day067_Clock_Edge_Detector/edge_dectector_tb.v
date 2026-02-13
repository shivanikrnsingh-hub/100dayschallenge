`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:43:50 02/13/2026
// Design Name:   egde_detector
// Module Name:   /home/ise/verilog_projects/challenge100days2/edge_dectector_tb.v
// Project Name:  challenge100days2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: egde_detector
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module edge_dectector_tb;

	// Inputs
	reg clk;
	reg reset;
   reg clk_in;
	// Outputs
	wire rising_edge;
	wire falling_edge;
	wire dual_edge;

	// Instantiate the Unit Under Test (UUT)
	egde_detector uut (
		.clk(clk),.clk_in(clk_in), 
		.reset(reset), 
		.rising_edge(rising_edge), 
		.falling_edge(falling_edge), 
		.dual_edge(dual_edge)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
      clk_in=0;
		// Wait 100 ns for global reset to finish
		#5;
      reset = 0;
  
// Add stimulus here

	end
	
	initial
	forever #5 clk=~clk;
	
	initial
   forever #6 clk_in=~clk_in;
   
	 
   initial begin
	$monitor("clk=%d,clk_in=%d,reset=%d,rising_edge=%d,falling_edge=%d,dual_edge=%d",clk,clk_in,reset,rising_edge,falling_edge,dual_edge);
	
	
	#100;
	$finish;
	end
endmodule

