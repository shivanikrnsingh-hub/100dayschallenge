`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:37:27 05/02/2026 
// Design Name: 
// Module Name:    SPI_slave 
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
module SPI_slave(
 input sclk,rst_n,mosi,cs_n,
 output reg data_ready,
 output reg [7:0] rx_data
    );

 reg [3:0] bit_count;
 reg [7:0] shift_reg;
 
 
 always@(posedge sclk or negedge rst_n ) begin
  if(!rst_n||cs_n)
   begin
	 bit_count<=0;
	 shift_reg<=0;
	 data_ready<=0;
	end
 
  else
    begin
      shift_reg<={shift_reg[6:0],mosi};	 
		
	 if(bit_count==7)
      begin
       rx_data<={shift_reg[6:0],mosi};
       data_ready<=1;
       bit_count<=0;
      end
    else begin 
       bit_count<=bit_count+1;
       data_ready<=0;
     end
	 end  
   end	  
endmodule
