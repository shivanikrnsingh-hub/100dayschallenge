`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   07:38:35 01/18/2026
// Design Name:   booth_algorithm
// Module Name:   /home/ise/verilog_projects/Challenge_100days/booth_algorithm_tb.v
// Project Name:  Challenge_100days
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: booth_algorithm
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module booth_algorithm_tb;

	// Inputs
	reg signed[3:0] a;
	reg signed [3:0] b;

	// Outputs
	wire signed [7:0] result;

	// Instantiate the Unit Under Test (UUT)
	booth_algorithm uut (
		.a(a), 
		.b(b), 
		.result(result)
	);
   always
		
	 begin
	a= 3; b = 7;#10;
	a =3;b = 7;#10;
	a=-3;b= 4;#10;
	a=5;b= 6;#10;
	a=3;b= -7;#10;

	 
	 
	 end
	initial begin
		// Initialize Inputs
		$monitor("a = %d, b = %d, result =%d",a,b,result);
		#100;
		$finish;
       

	end
      
endmodule

