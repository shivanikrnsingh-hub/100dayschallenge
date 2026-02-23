`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:07:03 02/22/2026
// Design Name:   dual_port_ram
// Module Name:   /home/ise/verilog_projects/challenge100days2/dual_port_ram_tb.v
// Project Name:  challenge100days2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: dual_port_ram
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module dual_port_ram_tb;

	// Inputs
	reg [6:0] addr_a;
	reg [6:0] addr_b;
	reg [7:0] data_in_a;
	reg [7:0] data_in_b;
	reg clk;
	reg reset;
	reg wr_a;
	reg wr_b;

	// Outputs
	wire [7:0] data_a;
	wire [7:0] data_b;
	wire busy;

	// Instantiate the Unit Under Test (UUT)
	dual_port_ram uut (
		.addr_a(addr_a), 
		.addr_b(addr_b), 
		.data_in_a(data_in_a), 
		.data_in_b(data_in_b), 
		.clk(clk), 
		.reset(reset), 
		.wr_a(wr_a), 
		.wr_b(wr_b), 
		.data_a(data_a), 
		.data_b(data_b), 
		.busy(busy)
	);
	initial
	 forever #5 clk=~clk;

	initial begin
		// Initialize Inputs
		addr_a = 0;
		addr_b = 0;
		data_in_a = 0;
		data_in_b = 0;
		clk = 0;
		reset = 1;
		wr_a = 0;
		wr_b = 0;
		#10;
       reset = 0; 
	//writes to two different addresses
	  $display("writing to different address at same time");
	  @(posedge clk)
	  wr_a=1;addr_a=7'h10;data_in_a=8'haa;
	  wr_b=1;addr_b=7'h30;data_in_b=8'had;
	 
	 @(posedge clk)
	
	  wr_a=0;wr_b=0;
	
	
	  @(posedge clk)
	  $display("Reading back the Same Address ");
	  addr_a=7'h10;
	  addr_b=7'h30;
	  #2;
	  $display("Read a =%h,Read b =%h",data_a,data_b);
	  @(posedge clk)
	  $display("testing conflict flag");
	  wr_a=1;wr_b=1;
	  addr_a=7'h40; addr_b=7'h40;data_in_a=8'hac;data_in_b=8'hbb;
	  
	  @(posedge clk)
	  if(busy)
	   $display("busy=%b : conflict at address 40 ",busy);
	
	  @(posedge clk)
	  wr_a=0;wr_b=0;
	  
	   @(posedge clk)
        addr_a=7'h40;  
		  #1;
     $display("Read a =%h",data_a);
	  #40;
	  $finish;
	  end
	  
endmodule

