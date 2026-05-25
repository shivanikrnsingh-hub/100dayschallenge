`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:00:06 05/21/2026
// Design Name:   vendig_machine
// Module Name:   /home/ise/verilog_projects/challenge100days2/vending_machine_tb.v
// Project Name:  challenge100days2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: vendig_machine
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module vending_machine_tb;

	// Inputs
	reg clk;
	reg rst_n;
	reg nickel;
	reg dime;

	// Outputs
	wire dispense;
	wire change;

	// Instantiate the Unit Under Test (UUT)
	vendig_machine uut (
		.clk(clk), 
		.rst_n(rst_n), 
		.nickel(nickel), 
		.dime(dime), 
		.dispense(dispense), 
		.change(change)
	);
   always #5 clk=~clk;
	initial begin
		// Initialize Inputs
		clk = 0;
		rst_n = 0;
		nickel = 0;
		dime = 0;
		#10;
       rst_n= 1;
		// Add stimulus here
      //checking for only dispense
		#1;
		nickel=1;
		#9;
		nickel=0;
		dime=1;
		#1;
		dime=0;
		#10;
		dime=1;
		#5
		dime=0;
		nickel=1;
		#10;
		nickel=0;
		
		//checkinng for dispense and change
		
		#10;
		nickel=1;
		#1;
		nickel=0;
		#10;
		nickel=1;
		#3;
		nickel=0;
		dime=1;
		#20;
		$finish;
	end
	
      
endmodule

