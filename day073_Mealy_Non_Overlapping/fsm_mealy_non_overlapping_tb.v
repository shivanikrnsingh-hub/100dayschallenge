`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:27:18 02/19/2026
// Design Name:   fsm_mealy_non_overlapping
// Module Name:   /home/ise/verilog_projects/challenge100days2/fsm_mealy_non_overlapping_tb.v
// Project Name:  challenge100days2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: fsm_mealy_non_overlapping
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module fsm_mealy_non_overlapping_tb;

	// Inputs
	reg din;
	reg clk;
	reg reset;

	// Outputs
	wire out;

	// Instantiate the Unit Under Test (UUT)
	fsm_mealy_non_overlapping uut (
		.din(din), 
		.clk(clk), 
		.reset(reset), 
		.out(out)
	);

	initial begin
		din = 0;
		clk = 0;
		reset = 1;
		#10;
      reset = 0;  
	end
    
  initial 
  forever #5 clk=~clk;
  
  initial	
    begin
     din=1;
	  #10;
     din=1;
	  #10;
     din=0;
	  #10;
     din=1;
	  #10;
     din=1;
	  #10;
     din=1;
	  #10;
     din=0;
	  #10;
     din=1;
	  #10;
     din=1;
	  #10;
     din=0;
	  #10;
     din=1;
	  #10;
     din=1;
	  #10;
     din=0;
	  #10;
     din=1;
	  #10;
     din=1;
	  #10;
     din=0;
     end	

     initial 
	  begin
	  $monitor("din=%b,out=%b",din,out);
	  #160;
	  $finish;
	  end
	  
endmodule

