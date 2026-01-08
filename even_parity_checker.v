`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:46:49 01/06/2026 
// Design Name: 
// Module Name:    even_parity_checker 
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
module even_parity_checker(input [7:0] data1 ,input parity_bit, output error
    );
assign error=^({parity_bit,data1});

endmodule
