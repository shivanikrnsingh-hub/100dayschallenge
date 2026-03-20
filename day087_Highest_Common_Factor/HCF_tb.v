`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:26:13 03/19/2026
// Design Name:   HCF_check
// Module Name:   /home/ise/verilog_projects/challenge100days2/HCF_tb.v
// Project Name:  challenge100days2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: HCF_check
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module HCF_tb;

	// Inputs
	reg reset;
	reg clk;
	reg start;
	reg [7:0] in1;
	reg [7:0] in2;

	// Outputs
	wire [7:0] HCF;
	wire done;

	// Instantiate the Unit Under Test (UUT)
	HCF_check uut (
		.reset(reset), 
		.clk(clk), 
		.start(start), 
		.in1(in1), 
		.in2(in2), 
		.HCF(HCF), 
		.done(done)
	);

	initial begin
	
		reset = 1;
		clk = 0;
		start = 0;
		in1 = 0;
		in2 = 0;
      #10;
		reset=0;
      
	end
      
		
	always #5 clk=~clk;
	
		initial begin
		@(posedge clk)
		#10;
		
		in1=8'd20;in2=8'd25;
		start=1;
	   @(posedge clk)
		start=0;
		wait(done);
		$display("hcf=%d | a=%d,b=%d",HCF,in1,in2);
		#10;
		repeat(2)@(posedge clk)
		in1=8'd30;in2=8'd60;
		start=1;
		@(posedge clk)
      start=0;
		@(posedge clk)
		wait(done);
		$display("hcf=%d | a=%d,b=%d",HCF,in1,in2);
		#50;
		$finish;
		end
endmodule

