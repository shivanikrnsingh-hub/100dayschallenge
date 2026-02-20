`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:37:58 02/20/2026
// Design Name:   fsm_moore_overlapping
// Module Name:   /home/ise/verilog_projects/challenge100days2/fsm_moore_overlapping_tb.v
// Project Name:  challenge100days2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: fsm_moore_overlapping
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module fsm_moore_overlapping_tb;

	// Inputs
	reg clk;
	reg reset;
   reg din;
	// Outputs
	wire out;

	// Instantiate the Unit Under Test (UUT)
	fsm_moore_overlapping uut (
		.clk(clk), 
		.reset(reset),.din(din), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		din = 0;

		// Wait 100 ns for global reset to finish
		#15;
       reset = 0; 
		// Add stimulus here

	end
      
   initial
    forever #5 clk=~clk;
   initial
	 begin
	 
   @(negedge clk) din=1;
	@(negedge clk) din=1;
	@(negedge clk) din=0;
	@(negedge clk) din=1;
	@(negedge clk) din=1;
	//--------sequence detected----------------
	
	
	@(negedge clk) din=0;
	@(negedge clk) din=1;
	@(negedge clk) din=1;
	
	//overlapp 
	@(negedge clk) din=1;
	@(negedge clk) din=1;
	@(negedge clk) din=0;
	@(negedge clk) din=1;
	@(negedge clk) din=1;
	 
	 end
	
  initial
    begin
    $monitor("clk=%b,din=%b,out=%b",clk,din,out);
	 #200;
	 $finish;
    end	 
      
endmodule

