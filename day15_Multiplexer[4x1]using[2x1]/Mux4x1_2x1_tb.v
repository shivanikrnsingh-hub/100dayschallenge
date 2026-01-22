`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:37:07 01/09/2026
// Design Name:   Mux4x1__2x1
// Module Name:   /home/ise/verilog_projects/Challenge_100days/Mux4x1_2x1_tb.v
// Project Name:  Challenge_100days
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Mux4x1__2x1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Mux4x1_2x1_tb;

	// Inputs
	reg a;
	reg b;
	reg c;
	reg d;
	reg [1:0] sel;

	// Outputs
	wire out;

	// Instantiate the Unit Under Test (UUT)
	Mux4x1__2x1 uut (
		.a(a), 
		.b(b), 
		.c(c), 
		.d(d), 
		.sel(sel), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		c = 0;
		d = 0;
		sel = 0;

		// Wait 100 ns for global reset to finish
		#10;
		end
		always
		 begin 
		 a=$random;
		 b=$random;
		 c=$random;
		 b=$random;
		 sel=$random;
		 #10;
		 end
		 initial begin
		 $monitor("a:%b,b:%b,c:%b,d:%b,sel:%b,out:%b;",a,b,c,d,sel,out);
		 #70;
		 $finish;
		 end

        
		// Add stimulus here

	
      
endmodule

