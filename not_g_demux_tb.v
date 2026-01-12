`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:50:52 01/11/2026
// Design Name:   not_gate_demux
// Module Name:   /home/ise/verilog_projects/Challenge_100days/not_g_demux_tb.v
// Project Name:  Challenge_100days
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: not_gate_demux
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module not_g_demux_tb;

	// Inputs
	reg a;

	// Outputs
	wire not_o;

	// Instantiate the Unit Under Test (UUT)
	not_gate_demux uut (
		.a(a), 
		.not_o(not_o)
	);

	
    always 
	  begin
	   a=$random%2;

		#10;
		end
     
	initial begin
		// Initialize Inputs
		$monitor("a=%b,and_o=%b",a,not_o);
		#70;
		$finish;

	end
      
endmodule

