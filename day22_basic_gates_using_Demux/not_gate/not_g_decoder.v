`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:08:54 01/16/2026 
// Design Name: 
// Module Name:    not_g_decoder 
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
module not_g_decoder(
  input a,
  output not_o
    );

wire [3:0] w;

decoder_2x4 decoder1(.in({a,1'b0}),.out(w));

assign not_o=w[0];

endmodule
