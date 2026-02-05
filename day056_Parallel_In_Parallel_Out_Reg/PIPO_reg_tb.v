`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   06:27:23 02/05/2026
// Design Name:   PIPO_reg
// Module Name:   /home/ise/verilog_projects/challenge100days2/PIPO_reg_out.v
// Project Name:  challenge100days2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PIPO_reg
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module PIPO_reg_tb;

	// Inputs
	reg clk;
	reg reset;
	reg [2:0] parallel_in;

	// Outputs
	wire [2:0] parallel_out;

	// Instantiate the Unit Under Test (UUT)
	PIPO_reg uut (
		.clk(clk), 
		.reset(reset), 
		.parallel_in(parallel_in), 
		.parallel_out(parallel_out)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		parallel_in = 3'b000;

		// Wait 100 ns for global reset to finish
		#10;
        
		reset=0;

	end
	initial
	 begin
	forever #5 clk=~clk;
	end
	
	always
	  begin
    parallel_in=$random;	
	 #10;
	 end
	 initial
	 
	  begin
	  $monitor("clk=%d,parallel_in=%d,parallel_out=%d",clk,parallel_in,parallel_out);
	  #180;
	  $finish;
	  end
	  
endmodule

