`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:19:58 03/07/2026
// Design Name:   Armstrong_no_check
// Module Name:   /home/ise/verilog_projects/challenge100days2/armstrong_no_chech_tb.v
// Project Name:  challenge100days2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Armstrong_no_check
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module armstrong_no_chech_tb;

	// Inputs
	reg [7:0] num_in;
	reg clk;
	reg reset;

	// Outputs
	wire armstrong_no;

	// Instantiate the Unit Under Test (UUT)
	Armstrong_no_check uut (
		.num_in(num_in), 
		.clk(clk), 
		.reset(reset), 
		.armstrong_no(armstrong_no)
	);

    always #5 clk=~clk;
	initial begin
		// Initialize Inputs
		num_in = 0;
		clk = 0;
		reset = 1;
		#10;
		reset = 0;
		
		
		@(negedge clk)
		num_in = 8'd153;
		repeat(6)@(posedge clk)
		$display("num_in=%d,| result=%s",num_in,(armstrong_no)?"yes":"no");
 		
		@(negedge clk)
		num_in=8'd220;
		repeat(6)@(posedge clk)
		$display("num_in=%d,| result=%s",num_in,(armstrong_no)?"yes":"no");
		
		@(negedge clk)
		num_in=8'd1;
		repeat(6)@(posedge clk)
		$display("num_in=%d,| result=%s",num_in,(armstrong_no)?"yes":"no");
		$finish;
		#50;
		

	end
      
endmodule

