`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:18:24 01/31/2026 
// Design Name: 
// Module Name:    D_flipflop 
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
module D_flipflop(
    input D,reset,clk,
	 output reg Q
    );


   always@(posedge clk)
	begin
	if(reset)
	 Q<=1'b0;
	 else
	  Q<=D;
	  end

endmodule
