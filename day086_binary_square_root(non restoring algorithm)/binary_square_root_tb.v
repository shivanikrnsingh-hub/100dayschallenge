`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:19:51 03/08/2026
// Design Name:   binary_square_root
// Module Name:   /home/ise/verilog_projects/challenge100days2/binary_square_root_tb.v
// Project Name:  challenge100days2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: binary_square_root
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module binary_square_root_tb;

	// Inputs
	reg [7:0] redicant;
	reg  reset;
	reg  clk;

	// Outputs
	wire done;
	wire [3:0] square_root;

	// Instantiate the Unit Under Test (UUT)
	binary_square_root uut (
		.redicant(redicant), 
		.reset(reset), 
		.clk(clk), 
		.done(done), 
		.square_root(square_root)
	);


   always #5 clk=~clk;
	
	initial begin
		// Initialize Inputs
		redicant = 0;
		reset = 1;
		clk = 0;
		#10;
      reset=0;
		// Wait 100 ns for global reset to finish
		repeat(6)@(negedge clk);
		redicant=25;
      repeat(7)@(negedge clk) ;
		// Add stimulus here
		redicant=225;
      repeat(8)@(negedge clk); 
		redicant=16;
       #200;
     $finish;
		
	end
	
	initial
	begin
	
	$monitor("number:%d,root:%d",redicant,square_root);
  
   end	  
endmodule

