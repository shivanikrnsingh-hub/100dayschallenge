`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:57:46 06/04/2026 
// Design Name: 
// Module Name:    I2C_Master_r 
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
module I2C_Master_r(

    input  wire       clk,
    input  wire       rst_n,
    input  wire       start,
    input  wire [6:0] addr,
    output reg      scl,
    inout  wire       sda,
	 output reg        busy,
	 output reg  [7:0] data_out
);


 reg [3:0] state;
 reg [3:0] bit_cnt;
 reg sda_out,sda_oe;
 
 assign sda=sda_oe?sda_out:1'bz;//open-drain condition
 
 localparam IDLE = 0,
            START = 1,
				ADDR = 2,
				ACK1 = 3,
				READ = 4,
				NACK = 5,
				STOP = 6;
				

 always@(posedge clk or negedge rst_n) begin
     if(!rst_n)begin
	   state <= IDLE;
		scl<=1'b1;
		sda_out<=1'b1;
		sda_oe<=1'b1;
		busy<=1'b0;
		bit_cnt<=0;
		data_out<=8'h00;
	end else begin
        case(state)
             IDLE:begin
                scl <= 1'b1;
                sda_out<=1'b1;
                busy <= 1'b0;
                 if(start)begin
                    busy <= 1'b1;
                    state <= START;
           end
          end 
             
              START:begin
                  sda_out<=1'b0;//start condition
                  state <= ADDR;
						bit_cnt<=7;
						end
				
              ADDR:begin
							scl<=1'b0;
							sda_out<=addr[bit_cnt];
							scl<=1'b1;
							if(bit_cnt==0)begin
								state<=ACK1;
								sda_out<=1'b1;//READ bit=1 
							 end else
							  bit_cnt<=bit_cnt-1;
                  end
              ACK1:begin
				       scl<=1'b0;
						 sda_oe<=1'b0;//FOR ACK
						 scl<=1'b1;
						 state<=READ;
						 bit_cnt<=7;
						 end

						
              READ:begin
                  scl <= 1'b0;
						sda_oe<=1'b0;//SLAVE Drives
                  scl <= 1'b1;
						data_out[bit_cnt]<= sda;
                  if(bit_cnt==0)
                     state<=NACK;
                  else
                     bit_cnt<=bit_cnt-1;	
                 end
             					  
				 NACK:begin
                  scl<=1'b0;
                  sda_oe<=1'b1;
						sda_out<=1'b1;//master sends NACK
                  scl<=1'b1;
						state<=STOP;
               end
				STOP:begin
                 scl <=1'b1;
                 sda_out<=1'b0;
                 sda_out<=1'b1;//stop condition
                 state<=IDLE;
                 busy<=1'b0;
           end
         endcase
       end
      end		 
		
endmodule
				