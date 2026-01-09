`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:13:49 01/09/2026 
// Design Name: 
// Module Name:    basic_gate_mux 
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
module basic_gate_mux(
input a,b,
output and_out,not_out,or_out
    );
mux_2x1 m1(1'b0,b,a,and_out);
mux_2x1 m2(b,1'b0,a,or_out);
mux_2x1 m3(1'b0,1'b1,a,not_out);


endmodule
