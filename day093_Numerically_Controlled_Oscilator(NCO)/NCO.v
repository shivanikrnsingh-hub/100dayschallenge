`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:08:55 04/21/2026 
// Design Name: 
// Module Name:    NCO 
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
module NCO(
input [31:0] controll_word,
input reset_n,clk,
output clk_out
    );
	 
	 reg [31:0] phase_clk;


   always@(posedge clk or negedge reset_n)
	 begin
	   if(!reset_n)
		   begin
			 phase_clk<=0;
			end
      else
        begin
          phase_clk<=phase_clk+controll_word;
        end
	 end

   assign clk_out=phase_clk[31 ];	 
endmodule
