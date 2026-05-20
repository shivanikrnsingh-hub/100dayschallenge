`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:27:21 04/24/2026
// Design Name:   NCO
// Module Name:   /home/ise/verilog_projects/challenge100days2/NCO_tb.v
// Project Name:  challenge100days2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: NCO
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module NCO_tb;

	// Inputs
	reg [31:0] controll_word;
	reg reset_n;
	reg clk;

	// Outputs
	wire clk_out;


	NCO uut (
		.controll_word(controll_word), 
		.reset_n(reset_n), 
		.clk(clk), 
		.clk_out(clk_out)
	);

    always #5 clk=~clk;

	initial 
	 begin
		controll_word = 0;
		reset_n = 0;
		clk = 0;
		#10;		
		reset_n =1;
	   controll_word = 32'h80000000;
		#40;
		$monitor("clk_out : %b",clk_out);
      #10;
      $finish;
	 end
      
endmodule

