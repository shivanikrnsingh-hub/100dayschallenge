`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:41:05 01/08/2026
// Design Name:   bit_4_multiplier
// Module Name:   /home/ise/verilog_projects/Challenge_100days/bit4_multiplier_tb.v
// Project Name:  Challenge_100days
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: bit_4_multiplier
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module bit4_multiplier_tb;

	// Inputs
	reg [3:0] a;
	reg [3:0] b;

	// Outputs
	wire [7:0] out;

	// Instantiate the Unit Under Test (UUT)
	bit_4_multiplier uut (
		.a(a), 
		.b(b), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;

		// Wait 100 ns for global reset to finish
		#10;
		a=4'b1001;b=4'b0110;
		#10;
		a=4'b0110;b=4'b0110;
		#10;
		a=4'b1001;b=4'b1010;
		#10;
		a=4'b0110;b=4'b1001;
		#10;

	end
      initial begin
		$monitor("a:%d,b:%d,,out:%d",a,b,out);
		#60 $finish ;
		end  // Add stimulus here

endmodule

