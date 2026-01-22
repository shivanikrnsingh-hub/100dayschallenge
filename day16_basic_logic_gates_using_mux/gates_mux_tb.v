`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:56:25 01/09/2026
// Design Name:   basic_gate_mux
// Module Name:   /home/ise/verilog_projects/Challenge_100days/gates_mux_tb.v
// Project Name:  Challenge_100days
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: basic_gate_mux
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module gates_mux_tb;

	// Inputs
	reg a;
	reg b;

	// Outputs
	wire and_out;
	wire not_out;
	wire or_out;

	// Instantiate the Unit Under Test (UUT)
	basic_gate_mux uut (
		.a(a), 
		.b(b), 
		.and_out(and_out), 
		.not_out(not_out), 
		.or_out(or_out)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;

		// Wait 100 ns for global reset to finish
		#10;
	end
      always
		 begin
		  a=$random;
		  b=$random;
		  #10;
		  end
		  
	initial begin
	       $monitor("a:%b,b:%b,and a&b : %b,a|b: %b,b':%b",a,b,and_out,or_out,not_out);
			 #70;
			 $finish;
			 end
		  
endmodule

