`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:51:38 02/28/2026
// Design Name:   palindrome_sequence_check
// Module Name:   /home/ise/verilog_projects/challenge100days2/palindrome_check_tb.v
// Project Name:  challenge100days2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: palindrome_sequence_check
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module palindrome_check_tb;

	// Inputs
	reg [15:0] num_in;

	// Outputs
	wire palindrome;

	// Instantiate the Unit Under Test (UUT)
	palindrome_sequence_check uut (
		.num_in(num_in), 
		.palindrome(palindrome)
	);

	initial begin

		num_in =0 ;

		#10;
		num_in=16'b1010101101010101;
		$display("num_in:%b,result:%s",num_in,(palindrome)?"is palindrome":"is not palindrome");
		
		#10;
		num_in=16'b1010101001010101;
		$display("num_in:%b,result:%s",num_in,(palindrome)?"is palindrome":"is not palindrome");

      #10;
		$finish;
	end
      
endmodule

