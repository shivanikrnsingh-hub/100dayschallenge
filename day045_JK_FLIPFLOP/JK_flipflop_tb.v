`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:50:16 01/31/2026
// Design Name:   JK_flipflop
// Module Name:   /home/ise/verilog_projects/challenge100days2/JK_flipflop_tb.v
// Project Name:  challenge100days2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: JK_flipflop
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module JK_flipflop_tb;

	// Inputs
	reg J;
	reg K;
	reg reset;
	reg clk;

	// Outputs
	wire Q;

	// Instantiate the Unit Under Test (UUT)
	JK_flipflop uut (
		.J(J), 
		.K(K), 
		.reset(reset), 
		.clk(clk), 
		.Q(Q)
	);

	initial begin
		// Initialize Inputs
		J = 0;
		K = 0;
		reset = 1;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#10;
        
		reset=0;

	end
      
	always
     begin
      #10 clk=~clk;
     end

   always 
     begin
      J=1;
      K=0;
      #20;
		
		J=0;
      K=1;
      #20;
		
		J=1;
      K=1;
      #20;
		
		J=1;
      K=0;
      #20;
		end
		
		initial 
		   begin
			
			$monitor("J=%d,K=%d,reset=%d,Q=%d",J,K,reset,Q);
			#180;
			$finish;
			
			end
endmodule

