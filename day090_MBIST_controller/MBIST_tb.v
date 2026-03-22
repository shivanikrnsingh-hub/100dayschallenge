`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   04:44:44 03/22/2026
// Design Name:   MBIST_TOP
// Module Name:   /home/ise/verilog_projects/challenge100days2/MBIST_tb.v
// Project Name:  challenge100days2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MBIST_TOP
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module MBIST_tb;

	// Inputs
	reg clk;
	reg reset;
	reg force_error;
	reg wr_en;
	reg start_test;

	// Outputs
	wire test_done;
	wire test_fail;

	// Instantiate the Unit Under Test (UUT)
	MBIST_TOP uut (
		.clk(clk), 
		.reset(reset), 
		.force_error(force_error), 
		.wr_en(wr_en), 
		.start_test(start_test), 
		.test_done(test_done), 
		.test_fail(test_fail)
	);
   always #5 clk=~clk;
	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		force_error = 0;
		wr_en = 0;
		start_test = 0;
		#10;
      reset=0;
		$display("testing healthy memory");
		
		
		start_test=1;
		
		wait(test_done);
		#20;
		
		if(test_fail==0)
		  $display(" healthy memory test passed ");
		  
		else 
        $display(" healthy memory test fail false test detected ");	
      start_test=0;	
      force_error=1;		
		#100;
		reset=1;
		#10;
		reset=0;
        $display("testing faulty memory");
		start_test=1;
		force_error=1;
		wait(test_done);
		#20;
		if(test_fail==1)
		  $display(" faulty memory test passed ");
		  
		else 
        $display(" faulty memory test fail false test detected ");	
      start_test=0;		  
		
        
		 #10;
		 $finish;
		  
		// Add stimulus here

	end
      
endmodule

