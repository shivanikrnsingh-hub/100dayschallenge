`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:38:59 01/16/2026 
// Design Name: 
// Module Name:    xor_decoder 
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
module xor_decoder(
input a,b,
output xor_o,xnor_o
    );
wire [3:0] w;	 
	 
decoder_2x4 deco1(.in({a,b}),.out(w));

assign xor_o=w[1]|w[2];
assign xnor_o=w[0]|w[3];


endmodule
