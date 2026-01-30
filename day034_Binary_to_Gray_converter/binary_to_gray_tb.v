`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:27:54 01/16/2026
// Design Name:   Binary_to_Gray
// Module Name:   /home/ise/verilog_projects/Challenge_100days/binary_to_gray_tb.v
// Project Name:  Challenge_100days
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Binary_to_Gray
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module binary_to_gray_tb;

	// Inputs
	reg [3:0] in_binary;

	// Outputs
	wire [3:0] out_gray;

	// Instantiate the Unit Under Test (UUT)
	Binary_to_Gray uut (
		.in_binary(in_binary), 
		.out_gray(out_gray)
	);

	initial begin
		// Initialize Inputs
		in_binary = 4'b0000;
		#10;
		in_binary = 4'b1010;
		#10;
		in_binary = 4'b0110;
		#10;
		in_binary = 4'b1000;
		#10;
		in_binary = 4'b0011;
		#10;
   
	end
   initial begin

   $monitor("binary in =%b,Gray out =%b",in_binary,out_gray);
   #60;
   $finish;
   end   
endmodule

