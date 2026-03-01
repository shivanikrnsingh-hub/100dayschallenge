`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:06:55 02/28/2026
// Design Name:   prime_no_check
// Module Name:   /home/ise/verilog_projects/challenge100days2/prime_check_tb.v
// Project Name:  challenge100days2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: prime_no_check
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module prime_check_tb;

	// Inputs
	reg clk;
	reg reset;
	reg start;
	reg [3:0] num;

	// Outputs
	wire prime;
	wire Done;

	// Instantiate the Unit Under Test (UUT)
	prime_no_check uut (
		.clk(clk), 
		.reset(reset), 
		.start(start), 
		.num(num), 
		.prime(prime), 
		.Done(Done)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		start = 0;
		num = 0;
      #10;
		reset=0;
		#20;
		
		num=4'b0010;start=1;
		@(posedge clk)
		start=0;
		
		wait(Done)
		$display("clk=%b,input:%d,result:%s",clk,num,(prime)?"prime":"not_prime");
		
		#20;
		num=4'b1011;start=1;
		@(posedge clk)
		start=0;
		
		wait(Done)
		$display("clk=%b,input:%d,result:%s",clk,num,(prime)?"prime":"not_prime");
		
		#20;
		num=4'b1001;start=1;
		@(posedge clk)
		start=0;
		
		wait(Done)
		$display("clk=%b,input:%d,result:%s",clk,num,(prime)?"prime":"not_prime");
		#100;
		$finish;

	 end
	
   always #5 clk=~clk;

    
	 
  
endmodule

