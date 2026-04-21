`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:26:24 04/19/2026 
// Design Name: 
// Module Name:    synchronous_lifo 
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
module synchronous_lifo(

  input clk,reset_n,push,pop,
  input  [7:0] data_in,
  output reg [7:0] data_out,
  output full,empty
    );

reg [7:0] stack [15:0];
reg [4:0] sp;

assign full = (sp==5'h10);
assign empty = (sp==0);

always@(posedge clk or negedge reset_n)
 begin 
   if(!reset_n)
	  begin
	   sp<=0;
		data_out<=0;
	  end
   else
     begin
	  if(push&&!full)
	   begin
      stack[sp]<=data_in;
		sp<=sp+1;
		end
		else if(pop&&!empty)
		begin		
      data_out<=stack[sp-1];
		sp<=sp-1;
     end
   end
 end


endmodule
