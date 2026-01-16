`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   06:45:36 01/16/2026
// Design Name:   xor_decoder
// Module Name:   /home/ise/verilog_projects/Challenge_100days/xor_xnor_tb.v
// Project Name:  Challenge_100days
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: xor_decoder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module xor_xnor_tb;

	// Inputs
	reg a;
	reg b;

	// Outputs
	wire xor_o;
	wire xnor_o;

	// Instantiate the Unit Under Test (UUT)
	xor_decoder uut (
		.a(a), 
		.b(b), 
		.xor_o(xor_o), 
		.xnor_o(xnor_o)
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
		b = 1;
		#10;
		a = 1;
		b = 1;

	
        
		// Add stimulus here

	end
	
	initial begin 
	 $monitor("a=%b,b=%b,xor_o=%b,xnor  out = %b",a,b,xor_o,xnor_o);
	 #60;
	 $finish;
      end
endmodule

