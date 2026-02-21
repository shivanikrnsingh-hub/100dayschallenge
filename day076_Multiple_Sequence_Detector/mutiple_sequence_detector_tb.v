`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:00:58 02/21/2026
// Design Name:   Multiple_sequence_detector
// Module Name:   /home/ise/verilog_projects/challenge100days2/mutiple_sequence_detector_tb.v
// Project Name:  challenge100days2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Multiple_sequence_detector
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mutiple_sequence_detector_tb;

	// Inputs
	reg clk;
	reg reset;
	reg din;

	// Outputs
	wire out;

	// Instantiate the Unit Under Test (UUT)
	Multiple_sequence_detector uut (
		.clk(clk), 
		.reset(reset), 
		.din(din), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		din = 0;

		// Wait 100 ns for global reset to finish
		#10;
      reset = 0;  
		// Add stimulus here

	end
    initial forever #5 clk=~clk;
   initial
	 begin
	@(negedge clk) din=1;
	@(negedge clk) din=1;
	@(negedge clk) din=0;
	@(negedge clk) din=0;
	@(negedge clk) din=1;
	//--------sequence detected----------------
	
	
	@(negedge clk) din=0;
	@(negedge clk) din=1;
	@(negedge clk) din=0;
	
	//overlapp 
	@(negedge clk) din=1;
	@(negedge clk) din=0;
	@(negedge clk) din=0;
	@(negedge clk) din=1;
	@(negedge clk) din=1;
	 end
	
  initial
    begin
    $monitor("din=%b,out=%b",din,out);
	 #200;
	 $finish;
    end	
endmodule
	  


