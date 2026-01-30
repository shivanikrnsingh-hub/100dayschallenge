`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:18:39 01/17/2026
// Design Name:   BCD_TO_Excess3
// Module Name:   /home/ise/verilog_projects/Challenge_100days/bcd_to_excess3_tb.v
// Project Name:  Challenge_100days
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: BCD_TO_Excess3
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module bcd_to_excess3_tb;

	// Inputs
	reg [3:0] bcd_in;

	// Outputs
	wire [3:0] excess3_out;

	// Instantiate the Unit Under Test (UUT)
	BCD_TO_Excess3 uut (
		.bcd_in(bcd_in), 
		.excess3_out(excess3_out)
	);
   always
	 begin
	bcd_in=$random;
	 #10;
	 end
	initial begin
		// Initialize Inputs
	$monitor("bcd_in:%d,excess3_out:%d",bcd_in,excess3_out);

		// Wait 100 ns for global reset to finish
		#100;
		$finish;
        
		// Add stimulus here

	end
      
endmodule

