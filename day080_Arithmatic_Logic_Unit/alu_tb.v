`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:41:18 02/24/2026
// Design Name:   ALU
// Module Name:   /home/ise/verilog_projects/challenge100days2/alu_tb.v
// Project Name:  challenge100days2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module alu_tb;

	// Inputs
	reg [3:0] A;
	reg [3:0] B;
	reg clk;
	reg [3:0] op_sel;

	// Outputs
	wire [3:0] Result;
	wire carry;
	wire sign;
	wire overflow;
	wire zero;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.A(A), 
		.B(B), 
		.clk(clk), 
		.op_sel(op_sel), 
		.Result(Result), 
		.carry(carry), 
		.sign(sign), 
		.overflow(overflow), 
		.zero(zero)
	);


    always #5 clk=~clk;
	 
	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		clk = 0;
		op_sel = 0;

		// Wait 100 ns for global reset to finish
		#10; 
		A=4'b0101;B=4'b0101;//additon
		op_sel=4'b0000;
		
		@(posedge clk)
		#1;
		$display("addition operation ");
		$display("op_sel=%b,A=%b,B=%b,Result=%b",op_sel,A,B,Result);
		
		#10; 
		A=4'b1111;B=4'b1001;
		op_sel=4'b0001;
		@(posedge clk)
		#1;
		$display("subtraction operation ");
      $display("op_sel=%b,A=%b,B=%b,Result=%b",op_sel,A,B,Result);

		#10; 
		A=4'b0010;B=4'b0011;
		op_sel=4'b0110;
		@(posedge clk)
		#1;
		$display("multiplication operation ");
		$display("op_sel=%b,A=%b,B=%b,Result=%b",op_sel,A,B,Result);

		#10; 
		A=4'b1110;B=4'b0010;
		op_sel=4'b0111;
		@(posedge clk)
		#1;
		$display("division operation ");
      $display("op_sel=%b,A=%b,B=%b,Result=%b",op_sel,A,B,Result);

		#10;
		A=4'b1111;B=4'b1111;
		op_sel=4'b1100;
		@(posedge clk)
		#1;
		$display("equality check operation ");
		$display("op_sel=%b,A=%b,B=%b,Result=%b",op_sel,A,B,Result);
		
		#10;
		A=4'b1111;B=4'b1101;
		op_sel=4'b1101;
		@(posedge clk)
		#1;
		$display("greater than operation ");
		$display("op_sel=%b,A=%b,B=%b,Result=%b",op_sel,A,B,Result);
		#10;
		A=4'b1101;
		op_sel=4'b1010;
		@(posedge clk)
		#1;
		$display("increment operation ");
		$display("op_sel=%b,A=%b,Result=%b",op_sel,A,Result );
		#10;
		A=4'b1111;
		op_sel=4'b1011;
		@(posedge clk)
		#1;
		$display("decrement operation ");
		$display("op_sel=%b,A=%b,Result=%b",op_sel,A,Result );
	end
	initial
	  begin
	   #180;
		$finish;
		
	  end	
	
endmodule

