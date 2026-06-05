`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:22:40 06/04/2026
// Design Name:   I2C_master
// Module Name:   /home/ise/verilog_projects/minor_project/I2C_Master_tb.v
// Project Name:  minor_project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: I2C_master
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module I2C_Master_tb;

	// Inputs
	reg clk;
	reg rst_n;
	reg start;
	reg [6:0] addr;
	reg [7:0] data;

	// Outputs
	wire scl;
	wire busy;

	// Bidirs
	wire sda;

	// Instantiate the Unit Under Test (UUT)
	I2C_master uut (
		.clk(clk), 
		.rst_n(rst_n), 
		.start(start), 
		.addr(addr), 
		.data(data), 
		.scl(scl), 
		.sda(sda), 
		.busy(busy)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		forever #5 clk=~clk;//100MHz

	end
	
	initial begin
	 rst_n=0;
	 start=0;
	 addr=7'h42;
	 data=8'hA5;
    #20 rst_n=1;
    #30 start=1;
    #10 start=0;
    #500 
	 $finish;
    end

	initial begin
      $dumpfile("I2C_Master.vcd");
      $dumpvars(0,I2C_Master_tb);
    end		
endmodule

