`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:52:32 01/12/2026
// Design Name:   decoder_2x4
// Module Name:   /home/ise/verilog_projects/Challenge_100days/decoder_2x4_tb.v
// Project Name:  Challenge_100days
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: decoder_2x4
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module decoder_2x4_tb;

	// Inputs
	reg [1:0] in;

	// Outputs
	wire [3:0] out;

	// Instantiate the Unit Under Test (UUT)
	decoder_2x4 uut (
		.in(in), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		in = 2'b00;
		#10;
		in = 2'b11;
		#10;
		in = 2'b01;
		#10;
		in = 2'b00;
		#10;
		in = 2'b10;
      #10;
		$monitor("in=%b,out=%b",in,out);
		#70;
		$finish;

		// Wait 100 ns for global reset to finish
		
        
		// Add stimulus here

	end
      
endmodule

