`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:35:55 01/12/2026
// Design Name:   priority_encoder
// Module Name:   /home/ise/verilog_projects/Challenge_100days/priority_encoder_tb.v
// Project Name:  Challenge_100days
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: priority_encoder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module priority_encoder_tb;

	// Inputs
	reg [7:0] in;

	// Outputs
	wire [2:0] out;

	// Instantiate the Unit Under Test (UUT)
	priority_encoder uut (
		.in(in), 
		.out(out)
	);

	always 
	  begin
	   in=$random;
	
		#10;
		end
     
	initial begin
		// Initialize Inputs
		$monitor("in=%b,out=%b",in,out);
		#70;
		$finish;

	end
      
endmodule

