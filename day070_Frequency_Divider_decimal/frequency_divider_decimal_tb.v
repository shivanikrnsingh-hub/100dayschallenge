`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:29:45 02/13/2026
// Design Name:   frequency_divider_decimal
// Module Name:   /home/ise/verilog_projects/challenge100days2/frequency_divider_decimal_tb.v
// Project Name:  challenge100days2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: frequency_divider_decimal
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module frequency_divider_decimal_tb;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire clk_7by2;

	// Instantiate the Unit Under Test (UUT)
	frequency_divider_decimal uut (
		.clk(clk), 
		.reset(reset), 
		.clk_7by2(clk_7by2)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;

		// Wait 100 ns for global reset to finish
		#10;
		reset=0;
		
        
		// Add stimulus here

	end
      
	initial
    forever #5 clk=~clk;

   initial 
      begin
       $monitor("clk=%d,reset=%d,clk_7by2=%d",clk,reset,clk_7by2);
       #200;
       $finish;
      end		 
endmodule

