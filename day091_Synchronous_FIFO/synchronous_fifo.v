`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:40:44 03/23/2026 
// Design Name: 
// Module Name:    synchronous_fifo 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module synchronous_fifo #(parameter data_width=32,fifo_depth=8,bits=3)(
   input  [data_width-1:0] data_in,
	input wr_en,clk,reset,rd_en,cs,
	output reg [data_width-1:0] data_out,
	output  empty,full
	
    );
   
	
	reg [data_width-1:0] fifo [0:fifo_depth-1];
	reg [bits:0] write_pointer;
	reg [bits:0] read_pointer;
	
	
	always@(posedge clk or negedge reset)
	begin 
	 if(!reset)
	    write_pointer<=0;
		else
       if(cs & wr_en & !full)begin
        fifo[write_pointer[bits-1:0]]<=data_in;
        write_pointer<=write_pointer+1;		  
        end
		 end

  assign empty=(read_pointer==write_pointer);
  assign full =(read_pointer=={~write_pointer[3],write_pointer[2:0]});


  always@(posedge clk or negedge reset)
   begin
	 if(!reset)
	   read_pointer<=0;
		else
		 if(cs&rd_en&!empty)
		 begin
		  data_out<=fifo[read_pointer[bits-1:0]];
		  read_pointer<=read_pointer+1;
		 end
      end		 

  
    
endmodule
