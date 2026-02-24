`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:46:24 02/24/2026
// Design Name:   ROM_15x15
// Module Name:   /home/ise/verilog_projects/challenge100days2/rom_tb.v
// Project Name:  challenge100days2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ROM_15x15
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module rom_tb;

	// Inputs
	reg rd_en;
	reg clk;
	reg [3:0] addr;

	// Outputs
	wire [15:0] data;

	// Instantiate the Unit Under Test (UUT)
	ROM_15x15 uut (
		.rd_en(rd_en), 
		.clk(clk), 
		.addr(addr), 
		.data(data)
	);

   always #5 clk=~clk;
	integer i;
  
	initial begin
		// Initialize Inputs
		rd_en = 0;
		clk = 0;
		addr = 0;
      for(i=0;i<16;i=i+1)
	    uut.memory[i]=i*16'h10;
		// Wait 100 ns for global reset to finish
		#10;
       rd_en = 1;
		 @(posedge clk)
       addr=4'b0010;		 
		@(posedge clk)
       addr=4'b0010;	
		 @(posedge clk)
       addr=4'b0110;
       @(posedge clk)
       addr=4'b0011;	
       #50;
       $finish;		 

	end
	
	
	initial 
	 $monitor("addr=%b,data=%h",addr,data);
      
endmodule

