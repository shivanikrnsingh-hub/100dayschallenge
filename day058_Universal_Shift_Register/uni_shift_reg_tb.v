`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:41:27 02/08/2026
// Design Name:   universal_shift_reg
// Module Name:   /home/ise/verilog_projects/challenge100days2/uni_shift_reg_tb.v
// Project Name:  challenge100days2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: universal_shift_reg
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module uni_shift_reg_tb;

	// Inputs
	reg clk;
	reg reset;
	reg shift_left;
	reg shift_right;
	reg [7:0] parallel_in;

	// Outputs
	wire [7:0] parallel_out;

	// Instantiate the Unit Under Test (UUT)
	universal_shift_reg uut (
		.clk(clk), 
		.reset(reset), 
		.shift_left(shift_left), 
		.shift_right(shift_right), 
		.parallel_in(parallel_in), 
		.parallel_out(parallel_out)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		shift_left = 0;
		shift_right = 0;
		parallel_in = 8'h45;

		// Wait 100 ns for global reset to finish
		#10;
      reset = 0;  
		// Add stimulus here

	end
   
   always
      begin 
       #5 clk=~clk;
      end
   
   initial 
       begin
		 #20;
		 shift_left = 1;
		 shift_right= 1;
		#10;
       shift_left = 1;
		 shift_right= 0;
		#10;
		 shift_left=0;
		 shift_right=1;
		 #10;
		 shift_left=1;
		 shift_right=0;
		 #10;
		 shift_left=0;
		 shift_right=1;
		 #10;
		 shift_left=1;
		 shift_right=0;
		 #10;
		 shift_left = 1;
		 shift_right= 1;
		#10;
		 
       		 
	 end
	 
	 initial begin
	 $monitor("clk=%d,reset=%d,shift_left=%d,shift_right=%d,parallel_in=%d,parallel_out=%d",clk,reset,shift_left,shift_right,parallel_in,parallel_out);
    #100;
    $finish;
	 end
	 
	 
endmodule

