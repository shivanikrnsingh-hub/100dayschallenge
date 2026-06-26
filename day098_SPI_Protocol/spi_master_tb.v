`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:42:36 05/02/2026
// Design Name:   SPI_protocol_master
// Module Name:   /home/ise/verilog_projects/minor_project/spi_master_tb.v
// Project Name:  minor_project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: SPI_protocol_master
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module spi_master_tb;

	// Inputs
	reg clk;
	reg rst_n;
	reg start;
	reg [7:0] tx_data;

	// Outputs
	wire sclk;
	wire mosi;
	wire cs_n;
	wire done;
	wire data_ready;
	wire [7:0] recieved_data;

	// Instantiate the Unit Under Test (UUT)
	SPI_protocol_master uut (
		.clk(clk), 
		.rst_n(rst_n), 
		.start(start), 
		.tx_data(tx_data), 
		.sclk(sclk), 
		.mosi(mosi), 
		.cs_n(cs_n), 
		.done(done)
	);
	
	SPI_slave uut1 (.sclk(sclk),.rst_n(rst_n),.rx_data(recieved_data),
	                   .cs_n(cs_n),.data_ready(data_ready),.mosi(mosi));
      
	  
   always #5 clk=~clk;
	initial begin
	
		// Initialize Inputs
		clk = 0;
		rst_n = 0;
		start = 0;
		tx_data = 0;

		// Wait 100 ns for global reset to finish
		#10;
        
		rst_n = 1;
		#10;
		tx_data = 8'h3a;
		start=1;
		#10;
		start=0;
		wait(done==0);
		wait(done);
			$display("input bits: %b ,output bits:  %b,recieved_data: %b" ,tx_data,mosi,recieved_data);
	

		#50;
		tx_data = 8'h56;
		start=1;
		#10;
		start=0;
		
		wait(done==0);
		wait(done);
			$display("input bits: %b ,output bits:  %b,recieved_data: %b" ,tx_data,mosi,recieved_data);
	

		#100;
	
		$finish;
		end
		


      
endmodule

