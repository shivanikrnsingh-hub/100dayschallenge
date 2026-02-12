`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:37:59 02/12/2026 
// Design Name: 
// Module Name:    special_sequence_counter 
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
module special_sequence_counter(
     input clk,reset,
	  output reg [3:0] counter
    );
	  
	 reg [3:0] count;
	 
	 always@(posedge clk,posedge reset)
	 begin
	  if(reset)
	      begin
			count<=4'b0000;
			counter<=4'b0000;
			end
			else 
			 begin
			 case(count)
			 4'b0000:begin
			 counter<=4'b0000;
			 count<=4'b0011;
			 end
			 4'b0011:begin
			 counter<=4'b0011;
			 count<=4'b0101;
			 end
			 4'b0101:begin
			 counter<=4'b0101;
			 count<=4'b0111;
			 end
			 4'b0111:begin
			 counter<=4'b0111;
			 count<=4'b1001;
			 end
	       4'b1001:begin
			 counter<=4'b1001;
			 count<=4'b1011;
			 end
			 4'b1011:begin
			 counter<=4'b1011;
			 count<=4'b0000;
			 end
			 default:begin
			 counter<=4'b0000;
			 count<=4'b0000;
			 end
			endcase
      end
   end		


endmodule
