`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:11:44 01/10/2026
// Design Name:   full_adder_using_mux
// Module Name:   /home/ise/verilog_projects/Challenge_100days/full_adder_mux_tb.v
// Project Name:  Challenge_100days
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: full_adder_using_mux
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module full_adder_mux_tb;

	// Inputs
	reg a;
	reg b;
	reg cin;

	// Outputs
	wire sum;
	wire cout;

	// Instantiate the Unit Under Test (UUT)
	full_adder_using_mux uut (
		.a(a), 
		.b(b), 
		.cin(cin), 
		.sum(sum), 
		.cout(cout)
	);
   always
	begin
	a=$random%2;
	b=$random%2;
	cin=$random%2;
	#10;
	end
	initial begin        
		// Add stimulus here
    $monitor("a:%b,b:%b,c:%b,sum:%b,cout:%b",a,b,cin,sum,cout);
	end
      
endmodule

