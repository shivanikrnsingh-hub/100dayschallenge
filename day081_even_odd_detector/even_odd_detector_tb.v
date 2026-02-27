`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:36:42 02/27/2026
// Design Name:   Even_odd_detector
// Module Name:   /home/ise/verilog_projects/challenge100days2/even_odd_detector_tb.v
// Project Name:  challenge100days2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Even_odd_detector
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module even_odd_detector_tb;

	// Inputs
	reg [3:0] num;

	// Outputs
	wire even_odd;

	// Instantiate the Unit Under Test (UUT)
	Even_odd_detector uut (
		.num(num), 
		.even_odd(even_odd)
	);

	initial begin
		// Initialize Inputs
		num = 4'b1101;
		#10;
		num=4'b0010;

		
		#10;
        
		

	end
	
	initial
	begin
	$monitor("input:%d|Result:%s",num,(even_odd)?"Even":"Odd");
	#20;
	$finish;
	end
      
endmodule

