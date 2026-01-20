`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:33:05 01/06/2026 
// Design Name: 
// Module Name:    strutural_modellinng 
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
module strutural_modellinng(
input a,b,
output and_g,
output or_g,
output nand_g,
output not_g,
output nor_g,
output xor_g,
output xnor_g
    );
assign and_g=a&b;
assign or_g=a|b;
assign nand_g=~(a&b);
assign not_g=~b;
assign nor_g=~(a|b);
assign xor_g=a^b;
assign xnor_g=~(a^b);

endmodule
