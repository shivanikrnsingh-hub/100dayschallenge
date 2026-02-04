`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:05:39 02/04/2026
// Design Name:   SIPO_reg
// Module Name:   /home/ise/verilog_projects/challenge100days2/SIPO_reg_tb.v
// Project Name:  challenge100days2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: SIPO_reg
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module SIPO_reg_tb;

	// Inputs
	reg reset;
	reg clk;
	reg serial_in;

	// Outputs
	wire [2:0] parallel_out;

	// Instantiate the Unit Under Test (UUT)
	SIPO_reg uut (
		.reset(reset), 
		.clk(clk), 
		.serial_in(serial_in), 
		.parallel_out(parallel_out)
	);

	initial begin
		// Initialize Inputs
		reset = 1;
		clk = 0;
		serial_in = 0;

		// Wait 100 ns for global reset to finish
		#10;
      reset=0;  
	end
   
   initial
       begin
      forever #5 clk=~clk;
       end
		 
	initial 
      begin 
		  #0  serial_in=1'bx;
        #10 serial_in=1'b1;
        #10 serial_in=1'b0;		  
        #10 serial_in=1'b1;
        #10 serial_in=1'b1;
		  #10 serial_in=1'b0;
		  #10 serial_in=1'b1;
		  #10 serial_in=1'b0;
		  #10 serial_in=1'b1;
		  #10 serial_in=1'b1;
		end

     initial 
	    begin
		   $monitor("\t\t,clk=%d,reset=%d,serial__in=%d,parallel_out=%d",clk,reset,serial_in,parallel_out);
			#120;
			$finish;
		  end	
endmodule

