`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:11:18 02/04/2026
// Design Name:   Dual_edge_triggered_flipflop
// Module Name:   /home/ise/verilog_projects/challenge100days2/dual_edge_trig_ff_tb.v
// Project Name:  challenge100days2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Dual_edge_triggered_flipflop
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module dual_edge_trig_ff_tb;

	// Inputs
	reg reset;
	reg clk;
	reg D;

	// Outputs
	wire Q;

	// Instantiate the Unit Under Test (UUT)
	Dual_edge_triggered_flipflop uut (
		.reset(reset), 
		.clk(clk), 
		.D(D), 
		.Q(Q)
	);

	initial 
	   begin
		// Initialize Inputs
		reset = 1;
		clk = 0;
		D = 0;
		forever #5 clk=~clk;
      end

    initial 
	    begin
       reset=1;
		 #10;
		 reset=0;
     forever #6 D=~D;
       end
		 
		 initial 
		   begin
			  $monitor("clk=%d,reset=%d,D=%d,Q=%d",clk,reset,D,Q);
			  #80;
			  $finish;
			  end

   

	
      
endmodule

