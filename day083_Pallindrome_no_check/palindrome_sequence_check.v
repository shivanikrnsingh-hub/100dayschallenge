`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:45:56 02/28/2026 
// Design Name: 
// Module Name:    palindrome_sequence_check 
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
module palindrome_sequence_check(
       input [15:0] num_in,
		 output palindrome
	 );


    assign palindrome=(num_in[15:0]=={num_in[0],num_in[1],num_in[2],num_in[3],num_in[4],num_in[5],num_in[6],num_in[7]
	                    ,num_in[8],num_in[9],num_in[10],num_in[11],num_in[12],num_in[13],num_in[14],num_in[15]});

endmodule
