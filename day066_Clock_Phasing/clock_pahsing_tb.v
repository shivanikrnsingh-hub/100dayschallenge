`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   07:06:05 02/13/2026
// Design Name:   Clock_Phasing
// Module Name:   /home/ise/verilog_projects/challenge100days2/clock_pahsing_tb.v
// Project Name:  challenge100days2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Clock_Phasing
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module clock_pahsing_tb;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire clk_0;
	wire clk_90;
	wire clk_180;
	wire clk_270;

	// Instantiate the Unit Under Test (UUT)
	Clock_Phasing uut (
		.clk(clk), 
		.reset(reset), 
		.clk_0(clk_0), 
		.clk_90(clk_90), 
		.clk_180(clk_180), 
		.clk_270(clk_270)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;

		// Wait 100 ns for global reset to finish
		#10;
        
		// Add stimulus here
      reset = 0;
	end
      
		
   initial
     forever #5 clk=~clk;
   initial
      begin
      $monitor("clk=%d,reset=%d,clk_0=%d,clk_90=%d,clk_180=%d,clk_270=%d",clk,reset,clk_0,clk_90,clk_180,clk_270);
      #180;
      $finish;
      end		
endmodule

