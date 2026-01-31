`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:27:37 01/30/2026
// Design Name:   SR_latch
// Module Name:   /home/ise/verilog_projects/challenge100days2/SR_latch_tb.v
// Project Name:  challenge100days2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: SR_latch
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module SR_latch_tb;

	// Inputs
	reg S;
	reg R;
	reg en;
	reg rst;

	// Outputs
	wire Q;

	// Instantiate the Unit Under Test (UUT)
	SR_latch uut (
		.S(S), 
		.R(R), 
		.en(en), 
		.rst(rst), 
		.Q(Q)
	);

	initial begin
		// Initialize Inputs
		S = 0;
		R = 0;
		en = 0;
		rst = 1;
		#10;
		en=1;
		rst=0;
      

	end
	
	always
	begin 
	 S=1;
	 R=0;
	 #10;
	 S=0;
	 R=1;
	 #10;
	 S=0;
	 R=0;
	 #10;
	 S=1;
	 R=1;
	 #10;
	 end
	 
	 initial begin
	 $monitor("\t,en=%d,rst=%d,S=%d,R=%d",en,rst,S,R);
	 #120;
	 $finish;
	 end
      
endmodule

