`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:46:56 01/16/2026
// Design Name:   gary_to_binary
// Module Name:   /home/ise/verilog_projects/Challenge_100days/gray_to_binary.v
// Project Name:  Challenge_100days
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: gary_to_binary
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module gray_to_binary_tb;

	// Inputs
	reg [3:0] in_gray;

	// Outputs
	wire [3:0] out_binary;

	// Instantiate the Unit Under Test (UUT)
	gray_to_binary uut (
		.in_gray(in_gray), 
		.out_binary(out_binary)
	);

	initial begin
		// Initialize Inputs
		in_gray = 4'b0000;
		#10;
		in_gray = 4'b1010;
		#10;
		in_gray = 4'b0110;
		#10;
		in_gray = 4'b1110;
		#10;
		in_gray = 4'b0111;
		#10;
		in_gray = 4'b1100;
		#10;
		in_gray = 4'b1101;


	end
	
	initial begin
	 $monitor("in_gray = %b,out_binary =%b",in_gray,out_binary);
	 #70;
	 $finish;
      end
endmodule

