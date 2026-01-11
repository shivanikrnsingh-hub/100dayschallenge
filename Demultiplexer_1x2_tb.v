`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:07:17 01/10/2026
// Design Name:   Demultiplexer_2x1
// Module Name:   /home/ise/verilog_projects/Challenge_100days/Demultiplexer_1x2_tb.v
// Project Name:  Challenge_100days
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Demultiplexer_2x1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Demultiplexer_1x2_tb;

	// Inputs
	reg I;
	reg sel;

	// Outputs
	wire y0;
	wire y1;

	// Instantiate the Unit Under Test (UUT)
	Demultiplexer_2x1 uut (
		.I(I), 
		.sel(sel), 
		.y0(y0), 
		.y1(y1)
	);
   always
	 begin
	 I=$random;
	 sel=$random;
	 #10;
	 end
	initial begin
		// Initialize Inputs
	$monitor("I=%b,sel=%b,y0=%b,y1=%b",I,sel,y0,y1);
	#70;
	$finish;

	end
      
endmodule

