`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:52:28 02/04/2026
// Design Name:   PISO_reg
// Module Name:   /home/ise/verilog_projects/challenge100days2/PISO_reg_tb.v
// Project Name:  challenge100days2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PISO_reg
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module PISO_reg_tb;

	// Inputs
	reg [2:0] parallel_in;
	reg clk;
	reg reset;
	reg load;

	// Outputs
	wire serial_out;

	// Instantiate the Unit Under Test (UUT)
	PISO_REG uut (
		.parallel_in(parallel_in), 
		.clk(clk), 
		.reset(reset), 
		.load(load), 
		.serial_out(serial_out)
	);

	initial begin
		// Initialize Inputs
		parallel_in = 0;
		clk = 0;
		reset = 0;
		load = 0;

		// Wait 10ns for global reset to finish
	end
	
	initial
	  begin
	   forever #5 clk=~clk;
	  end	
	
	initial 
	 begin 
	 reset=1;
	 load=0;
	 parallel_in=3'b101;
	 #20;
	 reset=0;
	 load=1;
	 #10;
	 load=0;
	 #30;
	 reset=1;
	 load=0;
	 parallel_in=3'b110;
	 #20;
	 reset=0;
	 load=1;
	 #10;
	 load=0;
	 #30;
	 reset=1;
	 load=0;
	 parallel_in=3'b001;
	 #20;
	 reset=0;
	 load=1;
	 #10;
	 load=0;
	 #30;
	 
	
   end

   initial begin	
	  $monitor("clk=%b,reset=%b,load=%b,parallel_in=%b,serial_out=%b",clk,reset,load,parallel_in,serial_out);
     #180;
     $finish;
   end	  
      
endmodule

