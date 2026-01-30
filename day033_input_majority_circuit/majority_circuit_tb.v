`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:05:19 01/16/2026
// Design Name:   majority_circuit
// Module Name:   /home/ise/verilog_projects/Challenge_100days/majority_circuit_tb.v
// Project Name:  Challenge_100days
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: majority_circuit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module majority_circuit_tb;

	// Inputs
	reg [6:0] in;

	// Outputs
	wire out;

	// Instantiate the Unit Under Test (UUT)
	majority_circuit uut (
		.in(in), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		in = 7'b01001101;
		#10;
		in = 7'b01001101;
		#10;
		in = 7'b01011101;
		#10;
		in = 7'b01001001;
		#10;
		in = 7'b01000001;
		#10;
		in = 7'b01111101;
		#10;
		in = 7'b01001111;
		#10;
		in = 7'b01011101;
		#10;
		in = 7'b01001101;
		#10;
		in = 7'b11111101;
		#10;
        
	end
      
		
	initial begin

$monitor("in = %b,out = %b" ,in,out);
#100	;
$finish;
end
endmodule

