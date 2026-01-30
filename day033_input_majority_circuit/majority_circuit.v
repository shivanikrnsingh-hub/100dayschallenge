`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:53:59 01/16/2026 
// Design Name: 
// Module Name:    majority_circuit 
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
module majority_circuit( 
input [6:0] in,
output   out
    );
wire [2:0] test;

assign test[0] =(in[0]&in[1]|in[0]&in[2]|in[1]&in[2]);
assign test[1] =(in[3]&in[4]|in[3]&in[5]|in[4]&in[5]);
assign test[2] =in[6];

assign out=test[0]&test[1]|test[1]&test[2]|test[0]&test[2];


endmodule
