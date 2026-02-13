`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:51:31 02/13/2026 
// Design Name: 
// Module Name:    Clock_Phasing 
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
module Clock_Phasing(
  input clk,reset,
  output clk_0,clk_90,clk_180,clk_270
    );

   reg [1:0] count;
	reg div2;
   always@(posedge clk,posedge reset)
	begin
	  if(reset)
	   count<=0;
	  else
      count<={~count[0],count[1]};
   end		
   
	always@(posedge clk,posedge reset)
	begin
	   if(reset)
		 div2<=0;
		else
       div2<=~div2;
      end

   assign clk_0=count[1];
	assign clk_90=count[1]^div2;
	assign clk_180=~count[1];
	assign clk_270=~clk_90;
   		

endmodule
