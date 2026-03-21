`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:19:42 03/21/2026
// Design Name:   Trafic_light_controller
// Module Name:   /home/ise/verilog_projects/challenge100days2/Traffic_controller_tb.v
// Project Name:  challenge100days2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Trafic_light_controller
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Traffic_controller_tb;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire [2:0] light_M1;
	wire [2:0] light_S;
	wire [2:0] light_MT;
	wire [2:0] light_M2;

	// Instantiate the Unit Under Test (UUT)
	Trafic_light_controller uut (
		.clk(clk), 
		.reset(reset), 
		.light_M1(light_M1), 
		.light_S(light_S), 
		.light_MT(light_MT), 
		.light_M2(light_M2)
	);

    always #5 clk=~clk;
	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
      #10;
		reset = 0;
	
		#200;
		$finish;
	end
      
endmodule

