`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:25:17 01/08/2026
// Design Name:   bit4_divider
// Module Name:   /home/ise/verilog_projects/Challenge_100days/divider_tb.v
// Project Name:  Challenge_100days
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: bit4_divider
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module divider_tb;

	// Inputs
	reg [3:0] divident;
	reg [3:0] divisor;

	// Outputs
	wire [3:0] q;
	wire [3:0] r;

	// Instantiate the Unit Under Test (UUT)
	bit4_divider uut (
		.divident(divident), 
		.divisor(divisor), 
		.q(q), 
		.r(r)
	);

	initial begin
		// Initialize Inputs
		divident = 0;
		divisor = 1;
		// Wait 100 ns for global reset to finish
		#10;
        
		// Add stimulus here

	end
	always begin
	divisor=$random%16;
	divident=$random%16;
	#10;
	end
	initial begin
	$monitor("divident:%d|  ,divisor:%d|  ,q:%d,r:%d",divident,divisor,q,r);
	#70;
	$finish;
	end
	
      
endmodule

