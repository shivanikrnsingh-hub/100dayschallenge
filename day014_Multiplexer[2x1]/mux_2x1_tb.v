`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:16:47 01/09/2026
// Design Name:   mux_2x1
// Module Name:   /home/ise/verilog_projects/Challenge_100days/Mux_2x1_tb.v
// Project Name:  Challenge_100days
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mux_2x1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Mux_2x1_tb;

	// Inputs
	reg a;
	reg b;
	reg sel;

	// Outputs
	wire out;

	// Instantiate the Unit Under Test (UUT)
	mux_2x1 uut (
		.a(a), 
		.b(b), 
		.sel(sel), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		sel = 0;

		// Wait 100 ns for global reset to finish
		#10;
		end
        always
		  begin
		  a=$random;
		  b=$random;
		  sel=$random;
		  #10;
		  end
		  initial begin
		  #70;
		  $finish;
		  end
		//Add stimulus here	end
      
endmodule

