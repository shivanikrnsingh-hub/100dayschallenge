`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:58:32 03/21/2026 
// Design Name: 
// Module Name:    MBIST_RAM 
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
module MBIST_RAM( 
     input clk,reset,wr_en,
	  input [3:0] addr,
	  input [7:0] data_in,
	  input force_error,
	  output [7:0] data_out
    );
	 
	 
	 reg [7:0] ram [0:15];
	 
	 always@(posedge clk) begin
	   if(reset)
		  ram[addr]<=8'b00000000;
       else if(wr_en)
		  ram[addr]<=data_in;
		  end
		  
		  
		  assign data_out=(force_error && addr==4'h0)?(ram[addr]&8'hFE):(ram[addr]);


endmodule
