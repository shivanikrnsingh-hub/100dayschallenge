`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   06:44:06 01/08/2026
// Design Name:   bit4_parallel_adder
// Module Name:   /home/ise/verilog_projects/Challenge_100days/parrell_adder_tb.v
// Project Name:  Challenge_100days
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: bit4_parallel_adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module parrell_adder_tb;

	// Inputs
	reg [3:0] a;
	reg [3:0] b;
	reg cin;

	// Outputs
	wire [3:0] sum;
	wire carry;

	// Instantiate the Unit Under Test (UUT)
	bit4_parallel_adder uut (
		.a(a), 
		.b(b), 
		.cin(cin), 
		.sum(sum), 
		.carry(carry)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		cin = 0;

		// Wait 100 ns for global reset to finish
		#10;
        
		// Add stimulus here

	end
	always begin
	a=$random;
	b=$random;
	cin=$random;
	#10;
	end
	
	initial begin 
	$monitor("a:%b,b:%b,cin:%b,sum:%b,carry:%b",a,b,cin,sum,carry);
	end

      
endmodule

