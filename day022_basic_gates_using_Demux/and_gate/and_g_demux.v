`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:36:34 01/11/2026 
// Design Name: 
// Module Name:    and_g_demux 
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
module and_g_demux(input a,b,
output and_o
    );
wire w;
Demultiplexer_2x1 Demux1(b,a,w,and_o);

endmodule
