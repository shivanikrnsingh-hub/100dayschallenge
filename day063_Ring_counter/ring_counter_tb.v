`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:35:22 02/12/2026
// Design Name:   ring_counter
// Module Name:   /home/ise/verilog_projects/challenge100days2/ring_counter_tb.v
// Project Name:  challenge100days2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ring_counter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ring_counter_tb;

	// Inputs
	reg clk;
	reg reset;

	// Instantiate the Unit Under Test (UUT)
	wire [3:0] counter;
	ring_counter uut (
		.clk(clk), 
		.reset(reset),.counter(counter)
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
   initial begin
		// Initialize Inputs
		forever #5 clk = ~clk;
		
		// Add stimulus here

	end
	initial begin
		// Initialize Inputs
		$monitor("clk=%d,reset=%d,counter=%d",clk,reset,counter);
		#200;
		$finish;

	end
      
         
endmodule

