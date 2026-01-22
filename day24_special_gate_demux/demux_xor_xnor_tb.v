`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   08:10:49 01/12/2026
// Design Name:   demu_xor_xnor
// Module Name:   /home/ise/verilog_projects/Challenge_100days/demux_xor_xnor_tb.v
// Project Name:  Challenge_100days
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: demu_xor_xnor
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module demux_xor_xnor_tb;

	// Inputs
	reg a;
	reg b;

	// Outputs
	wire xor_o;
	wire xnor_o;

	// Instantiate the Unit Under Test (UUT)
	demu_xor_xnor uut (
		.a(a), 
		.b(b), 
		.xor_o(xor_o), 
		.xnor_o(xnor_o)
	);

	initial begin
      a=1;
		b=1;
		#10;
	   a=1;
		b=0;
		#10;
		a=0;
		b=0;
		#10;
		a=0;
		b=1;
		#10;
		a=0;
		b=1;
		#10;
		a=0;
		b=0;
		#10;
		a=1;
		b=0;
		#10;
		end
     
	initial begin
		// Initialize Inputs
		$monitor("a=%b,b=%b,xor_o=%b,xnor_o=%b",a,b,xor_o,xnor_o);
		#70;
		$finish;
end
      
endmodule

