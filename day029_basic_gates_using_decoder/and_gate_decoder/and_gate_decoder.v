`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:20:35 01/13/2026 
// Design Name: 
// Module Name:    and_gate_decoder 
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
module and_gate_decoder(
 input a,b,
 output and_o
    );
wire w;
decoder_2x4 demux1(.in({a,b}),.out(w));
decoder_2x4 demux2(.in({1'b0,w}),.out(and_o));



endmodule
