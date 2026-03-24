`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:31:02 03/23/2026
// Design Name:   synchronous_fifo
// Module Name:   /home/ise/verilog_projects/challenge100days2/synchronous_fifo_tb.v
// Project Name:  challenge100days2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: synchronous_fifo
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module synchronous_fifo_tb;
   
	
	parameter data_width=32;
	parameter fifo_depth=8;
	// Inputs
	reg [data_width-1:0] data_in;
	reg wr_en;
	reg clk;
	reg reset;
	reg rd_en;
   reg cs;
	
	integer i;
	// Outputs
	wire [data_width-1:0] data_out;
	wire empty;
	wire full;

	// Instantiate the Unit Under Test (UUT)
	synchronous_fifo uut (
		.data_in(data_in), 
		.wr_en(wr_en), 
		.clk(clk), 
		.reset(reset), 
		.rd_en(rd_en), 
		.data_out(data_out), 
		.empty(empty), 
		.full(full),
		.cs(cs)
	);
	
	always #5 clk=~clk;
	
   task write_data(input [data_width-1:0] din);
	begin
	@(posedge clk)
	cs<=1;
	wr_en<=1;
	data_in<=din;
	#1;
	$display("$time ,write data : data_in = %d",data_in);
	@(posedge clk)
	cs<=0;
	wr_en<=0;
	end
	endtask
	
	task read_data();
	begin
	@(posedge clk)
	rd_en<=1;
	cs<=1;
	#1;
	$display("$time,read_data : data_out = %d",data_out);
	@(posedge clk)
	rd_en=0;
	cs=0;
	end
	endtask
	
	
	initial begin
		// Initialize Inputs
		data_in = 0;
		wr_en = 0;
		clk = 0;
		reset = 0;
		rd_en = 0;
      @(posedge clk)
		reset = 1;
		
		$display(" ------------------------  Write and Read Case:in range------------------------");
		for(i=0;i<fifo_depth;i=i+1)begin
		  write_data(3*i);
		  @(posedge clk)
		  read_data();
       end
		 
		   $display(" ----------------------   Write and Read Case:Full test-----------------------");
		 
		for(i=0;i<=fifo_depth;i=i+1)begin
		  write_data(3*i);
       end
		 if(full)
   	  $display("EXPECTED RESULT FIFO IS FULL NO MORE WRITES ALLOWED");

       
		 for(i=0;i<fifo_depth;i=i+1)begin
		  read_data();
       end
		 #1;
		 if(empty)
		  $display("Empty NO READS ALLOWED");
		 
		 #40;
		 $finish;
	end
      
endmodule

