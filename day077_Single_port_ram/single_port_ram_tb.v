`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:18:32 02/16/2026
// Design Name:   Single_port_ram
// Module Name:   /home/ise/verilog_projects/challenge100days2/single_port_ram_tb.v
// Project Name:  challenge100days2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Single_port_ram
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module single_port_ram_tb;

	// Inputs
	reg [7:0] data;
	reg [6:0] address;
	reg clk;
	reg wr_en;

	// Outputs
	wire [7:0] data_out;

	// Instantiate the Unit Under Test (UUT)
	Single_port_ram uut (
		.data(data), 
		.address(address), 
		.clk(clk), 
		.wr_en(wr_en), 
		.data_out(data_out)
	);
	
	initial 
	forever #5 clk=~clk;
	
	initial 
	  begin
	    clk=1'b1;
	    wr_en=1'b1;
       address=7'd1;
		 data=8'hff;
		 #10;
		 
       address=7'd2;
		 data=8'haf;
		 #10;
		 
       address=7'd3;
		 data=8'hf0;
		 #10;
		 
		 wr_en=1'b0;
		 address=7'd1;
		 #10
		 
		 
		 address=7'd2;
		 #10
		 
		 address=7'd3;
		 #10;
     end		 
    

    initial 
        begin
         $monitor("wr_en=%b,address=%b,data=%d,data_out=%d",wr_en,address,data,data_out);
			#60;
			$finish;
		  end	
        		  
endmodule

