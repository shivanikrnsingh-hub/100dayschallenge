`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:04:18 01/16/2026
// Design Name:   n_bit_square
// Module Name:   /home/ise/verilog_projects/Challenge_100days/n_bit_square_tb.v
// Project Name:  Challenge_100days
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: n_bit_square
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module n_bit_square_tb;

	// Inputs
	reg [7:0] num;

	// Outputs
	wire [15:0] result;

	// Instantiate the Unit Under Test (UUT)
	n_bit_square uut (
		.num(num), 
		.result(result)
	);

   initial begin
	num=0;
	end
	
	always
	  begin 
	  num=num+2;
	  #10;
	  end
	
	initial begin
	  $monitor("num=%d,result=%d",num,result);
	  #60;
	  $finish;
	  end
      
endmodule

