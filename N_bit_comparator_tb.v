`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   08:43:06 01/09/2026
// Design Name:   N_bit_comparator
// Module Name:   /home/ise/verilog_projects/Challenge_100days/N_bit_comparator_tb.v
// Project Name:  Challenge_100days
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: N_bit_comparator
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module N_bit_comparator_tb;

	// Inputs
	reg [8:0] a;
	reg [8:0] b;

	// Outputs
	wire lesser;
	wire greater;
	wire equal;

	// Instantiate the Unit Under Test (UUT)
	N_bit_comparator uut (
		.a(a), 
		.b(b), 
		.lesser(lesser), 
		.greater(greater), 
		.equal(equal)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	always
	begin
	a=$random;
	b=$random;
	#10;
	end
	initial begin
	$monitor("a:%d,b:%d,lesser:%d,greater:%d,equal:%d",a,b,lesser,greater,equal);
	#70;
	$finish;
	end
      
endmodule

