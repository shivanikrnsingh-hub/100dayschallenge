`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:38:33 03/20/2026 
// Design Name: 
// Module Name:    Hamming_code_error_detector 
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
module Hamming_code_error_detector(
       input[6:0] code_in,
       output [3:0] data_out,
		 output [2:0] error_position,
       output [6:0] cor_code,
       output error_detected		 
	 
	 );
	 
wire d1,d2,d3,d4;
wire p1,p2,p3;
wire s1,s2,s3;	 

reg [6:0] corrected;

assign {d4,d3,d2,p3,d1,p2,p1}=code_in;
//1,3,5,7
assign s1=d4^d2^d1^p1;
//2,3,6,7
assign s2=d4^d3^d1^p2;
//4,5,6,7
assign s3=d4^d3^d2^p3;

assign error_position={s3,s2,s1};
assign error_dectected=(error_position!=3'b000);
always@(*)begin
 corrected=code_in;
 if(error_detected)begin
 corrected[error_position-1]= ~code_in[error_position-1];
 end	
 end
 assign corrected_code=corrected;
 
 assign data_out[0]=corrected[2];
 assign data_out[1]=corrected[4];
 assign data_out[2]=corrected[5];
 assign data_out[3]=corrected[6];
  

endmodule
