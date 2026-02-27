`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:20:07 02/27/2026 
// Design Name: 
// Module Name:    Even_odd_detector 
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
module Even_odd_detector(
      input [3:0] num,
		output even_odd
    );


       assign even_odd=~num[0];
	 

endmodule
