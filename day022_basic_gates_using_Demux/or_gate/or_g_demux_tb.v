`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:49:45 01/11/2026
// Design Name:   or_gate_demux
// Module Name:   /home/ise/verilog_projects/Challenge_100days/or_g_demux_tb.v
// Project Name:  Challenge_100days
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: or_gate_demux
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module or_g_demux_tb;

	// Inputs
	reg a;
	reg b;

	// Outputs
	wire or_o;

	// Instantiate the Unit Under Test (UUT)
	or_gate_demux uut (
		.a(a), 
		.b(b), 
		.or_o(or_o)
	);
    initial
	  begin
	  a=0;
	  b=0;
	  #10;
     a=1;
	  b=0;
	  	  #10;
	  a=0;
	  b=1;
	  	  #10;
	  a=0;
	  b=0;
	   #10;
     a=1;
	  b=0;
	  	  #10;
	  a=0;
	  b=1;
	  	  #10;
	  a=0;
	  b=0;
		// Initialize Inputs
		$monitor("a=%b,b=%b,or_o=%b",a,b,or_o);
		#70;
		$finish;

	end
      
endmodule

