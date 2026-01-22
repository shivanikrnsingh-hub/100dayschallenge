`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:33:26 01/10/2026
// Design Name:   universal_gate_using_mux
// Module Name:   /home/ise/verilog_projects/Challenge_100days/universal_gate_tb.v
// Project Name:  Challenge_100days
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: universal_gate_using_mux
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module universal_gate_tb;

	// Inputs
	reg a;
	reg b;

	// Outputs
	wire nand_out;
	wire nor_out;

	// Instantiate the Unit Under Test (UUT)
	universal_gate_using_mux uut (
		.a(a), 
		.b(b), 
		.nand_out(nand_out), 
		.nor_out(nor_out)
	);
   always
	 begin
	 a=$random;
	 b=$random;
	 #10;
	 end
	initial begin
		// Initialize Inputs
	$monitor("a=%b,b=%b,nand_out=%b,nor_out=%b",a,b,nand_out,nor_out);
	#70;
	$finish;
		// Add stimulus here

	end
      
endmodule

