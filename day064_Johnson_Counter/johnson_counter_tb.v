`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:05:06 02/12/2026
// Design Name:   johnson_counter
// Module Name:   /home/ise/verilog_projects/challenge100days2/johnson_counter_tb.v
// Project Name:  challenge100days2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: johnson_counter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module johnson_counter_tb;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire [3:0] counter;

	// Instantiate the Unit Under Test (UUT)
	johnson_counter uut (
		.clk(clk), 
		.reset(reset), 
		.counter(counter)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;

		// Wait 100 ns for global reset to finish
		#10;
      reset = 0;  
		// Add stimulus here

	end
	initial
	 begin 
	 forever #5 clk=~clk;
	 end
	 
	 initial 
	   begin
		$monitor("clk=%d,reset=%d,counter=%d",clk,reset,counter);
		#100;
		$finish;
		end
      
endmodule

