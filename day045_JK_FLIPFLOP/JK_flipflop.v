`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:40:27 01/31/2026 
// Design Name: 
// Module Name:    JK_flipflop 
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
module JK_flipflop(

  input J,K,reset,clk,
  output reg Q
    );
	 
	 always@(posedge clk)
	 
	 if(reset)
	  Q<=1'b0;
	  
	 else
       begin
		 case({J,K})
		   2'b00:Q<=Q;
			2'b01:Q<=1'b0;
			2'b10:Q<=1'b1;
			2'b11:Q<=~Q;
			default:Q<=1'b0;
		endcase	
	    end
	
	
	

endmodule
