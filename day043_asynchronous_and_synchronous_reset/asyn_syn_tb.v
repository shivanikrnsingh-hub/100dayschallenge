`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   08:51:12 01/30/2026
// Design Name:   asynchronous_and_synchronous_reset
// Module Name:   /home/ise/verilog_projects/challenge100days2/asyn_syn_tb.v
// Project Name:  challenge100days2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: asynchronous_and_synchronous_reset
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module asyn_syn_tb;

	// Inputs
	reg clk;
	reg reset;
	reg in;

	// Outputs
	wire syn_out;
	wire asyn_out;

	// Instantiate the Unit Under Test (UUT)
	asynchronous_and_synchronous_reset uut (
		.clk(clk), 
		.reset(reset), 
		.in(in), 
		.syn_out(syn_out), 
		.asyn_out(asyn_out)
	);

initial begin
 clk=0;reset=0;in=1;
 end
 
 initial forever #130 clk=~clk;
 initial forever #400 reset=~reset;
 initial forever #450 in=~in;
 initial begin #6000 $stop;
	 end
endmodule

