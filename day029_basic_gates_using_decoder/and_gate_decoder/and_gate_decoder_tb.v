`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:31:24 01/13/2026
// Design Name:   and_gate_decoder
// Module Name:   /home/ise/verilog_projects/Challenge_100days/and_gate_decoder_tb.v
// Project Name:  Challenge_100days
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: and_gate_decoder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module and_gate_decoder_tb;

	// Inputs
	reg a;
	reg b;

	// Outputs
	wire and_o;

	// Instantiate the Unit Under Test (UUT)
	and_gate_decoder uut (
		.a(a), 
		.b(b), 
		.and_o(and_o)
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
		b = 0;
#10;

		a = 0;
		b = 1;
#10;

		a = 1;
		b = 1;
  	a = 0;
		b = 0;
#10;
		a = 1;
		b = 0;

#10;
		a = 0;
		b = 0;
#10;

		a = 0;
		b = 1;
#10;

		a = 1;
		b = 1;

$monitor("a=%b,b=%b,and out =%b",a,b,and_o);
		#100;
        $finish;
		// Add stimulus here

	end
      
endmodule

