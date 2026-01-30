`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:26:56 01/06/2026
// Design Name:   even_parity_gen
// Module Name:   /home/ise/verilog_projects/Challenge_100days/even_parity_gen_tb.v
// Project Name:  Challenge_100days
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: even_parity_gen
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module even_parity_gen_tb;

	// Inputs
	reg [7:0] data_in;
   reg clk;
	// Outputs
	wire parity;

	// Instantiate the Unit Under Test (UUT)
	even_parity_gen uut (
		.data_in(data_in), 
		.parity(parity)
	);
    initial clk=0;
	 always #5 clk=~clk;
	initial begin
		// Initialize Inputs
		data_in = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
      data_in=8'b00000000;
		#10;
		 data_in=8'b00011000;
		#10;
		 data_in=8'b11100000;
		#10;
		 data_in=8'b00101000;
		#10;
		 data_in=8'b00111110;
		#10;
		 data_in=8'b10101000;
		#10;
		 data_in=8'b10100000;
		#10;
		 data_in=8'b01111100;
		#10;
	end
	always@(posedge clk )begin
	  $display("data_in:%b,parity:%b",data_in,parity);
	  end
      
endmodule

