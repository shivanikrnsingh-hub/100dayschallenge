`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:09:40 02/24/2026 
// Design Name: 
// Module Name:    ROM_15x15 
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
module ROM_15x15(
       input rd_en,clk,
		 input [3:0] addr,
		 output reg [15:0] data
		 
    );
	 
	 reg [15:0] memory [15:0];
	 
	 always@(posedge clk)
	 begin
	  if(rd_en)
	   data<=memory[addr];
	  else
      data<=15'hz;
    end		


endmodule
