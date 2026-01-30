`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:02:12 01/06/2026
// Design Name:   Gate_level
// Module Name:   /home/ise/verilog_projects/Challenge_100days/gate_tb.v
// Project Name:  Challenge_100days
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Gate_level
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module gate_tb;

	// Inputs
	reg a;
	reg b;

	// Outputs
	wire and_o;
	wire nand_o;
	wire or_o;
	wire nor_o;
	wire not_o;
	wire xor_o;
	wire xnor_o;

	// Instantiate the Unit Under Test (UUT)
	Gate_level uut (
		.a(a), 
		.b(b), 
		.and_o(and_o), 
		.nand_o(nand_o), 
		.or_o(or_o), 
		.nor_o(nor_o), 
		.not_o(not_o), 
		.xor_o(xor_o), 
		.xnor_o(xnor_o)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
#100;
		a=1;b=0;
		#100;
		a=0;b=1;
		#100;
		a=1;b=1;
		#100;
		a=1;b=0;
		#100;
		a=0;b=1;
		#100;
		a=1;b=1;
		
	end
      
endmodule

