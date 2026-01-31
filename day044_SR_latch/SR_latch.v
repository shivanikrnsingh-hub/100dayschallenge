`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:11:58 01/30/2026 
// Design Name: 
// Module Name:    SR_latch 
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
module SR_latch(
   input S,R,en,rst,
	output reg Q
    );
    
	 always@(*)
	 begin
	  if(rst)
	    Q<=1'b0;
		 else if(en)
		   begin
			 case({S,R})
			 2'b00:Q<=Q;
			 2'b01:Q<=1'b0;
			 2'b10:Q<=1'b1;
			 2'b11:Q<=1'bx;
			 default:Q<=1'bx;
			 endcase
			 end
			else
         Q<=1'b0;			
       end
endmodule
