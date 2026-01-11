`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:32:09 01/11/2026
// Design Name:   Demultiplerex_1x8_using_1x2
// Module Name:   /home/ise/verilog_projects/Challenge_100days/demultiplexer_1x8.v
// Project Name:  Challenge_100days
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Demultiplerex_1x8_using_1x2
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module demultiplexer_1x8;

	// Inputs
	reg I;
  reg[2:0] sel;
	// Outputs
	wire y0;
	wire y1;
	wire y2;
	wire y3;
	wire y4;
	wire y5;
	wire y6;
	wire y7;

	// Instantiate the Unit Under Test (UUT)
	Demultiplerex_1x8_using_1x2 uut (
		.I(I), .sel(sel),
		.y0(y0), 
		.y1(y1), 
		.y2(y2), 
		.y3(y3), 
		.y4(y4), 
		.y5(y5), 
		.y6(y6), 
		.y7(y7)
	);
   
	always
	 begin 
	 I=$random%2;
	 sel=$random;
	 #10;
	 end
	
	initial begin
	$monitor("I=%b,sel=%b,y0=%b,y1=%b,y2=%b,y3=%b,y4=%b,y5=%b,y6=%b,y7=%b",I,sel,y0,y1,y2,y3,y4,y5,y6,y7);
	#70;
	$finish;
		// Add stimulus here

	end
      
endmodule

