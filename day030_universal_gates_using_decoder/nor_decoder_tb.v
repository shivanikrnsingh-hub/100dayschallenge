`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   06:25:25 01/16/2026
// Design Name:   nor_decoder
// Module Name:   /home/ise/verilog_projects/Challenge_100days/nor_decoder_tb.v
// Project Name:  Challenge_100days
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: nor_decoder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module nor_decoder_tb;

	// Inputs
	reg a;
	reg b;

	// Outputs
	wire nor_o;

	// Instantiate the Unit Under Test (UUT)
	nor_decoder uut (
		.a(a), 
		.b(b), 
		.nor_o(nor_o)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		#10;
      a=0;
      b=1;
      #10;
      a=1;
      b=0;
      #10;		
      a=1;
      b=1;
      #10;		
		
	end
	initial 
	  begin
	  $monitor("a=%b,b=%b,nor_o=%b",a,b,nor_o);
	  #70;
	  $finish;
	  end
      
endmodule

