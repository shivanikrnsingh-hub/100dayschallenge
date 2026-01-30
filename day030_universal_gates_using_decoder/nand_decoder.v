`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   05:52:38 01/16/2026
// Design Name:   nand_g_decoder
// Module Name:   /home/ise/verilog_projects/Challenge_100days/nand_decoder.v
// Project Name:  Challenge_100days
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: nand_g_decoder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module nand_decoder;

	// Inputs
	reg a;
	reg b;

	// Outputs
	wire nand_o;

	// Instantiate the Unit Under Test (UUT)
	nand_g_decoder uut (
		.a(a), 
		.b(b), 
		.nand_o(nand_o)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;

		#10;
		a=1;
		b=0;
		#10;
		a=0;
		b=1;
		#10;
		a=1;
		b=1;
		#10;
		$monitor("a=%b,b=%b,nand output=%b",a,b,nand_o);
		#70;
		$finish;

	end
      
endmodule

