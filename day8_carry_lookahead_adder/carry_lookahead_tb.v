`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:42:56 01/08/2026
// Design Name:   carrylookahead_adder
// Module Name:   /home/ise/verilog_projects/Challenge_100days/carry_lookahead_tb.v
// Project Name:  Challenge_100days
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: carrylookahead_adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module carry_lookahead_tb;

	// Inputs
	reg [3:0] a;
	reg [3:0] b;
	reg cin;

	// Outputs
	wire cout;
	wire [3:0] sum;

	// Instantiate the Unit Under Test (UUT)
	carrylookahead_adder uut (
		.a(a), 
		.b(b), 
		.cin(cin), 
		.cout(cout), 
		.sum(sum)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		cin = 0;

		// Wait 100 ns for global reset to finish
		#10;
        
		// Add stimulus here
		a=4'b0000;b=4'b0010;cin=1'b0;
		#10;
		a=4'b0010;b=4'b0110;cin=1'b1;
		#10;
		a=4'b1001;b=4'b1010;cin=1'b0;
		#10;
		a=4'b0110;b=4'b0110;cin=1'b1;
		#10;

	end
      initial begin
		$monitor("a:%b,b:%b,cin:%b,sum:%b,cout:%b",a,b,cin,sum,cout);
		#60 $finish ;
		end
endmodule

