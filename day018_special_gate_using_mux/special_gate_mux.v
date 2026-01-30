`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:24:33 01/09/2026 
// Design Name: 
// Module Name:    special_gate_mux 
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
module special_gate_mux(
input a,b,
output xor_out,xnor_out
    );
wire bbar;
mux_2x1 m1(1'b1,1'b0,b,bbar);

mux_2x1 m2(bbar,b,a,xor_out);
mux_2x1 m3(b,bbar,a,xnor_out);

endmodule
