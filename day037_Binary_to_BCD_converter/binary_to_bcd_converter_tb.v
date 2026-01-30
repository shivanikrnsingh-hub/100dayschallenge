`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:55:20 01/17/2026
// Design Name:   binary_to_bcd_converter
// Module Name:   /home/ise/verilog_projects/Challenge_100days/binary_to_bcd_converter_tb.v
// Project Name:  Challenge_100days
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: binary_to_bcd_converter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module binary_to_bcd_converter_tb;

	// Inputs
	reg [7:0] data;

	// Outputs
	wire [3:0] bit0;
	wire [3:0] bit1;
	wire [3:0] bit2;
	wire [11:0] BCD;

	// Instantiate the Unit Under Test (UUT)
	binary_to_bcd_converter uut (
		.data(data), 
		.bit0(bit0), 
		.bit1(bit1), 
		.bit2(bit2), 
		.BCD(BCD)
	);
   always
	begin
	data=$random;
	#10;
	
	end
	initial begin
   $monitor("data=%d,BCD=%d",data,BCD);

		// Wait 100 ns for global reset to finish
		#100;
       $finish;
		// Add stimulus here

	end
      
endmodule

