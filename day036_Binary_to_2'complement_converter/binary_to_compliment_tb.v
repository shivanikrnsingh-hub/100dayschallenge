`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:34:59 01/17/2026
// Design Name:   binary_2compliment
// Module Name:   /home/ise/verilog_projects/Challenge_100days/binary_to_compliment_tb.v
// Project Name:  Challenge_100days
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: binary_2compliment
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module binary_to_compliment_tb;

	// Inputs
	reg [3:0] data;

	// Outputs
	wire [3:0] com_out;

	// Instantiate the Unit Under Test (UUT)
	binary_2compliment uut (
		.data(data), 
		.com_out(com_out)
	);
   initial begin
	data=4'b0011;
	#10;
		data=4'b0111;
			#10;
	data=4'b0011;
		#10;
	data=4'b1011;
		#10;
	data=4'b0111;
		#10;
	data=4'b1100;
		#10;
	data=4'b1011;
		#10;
	data=4'b1001;
	

	
	
	end
	
	initial begin
	$monitor("in data =%b,complimented data=%b",data,com_out);
	#70;
	$finish;

	end
      
endmodule

