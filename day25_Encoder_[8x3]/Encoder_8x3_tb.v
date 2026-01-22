`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:41:52 01/12/2026
// Design Name:   Encoder8x3
// Module Name:   /home/ise/verilog_projects/Challenge_100days/Encoder_8x1_tb.v
// Project Name:  Challenge_100days
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Encoder8x3
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Encoder_8x3_tb;

	// Inputs
	reg [7:0] in;

	// Outputs
	wire [2:0] out;

	// Instantiate the Unit Under Test (UUT)
	Encoder8x3 uut (
		.in(in), 
		.out(out)
	);
   
	  
	initial begin
	  in=8'b00000001;
	  #10;
	  in=8'b00000010;
	  	  #10;
	  in=8'b00000100;
	  	  #10;
	  in=8'b00001000;
	  	  #10;
	  in=8'b00010000;	 
	  #10;
	  in=8'b00100000;
	  	  #10;
	  in=8'b01000000;
	  	  #10;
	  in=8'b10000000;
     	  #10;

	
	
	
		$monitor("in=%d,out=%d",in,out);
		#70;
		$finish;
 
	end
      
endmodule

