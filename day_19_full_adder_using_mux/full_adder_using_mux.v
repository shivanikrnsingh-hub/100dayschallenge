`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:47:36 01/10/2026 
// Design Name: 
// Module Name:    full_adder_using_mux 
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
module full_adder_using_mux(
    input a,b,cin,
	 output sum,cout
    );
    wire [4:0]w;
	 mux_2x1 m1(1'b1,1'b0,a,w[0]);
	 mux_2x1 m2(a,w[0],b,w[1]);
	 mux_2x1 m3(1'b1,1'b0,w[1],w[2]);
	 mux_2x1 m4(w[1],w[2],cin,sum);
	 
	 
	 mux_2x1 m5(1'b0,w[1],cin,w[3]);
    mux_2x1 m6(1'b0,a,b,w[4]);
	 mux_2x1 m7(w[3],w[4],w[4],cout);
endmodule
