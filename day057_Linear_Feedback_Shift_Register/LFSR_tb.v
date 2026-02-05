`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:08:40 02/05/2026
// Design Name:   LFSR
// Module Name:   /home/ise/verilog_projects/challenge100days2/LFSR_tb.v
// Project Name:  challenge100days2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: LFSR
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module LFSR_tb;

	// Inputs
	reg reset;
	reg clk;

	// Outputs
	wire [7:0] LFSR_out;

	// Instantiate the Unit Under Test (UUT)
	LFSR uut (
		.reset(reset), 
		.clk(clk), 
		.LFSR_out(LFSR_out)
	);

	initial begin
		// Initialize Inputs
		reset = 1;
		clk = 0;
      #10;
		reset=0;

	end
	
	always
	 #5 clk=~clk;
	 
	 initial 
	    begin
		 $monitor("clk=%d,reset=%d,LFSR_out=%d",clk,reset,LFSR_out);
		 #180;
       $finish;
		 
		 end
		 
endmodule

