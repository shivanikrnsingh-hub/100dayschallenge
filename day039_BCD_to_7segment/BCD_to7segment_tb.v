`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   07:10:22 01/18/2026
// Design Name:   BCD_to_7_segment
// Module Name:   /home/ise/verilog_projects/Challenge_100days/BCD_to7segment_tb.v
// Project Name:  Challenge_100days
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: BCD_to_7_segment
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module BCD_to7segment_tb;

	// Inputs
	reg [3:0] BCD;

	// Outputs
	wire [6:0] segment7;

	// Instantiate the Unit Under Test (UUT)
	BCD_to_7_segment uut (
		.BCD(BCD), 
		.segment7(segment7)
	);

    always
	  begin
	  BCD=4'd0;
	  #10;
	  BCD=4'd1;
	  #10;
	  BCD=4'd2;
	  #10;
	  BCD=4'd3;
	  #10;
	  BCD=4'd4;
	  #10;
	  BCD=4'd5;
	  #10;
	  BCD=4'd6;
	  #10;
	  BCD=4'd7;
	  #10;
	  BCD=4'd8;
	  #10;
	  BCD=4'd9;
	  #10;
	  end


	initial begin
	$monitor("BCD in:%d,segment7 out:%h",BCD,segment7);
	#100;
	$finish;

	end
      
endmodule

