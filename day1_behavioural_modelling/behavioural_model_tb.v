`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:23:38 01/06/2026
// Design Name:   behavioural_model
// Module Name:   /home/ise/verilog_projects/Challenge_100days/behavioural_model_tb.v
// Project Name:  Challenge_100days
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: behavioural_model
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module behavioural_model_tb;

	// Inputs
	reg a;
	reg b;

	// Outputs
	wire and_out;
	wire or_out;
	wire nor_out;
	wire not_out;
	wire nand_out;
	wire xnor_out;
	wire xor_out;

	// Instantiate the Unit Under Test (UUT)
	behavioural_model uut (
		.a(a), 
		.b(b), 
		.and_out(and_out), 
		.or_out(or_out), 
		.nor_out(nor_out), 
		.not_out(not_out), 
		.nand_out(nand_out), 
		.xnor_out(xnor_out), 
		.xor_out(xor_out)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;

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
		
        
		// Add stimulus here

	end
      
endmodule

