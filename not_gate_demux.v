`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:43:51 01/11/2026 
// Design Name: 
// Module Name:    not_gate_demux 
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
module not_gate_demux(input a,
output not_o
    );

wire w;

Demultiplexer_2x1 demux1(a,1'b1,not_o,w);

endmodule
