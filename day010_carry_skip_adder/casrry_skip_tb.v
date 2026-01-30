`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:13:18 01/08/2026
// Design Name:   carry_skip_adder
// Module Name:   /home/ise/verilog_projects/Challenge_100days/casrry_skip_tb.v
// Project Name:  Challenge_100days
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: carry_skip_adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module casrry_skip_tb;

	// Inputs
	reg [3:0] a;
	reg [3:0] b;
	reg cin;

	// Outputs
	wire [3:0] sum;
	wire cout;

	// Instantiate the Unit Under Test (UUT)
	carry_skip_adder uut (
		.a(a), 
		.b(b), 
		.cin(cin), 
		.sum(sum), 
		.cout(cout)
	);

	
	
        initial begin
		// Add stimulus here
		a=4'b1001;b=4'b0110;cin=1'b0;
		#10;
		a=4'b0110;b=4'b0110;cin=1'b1;
		#10;
		a=4'b1001;b=4'b1010;cin=1'b0;
		#10;
		a=4'b0110;b=4'b1001;cin=1'b1;
		#10;

	end
      initial begin
		$monitor("a:%d,b:%d,cin:%d,sum:%d,cout:%d",a,b,cin,sum,cout);
		#60 $finish ;
		end  
		// Add stimulus here


      
endmodule

