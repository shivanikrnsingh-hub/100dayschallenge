`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   08:28:26 02/01/2026
// Design Name:   SR_latch_using_jk_t_d_ff
// Module Name:   /home/ise/verilog_projects/challenge100days2/SR_using_jk_d_t_tb.v
// Project Name:  challenge100days2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: SR_latch_using_jk_t_d_ff
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module SR_using_jk_d_t_tb;

	// Inputs
	reg S;
	reg R;
	reg reset;
	reg clk;

	// Outputs
	wire Q_jk;
	wire Q_T;
	wire Q_D;

	// Instantiate the Unit Under Test (UUT)
	SR_latch_using_jk_t_d_ff uut (
		.S(S), 
		.R(R), 
		.reset(reset), 
		.clk(clk), 
		.Q_jk(Q_jk), 
		.Q_T(Q_T), 
		.Q_D(Q_D)
	);

	initial begin
		// Initialize Inputs
		S = 0;
		R = 0;
		reset = 1;
		clk = 0;
		
		#10;
		reset=0;

	end
	
	initial begin 
	forever #5 clk=~clk;
	end
	
	always
	 begin 
	 
	 S=1;
	 R=1;
	 #10;
	 S=0;
	 R=1;
    #10;
	 
	 S=1;
	 R=0;
	 #10;
	 
	 S=0;
	 R=0;
	 #10;
	 end
	 
	 initial begin
	 $monitor("S,R,reset,clk,Q_D,Q_jk,Q_T",S,R,reset,clk,Q_D,Q_jk,Q_T);
	 #120;
	 $finish;
	 end
	 
	 
	 
endmodule

