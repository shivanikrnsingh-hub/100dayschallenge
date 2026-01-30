`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:21:12 01/10/2026 
// Design Name: 
// Module Name:    universal_gate_using_mux 
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
module universal_gate_using_mux(
input a,b,
output nand_out,nor_out
    );
wire bbar;
 mux_2x1 m1(1'b0,1'b1,b,bbar);

 mux_2x1 m2(bbar,1'b1,a,nand_out);
 mux_2x1 m3(1'b0,bbar,a,nor_out);
endmodule
