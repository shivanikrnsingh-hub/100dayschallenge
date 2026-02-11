`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:01:03 02/11/2026
// Design Name:   barrel_shifter
// Module Name:   /home/ise/verilog_projects/Challenge_100days/barrel_shifter_tb.v
// Project Name:  Challenge_100days
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: barrel_shifter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module barrel_shifter_tb;

	// Inputs
	reg [7:0] data;
	reg [2:0] shift;

	// Outputs
	wire [7:0] out;

	// Instantiate the Unit Under Test (UUT)
	barrel_shifter uut (
		.data(data), 
		.shift(shift), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		data = 8'b10101110;
		shift = 0;

		// Wait 100 ns for global reset to finish
		
		end
	always begin
   #10;
   shift=$random;	
        
		  end
	
	initial 
	begin
	$monitor("data=%d,shift=%d,out=%d",data,shift,out);
	#180;
	$finish;
      end
endmodule

