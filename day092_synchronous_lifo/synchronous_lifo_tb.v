`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   06:00:10 04/20/2026
// Design Name:   synchronous_lifo
// Module Name:   /home/ise/verilog_projects/challenge100days2/synchronous_lifo_tb.v
// Project Name:  challenge100days2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: synchronous_lifo
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module synchronous_lifo_tb;

	// Inputs
	reg clk;
	reg reset_n;
	reg push;
	reg pop;
	reg [7:0] data_in;

	// Outputs
	wire [7:0] data_out;
	wire full;
	wire empty;
	integer i;

	// Instantiate the Unit Under Test (UUT)
	synchronous_lifo uut (
		.clk(clk), 
		.reset_n(reset_n), 
		.push(push), 
		.pop(pop), 
		.data_in(data_in), 
		.data_out(data_out), 
		.full(full), 
		.empty(empty)
	);
      
   always #5 clk=~clk;

   
	  
	task push_data(input [7:0] din);
	begin
   @(negedge clk)  
	push<=1;
	data_in<=din;
	#1;
	$display("[%0t],push data : data_in=%d",$time,data_in);
	@(negedge clk)
	push<=0;
	end
	endtask
	  
   task pop_data();
	begin
   @(negedge clk)  
	pop<=1;
	#1;
	@(negedge clk)
	$display("[%0t],pop data : data_out =%d",$time,data_out);
	pop<=0;
	end
	endtask   
   
	initial 
	 begin
		// Initialize Inputs
		clk = 0;
		reset_n = 0;
		push = 0;
		pop = 0;
		data_in = 0;
		#10;
		reset_n=1;
   
   $display("----------------PUSH AND POP OPERATION---------------");
	
   for(i=0;i<15;i=i+1)
	 begin
	 push_data(i);
	 @(negedge clk)
	 pop_data;
	 end
   
   $display("-----------------full condition check ----------------");
	
    for(i=0;i<=15;i=i+1)
	 begin
	 push_data(i);
	 end
	  if(full)
      $display("Can't write more, Stack is full");
		
		
	#1;	
	$display("---------------empty condition check------------------");	
	 for(i=0;i<=15;i=i+1)
	 begin
	 pop_data;
	 end
     if(empty)
        $display("Can't read more, stack is empty");   		  
    #40;
     $finish;	
  	 end 
endmodule

