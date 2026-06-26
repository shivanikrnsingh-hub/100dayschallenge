`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:13:50 05/01/2026 
// Design Name: 
// Module Name:    SPI_protocol 
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
module SPI_protocol_master(
   input clk,rst_n,start,
	input [7:0] tx_data,
	output reg sclk,mosi,cs_n,done
    );
	 
	 reg [3:0] bit_count;
	 reg [7:0] clk_div;
    reg [7:0] shift_reg;
	 
	 
	 localparam [1:0] Idle=2'b00,Trans=2'b01,Finish=2'b10;
	 
	 reg [2:0] state;


   always@(posedge clk or negedge rst_n)
	
    if(!rst_n)
	   begin 
		  state<=Idle;
		  cs_n<=1;
		  sclk<=0;
		  done<=1;
		  clk_div<=0;
		end
        else
          begin
           case(state)
              Idle:begin
                   done<=0;
                   sclk<=0;
						 cs_n<=1;
						 if(start)begin 
						   shift_reg<=tx_data;
							bit_count<=0;
							state<=Trans;
							cs_n<=0;
							
							end
							end
				  Trans:begin
				       if(clk_div==4)
                     begin
                      clk_div<=0;
                      sclk<=~sclk;
                       if(sclk==1)							 
						      begin if(bit_count==7)
								  begin
								   state<=Finish;
								end else
								    begin
								    bit_count<=bit_count+1;
                            shift_reg<={shift_reg[6:0],1'b0};
									 end
									end
									end else begin 
									clk_div<=clk_div+1;
									end
									mosi<=shift_reg[7];
									end
              Finish:begin
                     cs_n<=1;
                     done<=1;
                     state<=Idle;
                     end
 						endcase
		       end
		endmodule
