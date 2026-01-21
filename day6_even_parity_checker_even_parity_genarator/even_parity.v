`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:54:50 01/06/2026
// Design Name:   even_parity_checker
// Module Name:   /home/ise/verilog_projects/Challenge_100days/even_parity.v
// Project Name:  Challenge_100days
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: even_parity_checker
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module even_parity;

	// Inputs
	reg [7:0] data1;
	reg parity_bit;
   reg clk;
	// Outputs
	wire error;

	// Instantiate the Unit Under Test (UUT)
	even_parity_checker uut (
		.data1(data1), 
		.parity_bit(parity_bit), 
		.error(error)
	);
	initial clk=0;
    always #5 clk=~clk;
	initial begin
		// Initialize Inputs
		data1 = 0;
		parity_bit = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
      data1=8'b00111100;parity_bit=1;
		#10;
		data1=8'b00011100;parity_bit=0;
		#10;
      data1=8'b00111101;parity_bit=1;
		#10;
      data1=8'b001001100;parity_bit=1;
		#10;
      data1=8'b00111100;parity_bit=1;
		#10;
      data1=8'b00111100;parity_bit=1;
		#10;
      data1=8'b00111100;parity_bit=1;
		#10;
      data1=8'b00111100;parity_bit=1;
		#10;
       #200 $finish;
		 end
		 always@(posedge clk)begin
		 $display("data : %b,parity_bit : %b,error : %b",data1,parity_bit,error);
	end
      
endmodule

