`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:05:41 01/12/2026
// Design Name:   Decoder_8x3
// Module Name:   /home/ise/verilog_projects/Challenge_100days/decoder3x8_tb.v
// Project Name:  Challenge_100days
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Decoder_8x3
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module decoder3x8_tb;

	// Inputs
	reg [2:0] in;

	// Outputs
	wire [7:0] out;

	// Instantiate the Unit Under Test (UUT)
	Decoder_8x3 uut (
		.in(in), 
		.out(out)
	);

	
	  initial begin
	   in=3'b000;
		#10;
		in=3'b010;
      #10;
	   in=3'b001;
		#10;
	   in=3'b101;
		#10;
	   in=3'b000;
		#10;
	   in=3'b010;
      #10;
	   in=3'b011;
		#10;
	   in=3'b100;
		#10;
	   in=3'b000;
		#10;
	   in=3'b110;
		// Initialize Inputs
		$monitor("in=%b,out=%b",in,out);
		#100;
		$finish;

	end
      
endmodule

