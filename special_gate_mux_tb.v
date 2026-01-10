`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:42:23 01/09/2026
// Design Name:   special_gate_mux
// Module Name:   /home/ise/verilog_projects/Challenge_100days/special_gate_mux_tb.v
// Project Name:  Challenge_100days
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: special_gate_mux
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module special_gate_mux_tb;

	// Inputs
	reg a;
	reg b;

	// Outputs
	wire xor_out;
	wire xnor_out;
	

	// Instantiate the Unit Under Test (UUT)
	special_gate_mux uut (
		.a(a), 
		.b(b), 
		.xor_out(xor_out), 
		.xnor_out(xnor_out)
	);

	always begin
	a=$random%2;
	b=$random%2;
	#10;
	end
	initial begin
	#70;
	$finish;
	end
      
	initial begin

   $monitor("a:%b,b:%b,xor_out=%b,xnor_out=%b",a,b,xor_out,xnor_out);
   end	
endmodule

