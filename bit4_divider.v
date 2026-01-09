`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:19:00 01/08/2026 
// Design Name: 
// Module Name:    bit4_divider 
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
module bit4_divider(
input [3:0] divident,divisor,
output reg [3:0] q,r
    );
integer i;
always@(*)begin
q=0;
r=divident;
if(divisor==0)
begin
 q=0;
 r=divident;
 end
 else
 begin
 for(i=0;i<=16;i=i+1)begin
 if(r>=divisor)begin
 r=r-divisor;
 q=q+1;
 end 
 end 
 end
 end
 endmodule
