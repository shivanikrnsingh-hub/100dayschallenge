`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   07:18:17 01/26/2026
// Design Name:   vedic_multiplier_2x1
// Module Name:   /home/ise/verilog_projects/Challenge_100days/vedic_Multipier_tb.v
// Project Name:  Challenge_100days
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: vedic_multiplier_2x1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module vedic_Multipier_tb;

	// Inputs
	reg [1:0] A;
	reg [1:0] B;

	// Outputs
	wire [3:0] M;

	// Instantiate the Unit Under Test (UUT)
	vedic_multiplier_2x1 uut (
		.A(A), 
		.B(B), 
		.M(M)
	);

	initial begin
		// Initialize Inputs
		A = 2'b10;
		B = 2'b00;
		#10;
      A = 2'b11;
		B = 2'b11;
	   #10;

		A = 2'b01;
		B = 2'b11;
		#10;

		A = 2'b11;
		B = 2'b01;
		#10;
		
		A = 2'b10;
		B = 2'b10;	
		#10;
		
	end
	initial begin
	$monitor("A :%d,B :%d,M :%d",A,B,M);
   #60;
   $finish;	
	end
endmodule

