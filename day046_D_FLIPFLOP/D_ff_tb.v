`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:25:25 01/31/2026
// Design Name:   D_flipflop
// Module Name:   /home/ise/verilog_projects/challenge100days2/D_ff_tb.v
// Project Name:  challenge100days2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: D_flipflop
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module D_ff_tb;

	// Inputs
	reg D;
	reg reset;
	reg clk;

	// Outputs
	wire Q;

	// Instantiate the Unit Under Test (UUT)
	D_flipflop uut (
		.D(D), 
		.reset(reset), 
		.clk(clk), 
		.Q(Q)
	);

	initial begin
		// Initialize Inputs
		D = 0;
		reset = 1;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#10;
		reset=0;
	end
	
	always
	 begin 
	  #5 clk=~clk;
	  
	  end
	  
	  always begin
	  
	  D=1;
	  #10;
	  D=0;
	  #10;
	  
	  end
	  
	  initial begin 
	   
		$monitor("D=%d,reset=%d,clk=%d,Q=%d",D,reset,clk,Q);
		#180;
		$finish;
		end
      
endmodule

