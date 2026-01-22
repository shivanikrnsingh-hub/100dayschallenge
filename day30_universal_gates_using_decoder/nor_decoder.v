`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:20:50 01/16/2026 
// Design Name: 
// Module Name:    nor_decoder 
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
module nor_decoder(
 input a,b,
 output nor_o
    );
wire [3:0] w;
decoder_2x4 dec1(.in({a,b}),.out(w));

assign nor_o=~(w[1]|w[2]|w[3]);
endmodule
