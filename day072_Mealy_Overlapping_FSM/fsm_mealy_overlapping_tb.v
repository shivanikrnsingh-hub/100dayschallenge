`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:41:35 02/20/2026
// Design Name:   fsm_mealy_overlapping
// Module Name:   /home/ise/verilog_projects/challenge100days2/fsm_mealy_overlapping_tb.v
// Project Name:  challenge100days2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: fsm_mealy_overlapping
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module fsm_mealy_overlapping_tb;

	// Inputs
	reg clk;
	reg reset;
	reg din;

	// Outputs
	wire out;

	// Instantiate the Unit Under Test (UUT)
	fsm_mealy_overlapping uut (
		.clk(clk), 
		.reset(reset), 
		.din(din), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		din = 0;

		// Wait 100 ns for global reset to finish
		#10;
       reset = 0; 
		// Add stimulus here

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
  end

  initial
    begin
    $monitor("din=%b,out=%b",din,out);
	 #160;
	 $finish;
    end	 
endmodule

