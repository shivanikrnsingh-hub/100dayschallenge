`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   07:28:58 01/12/2026
// Design Name:   nor_g_demux
// Module Name:   /home/ise/verilog_projects/Challenge_100days/nor_g_demux_tb.v
// Project Name:  Challenge_100days
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: nor_g_demux
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module nor_g_demux_tb;

	// Outputs
	reg a,b;
	
	wire nor_o;

	// Instantiate the Unit Under Test (UUT)
	nor_g_demux uut (
		.a(a),.b(b),.nor_o(nor_o)
	);
   initial begin
      a=1;
		b=1;
		#10;
	   a=1;
		b=0;
		#10;
		a=0;
		b=0;
		#10;
		a=0;
		b=1;
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
		end
     
	initial begin
		// Initialize Inputs
		$display("a=%b,b=%b,nor_o=%b",a,b,nor_o);
		#70;
		$finish;

	end
      
endmodule

