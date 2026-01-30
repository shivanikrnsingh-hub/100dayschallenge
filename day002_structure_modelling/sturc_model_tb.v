`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:41:32 01/06/2026
// Design Name:   strutural_modellinng
// Module Name:   /home/ise/verilog_projects/Challenge_100days/sturc_model_tb.v
// Project Name:  Challenge_100days
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: strutural_modellinng
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module sturc_model_tb;

	// Inputs
	reg a;
	reg b;

	// Outputs
	wire and_g;
	wire or_g;
	wire nand_g;
	wire not_g;
	wire nor_g;
	wire xor_g;
	wire xnor_g;

	// Instantiate the Unit Under Test (UUT)
	strutural_modellinng uut (
		.a(a), 
		.b(b), 
		.and_g(and_g), 
		.or_g(or_g), 
		.nand_g(nand_g), 
		.not_g(not_g), 
		.nor_g(nor_g), 
		.xor_g(xor_g), 
		.xnor_g(xnor_g)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
	// Wait 100 ns for global reset to finish
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

