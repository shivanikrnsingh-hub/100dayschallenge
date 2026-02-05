`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:44:40 02/05/2026 
// Design Name: 
// Module Name:    LFSR 
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
module LFSR(
     input reset,clk,
	  output [7:0] LFSR_out
	  
    );
	reg [7:0] data;
	
	always@(posedge clk)
	    begin
	    if(reset)
		   data<=8'hff;
		else
         data<={data[6:0],data[7]^data[5]^data[3]^data[1]};

      end
		
	 assign LFSR_out=data;


endmodule
