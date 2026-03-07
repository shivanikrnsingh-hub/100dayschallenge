`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:57:04 03/07/2026
// Design Name:   factorial_no
// Module Name:   /home/ise/verilog_projects/challenge100days2/factorial_no_tb.v
// Project Name:  challenge100days2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: factorial_no
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module factorial_no_tb;

	// Inputs
	reg clk;
	reg reset;
	reg start;
	reg [3:0] num_in;

	// Outputs
	wire [31:0] result;
	wire done;
   integer n;
	// Instantiate the Unit Under Test (UUT)
	factorial_no uut (
		.clk(clk), 
		.reset(reset), 
		.start(start), 
		.num_in(num_in), 
		.result(result), 
		.done(done)
	);

 
   always #5 clk=~clk;
	always for(n=0;n<16;n=n+1) #10 num_in=n;
    
	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		start = 0;
		n=0;
		#10;
		start =1;
		reset=0;
		
		
		$monitor("factorial of no= %d:,result=%d",num_in,result);
		#200;
		$finish;
		
      end
endmodule

