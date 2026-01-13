`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:02:47 01/13/2026
// Design Name:   or_g_decoder
// Module Name:   /home/ise/verilog_projects/Challenge_100days/or_g_decoder_tb.v
// Project Name:  Challenge_100days
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: or_g_decoder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module or_g_decoder_tb;

	// Inputs
	reg a;
	reg b;

	// Outputs
	wire or_o;

	// Instantiate the Unit Under Test (UUT)
	or_g_decoder uut (
		.a(a), 
		.b(b), 
		.or_o(or_o)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
#10;
		a = 1;
		b = 0;

#10;
		a = 0;
		b = 0;
#10;

		a = 0;
		b = 1;
#10;

		a = 1;
		b = 1;
  	a = 0;
		b = 0;
#10;
		a = 1;
		b = 0;

#10;
		a = 0;
		b = 0;
#10;

		a = 0;
		b = 1;
#10;

		a = 1;
		b = 1;

$monitor("a=%b,b=%b,and out =%b",a,b,or_o);
		#100;
        $finish;
		// Add stimulus here

	end
      
endmodule

