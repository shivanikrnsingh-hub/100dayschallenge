`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:44:02 02/04/2026
// Design Name:   SISO_REG
// Module Name:   /home/ise/verilog_projects/challenge100days2/SISO_reg_tb.v
// Project Name:  challenge100days2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: SISO_REG
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module SISO_reg_tb;

	// Inputs
	reg serial_in;
	reg clk;
	reg reset;

	// Outputs
	wire serial_out;

	// Instantiate the Unit Under Test (UUT)
	SISO_REG uut (
		.serial_in(serial_in), 
		.clk(clk), 
		.reset(reset), 
		.serial_out(serial_out)
	);

	initial begin
		// Initialize Inputs
		serial_in = 0;
		clk = 0;
		reset = 1;

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
		   $monitor("\t\t,clk=%d,reset=%d,serial_in=%d,serial_out=%d",clk,reset,serial_in,serial_out);
			#120;
			$finish;
        end

endmodule

