`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:59:09 02/13/2026
// Design Name:   frequency_divider_even
// Module Name:   /home/ise/verilog_projects/challenge100days2/frequency_divider_even_tb.v
// Project Name:  challenge100days2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: frequency_divider_even
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module frequency_divider_even_tb;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire clk_by4;

	// Instantiate the Unit Under Test (UUT)
	frequency_divider_even uut (
		.clk(clk), 
		.reset(reset), 
		.clk_by4(clk_by4)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;

		// Wait 100 ns for global reset to finish
		#10;
      reset = 0;
      

	end
	
	initial 
     forever #5 clk=~clk;
	  
	initial 
     begin
      $monitor("clk=%d,reset=%d,clk_by4=%d",clk,reset,clk_by4);
      #100;
      $finish;
     end		
endmodule

