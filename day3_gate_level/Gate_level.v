`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:49:20 01/06/2026 
// Design Name: 
// Module Name:    Gate_level 
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
module Gate_level(input a,b,
output and_o,
output nand_o,
output or_o,
output nor_o,
output not_o,
output xor_o,
output xnor_o
    );

and and1(and_o,a,b);
nand nand1(nand_o,a,b);
or or1(or_o,a,b);
nor nor1(nor_o,a,b);
not not1(not_o,a);
xor xor1(xor_o,a,b);
xnor xnor1(xnor_o,a,b);
endmodule
