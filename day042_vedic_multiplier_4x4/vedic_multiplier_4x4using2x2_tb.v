`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:14:11 01/26/2026
// Design Name:   vedic_multiplier4x4_using2x2
// Module Name:   /home/ise/verilog_projects/Challenge_100days/vedic_multiplier4x4_using2x2_tb.v
// Project Name:  Challenge_100days
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: vedic_multiplier4x4_using2x2
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module vedic_multiplier4x4_using2x2_tb;

	// Inputs
	reg [3:0] A;
	reg [3:0] B;

	// Outputs
	wire [7:0] M;

	// Instantiate the Unit Under Test (UUT)
	vedic_multiplier4x4_using2x2 uut (
		.A(A), 
		.B(B), 
		.M(M)
	);

	initial begin
		// Initialize Inputs
		A = 4'd12;
		B = 4'd6;
      #10;
		A = 4'd12;
		B = 4'd14;
      #10;
		A = 4'd13;
		B = 4'd5;
      #10;
		A = 4'd4;
		B = 4'd5;
      #10;
		A = 4'd13;
		B = 4'd2;
      #10;		// Wait 100 ns for global reset to finish
		
        
		// Add stimulus here

	end
	
	initial begin
  $monitor("A=%d,B=%d,M=%d",A,B,M);
   #50;
  $finish;
   end  
      
endmodule

