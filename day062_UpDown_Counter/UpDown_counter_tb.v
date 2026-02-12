`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:56:57 02/12/2026
// Design Name:   UpDown_Counter
// Module Name:   /home/ise/verilog_projects/challenge100days2/UpDown_counter_tb.v
// Project Name:  challenge100days2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: UpDown_Counter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module UpDown_counter_tb;

	// Inputs
	reg clk;
	reg reset;
	reg mode;

	// Outputs
	wire [3:0] counter;

	// Instantiate the Unit Under Test (UUT)
	UpDown_Counter uut (
		.clk(clk), 
		.reset(reset), 
		.mode(mode), 
		.counter(counter)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		mode = 0;
		#10;
     reset = 0;   
		#100;
		mode=1;

	end
   initial begin
   forever #5 clk=~clk;
    end
   initial
     begin
     $monitor("clk=%d,reset=%d,mode=%d,counter=%d",clk,reset,mode,counter);
     #200;
     $finish;
     end
	  
endmodule

