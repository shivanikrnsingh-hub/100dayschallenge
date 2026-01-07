`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:08:25 01/06/2026 
// Design Name: 
// Module Name:    behavioural_model 
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
module behavioural_model(
    input a,b ,
	 output reg and_out,
	 output reg or_out,
	 output reg nor_out,
	 output reg not_out,
	 output reg nand_out,
	 output reg xnor_out,
	 output reg xor_out
	 
	 );
  always@(*)
  begin
   and_out=a&b;
	or_out=a|b;
	nor_out=~(a|b);
	nand_out=~(a&b);
	not_out=~a;
	xnor_out=~(a^b);
	xor_out=a^b;
	end

endmodule
