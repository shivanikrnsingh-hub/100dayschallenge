`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:31:04 01/17/2026 
// Design Name: 
// Module Name:    binary_2compliment 
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
module binary_2compliment(

input [3:0] data,
output [3:0] com_out
    );
wire [3:0] temp;

  assign temp = 4'b1111-data;
  assign com_out = temp+1;  

endmodule
