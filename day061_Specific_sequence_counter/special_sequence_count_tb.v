`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:00:16 02/12/2026
// Design Name:   special_sequence_counter
// Module Name:   /home/ise/verilog_projects/challenge100days2/special_sequence_count_tb.v
// Project Name:  challenge100days2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: special_sequence_counter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module special_sequence_count_tb;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire [3:0] counter;

	// Instantiate the Unit Under Test (UUT)
	special_sequence_counter uut (
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

