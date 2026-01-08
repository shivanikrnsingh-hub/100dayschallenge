`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:15:04 01/08/2026 
// Design Name: 
// Module Name:    carry_select_adder 
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
module carry_select_adder(
input [3:0] a,b,
input cin,
output [3:0] sum,
output cout
    );
	 
	 wire [16:1] w;
	 
	 full_adder fa1(a[0],b[0],1'b0,w[1],w[2]);
	 full_adder fa2(a[1],b[1],w[2],w[3],w[4]);
	 full_adder fa3(a[2],b[2],w[4],w[5],w[6]);
	 full_adder fa4(a[3],b[3],w[6],w[7],w[8]);

    full_adder fa5(a[4],b[4],1'b1,w[9],w[10]);
	 full_adder fa6(a[5],b[5],w[10],w[11],w[12]);
	 full_adder fa7(a[6],b[6],w[12],w[13],w[14]);
	 full_adder fa8(a[7],b[7],w[14],w[15],w[16]);
	 
	 mux_2x1 mux1(w[1],w[9],carry,sum[0]);
	 mux_2x1 mux2(w[3],w[11],carry,sum[0]);
	 mux_2x1 mux3(w[5],w[13],carry,sum[0]);
	 mux_2x1 mux4(w[7],w[15],carry,sum[0]);
	 mux_2x1 mux5(w[8],w[16],carry,sum[0]);


endmodule
