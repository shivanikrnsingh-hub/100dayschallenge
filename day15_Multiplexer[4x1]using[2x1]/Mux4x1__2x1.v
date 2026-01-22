`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:25:39 01/09/2026 
// Design Name: 
// Module Name:    Mux4x1__2x1 
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
module Mux4x1__2x1(
input a,b,c,d,
input [1:0] sel,
output out
    );
wire [1:0] w;
mux_2x1 m1(a,b,sel[0],w[0]);
mux_2x1 m2(c,d,sel[0],w[1]);
mux_2x1 m3(w[0],w[1],sel[1],out);

endmodule
