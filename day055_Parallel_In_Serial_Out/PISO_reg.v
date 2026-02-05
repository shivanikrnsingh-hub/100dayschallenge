`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:59:34 02/04/2026 
// Design Name: 
// Module Name:    PISO_REG 
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
module PISO_REG(
     input [2:0] parallel_in,
	  input clk,reset,load,
	  output serial_out
    );
  
     reg [2:0] q=3'd0;
	  
	  always@(posedge clk)
	  begin
        if(reset)
		   q<=3'b0;
			else
			 if(load)
			 q<=parallel_in;
			 else begin
			 q<={1'b0,q[2:1]};
			 end
        end

   assign serial_out=q[0];		  
			  
endmodule
