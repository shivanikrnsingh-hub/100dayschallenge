`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:02:55 02/16/2026 
// Design Name: 
// Module Name:    Single_port_ram 
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
module Single_port_ram#(parameter data_width=8,
                        parameter depth=128,
								parameter address_width=7)
  ( input [data_width-1:0] data,
	 input [address_width-1:0] address,
	 input clk,wr_en,
	 output [data_width-1:0] data_out
	 
     );
 
   reg [data_width-1:0] ram [depth-1:0];
	reg [address_width-1:0]address_reg;
	
	always@(posedge clk)
	begin
	 if(wr_en)
      ram[address]<=data;
		else
		address_reg<=address;
	end

  assign data_out=ram[address_reg]	;
endmodule
