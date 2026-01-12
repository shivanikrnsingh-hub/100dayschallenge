`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:46:32 01/11/2026
// Design Name:   and_g_demux
// Module Name:   /home/ise/verilog_projects/Challenge_100days/and_g_demux_tb.v
// Project Name:  Challenge_100days
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: and_g_demux
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module and_g_demux_tb;

	// Inputs
	reg a;
	reg b;

	// Outputs
	wire and_o;

	// Instantiate the Unit Under Test (UUT)
	and_g_demux uut (
		.a(a), 
		.b(b), 
		.and_o(and_o)
	);

    always 
	  begin
	   a=$random%2;
		b=$random%2;
		#10;
		end
     
	initial begin
		// Initialize Inputs
		$monitor("a=%b,b=%b,and_o=%b",a,b,and_o);
		#70;
		$finish;

	end
      
endmodule

