`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:21:05 05/16/2026 
// Design Name: 
// Module Name:    I2C_master 
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
module I2C_master(
  input clk,rst_n,start,
  input [6:0] addr,
  input [7:0] tx_data,
  inout sda,
  output reg  scl,ack_error,done
    );
	 
	 
  localparam idle=3'b000,start_fsm=3'b001,addr_rw=3'b010,ack_wait=3'b011,write_dt=3'b100,stop=3'b101;

  reg [3:0] bit_count;  
  reg [2:0] state;	 
  reg [7:0] shift_reg;
  
  
  reg sda_out;
  reg sda_oe;
  
  assign sda=sda_oe?sda_out:1'bz;
  
  reg [7:0] clk_div;
  reg i2c_clk;
  
  always@(posedge clk or negedge rst_n)begin
   if(!rst_n) begin
	    clk_div<=0;
		 i2c_clk<=0;
	end else begin
       if(clk_div==8'd24) begin
            clk_div<=0;
            i2c_clk<=~i2c_clk;
        end else begin
            clk_div<=clk_div+1;
         end
        end
      end
		
  always@(posedge i2c_clk or negedge rst_n) begin
      if(!rst_n)begin
       state<=idle;
       scl<=1'b1;
       sda_out<=1'b1;
       sda_oe<=1'b1;
       done<=1'b0;
       ack_error<=1'b0;
       end else begin
          case(state)		 
              idle:begin
				      done<=1'b0;
						scl<=1'b1;
						sda_out<=1'b1;
						sda_oe<=1'b1;
					if(start_fsm) begin
                 shift_reg<={addr,1'b0};
                 state<=start_fsm;
					 end
               end
         start_fsm:begin
             sda_out<=1'b0;
             scl<=1'b1;	
             bit_count<=4'd7;
             state<=addr_rw;
            end
        addr_rw:begin
           scl<=~scl;
           if(scl==1'b0)begin
            sda_out<=shift_reg[bit_count];
             if(bit_count==0)begin				
				 state<=ack_wait;
				 end else begin
				    bit_count<=bit_count-1;
					 end
					end
            end


     ack_wait:begin
        scl<=~scl;
        if(scl==1'b0) begin
           sda_oe<=1'b0;
      end else if(scl == 1'b1) begin
         ack_error<=sda;
         shift_reg<=tx_data;
         bit_count<=4'd7;
         sda_oe<=1'b1;
			state<=idle;
			end
		end

       default:state<=idle;
     endcase
    end
  end	 
      			
endmodule
