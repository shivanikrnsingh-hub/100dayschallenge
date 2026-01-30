`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:21:28 01/09/2026 
// Design Name: 
// Module Name:    N_bit_comparator 
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
module N_bit_comparator #(parameter N = 8)(
 
 input [N-1:0] a,b,
 output reg lesser,greater,equal
    );

always@(*)
begin
 if(a>b)
   begin
	 lesser=0;
	 greater=1;
	 equal=0;
	 
	 end
	 else if(a<b)
	 begin
	   lesser=1;
	   greater=0;
	   equal=0;
		end
		
	else
	begin
	 lesser=0;
	 greater=0;
	 equal=1;
	 end
  end

endmodule
