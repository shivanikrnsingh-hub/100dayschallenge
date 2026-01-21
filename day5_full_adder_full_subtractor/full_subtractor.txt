`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:56:47 12/24/2025 
// Design Name: 
// Module Name:    full_subtractor 
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
module full_subtractor(input a,b,c, output diff,borr
    );
assign diff=a^b^c;
assign borr=~a&(b&c)|(b&a);

endmodule
