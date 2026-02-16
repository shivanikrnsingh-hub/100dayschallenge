`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   06:35:47 02/16/2026
// Design Name:   One_Hot_FSM
// Module Name:   /home/ise/verilog_projects/challenge100days2/one_hot_fsm_tb.v
// Project Name:  challenge100days2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: One_Hot_FSM
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module one_hot_fsm_tb;

	// Inputs
	reg reset;
	reg clk;

	// Outputs
	wire [3:0] state;
	wire [1:0] out;

	// Instantiate the Unit Under Test (UUT)
	One_Hot_FSM uut (
		.reset(reset), 
		.clk(clk), 
		.state(state), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		reset = 1;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#10;
		reset=0;
        
		// Add stimulus here

	end
	initial 
	 forever #5 clk=~clk;
	 
	initial begin
    $monitor("clk=%d,reset=%d,state=%b,out=%b",clk,reset,state,out);
    #100;
    $finish;
    end	 
      
endmodule

