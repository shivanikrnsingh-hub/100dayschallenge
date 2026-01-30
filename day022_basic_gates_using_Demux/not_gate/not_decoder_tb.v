`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   06:13:02 01/16/2026
// Design Name:   not_g_decoder
// Module Name:   /home/ise/verilog_projects/Challenge_100days/not_decoder_tb.v
// Project Name:  Challenge_100days
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: not_g_decoder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module not_decoder_tb;

	// Inputs
	reg a;

	// Outputs
	wire not_o;

	// Instantiate the Unit Under Test (UUT)
	not_g_decoder uut (
		.a(a), 
		.not_o(not_o)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		#10;
		a=1;
		#10
    	a = 0;
		#10;
		a=1;
		#10
		$monitor("a=%b,not_o output=%b",a,not_o);
		#50;
      $finish;
		// Add stimulus here

	end
      
endmodule

