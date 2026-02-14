`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:16:46 02/13/2026
// Design Name:   frequency_divider_odd
// Module Name:   /home/ise/verilog_projects/challenge100days2/frequency_divider_oddtb.v
// Project Name:  challenge100days2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: frequency_divider_odd
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module frequency_divider_oddtb;

	// Inputs
	reg reset;
	reg clk;

	// Outputs
	wire clk_by7;

	// Instantiate the Unit Under Test (UUT)
	frequency_divider_odd uut (
		.reset(reset), 
		.clk(clk), 
		.clk_by7(clk_by7)
	);

	initial begin
		// Initialize Inputs
		reset = 1;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#10;
      reset = 0;  
		// Add stimulus here

	end
     initial 
      forever #5 clk=~clk;

   initial 
    begin
     $monitor("clk=%d,reset=%d,clk_by7=%d",clk,reset,clk_by7);
      #180;
     $finish;
    end	  
endmodule

