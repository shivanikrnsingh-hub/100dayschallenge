`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   06:52:29 01/12/2026
// Design Name:   nand_g_demux
// Module Name:   /home/ise/verilog_projects/Challenge_100days/nand_g_tb.v
// Project Name:  Challenge_100days
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: nand_g_demux
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module nand_g_tb;

	// Inputs
	reg a;
	reg b;

	// Outputs
	wire nand_o;

	// Instantiate the Unit Under Test (UUT)
	nand_g_demux uut (
		.a(a), 
		.b(b), 
		.nand_o(nand_o)
	);

	 always 
	  begin
	   a=$random%2;
		b=$random%2;
		#10;
		end
     
	initial begin
		// Initialize Inputs
		$monitor("a=%b,b=%b,nand_o=%b",a,b,nand_o);
		#70;
		$finish;

	end
endmodule

