`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:35:27 03/06/2026 
// Design Name: 
// Module Name:    Armstrong_no_check 
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
module Armstrong_no_check(
    input [7:0] num_in,
	 input  clk,reset,
	 output reg armstrong_no
    );

    
    reg[2:0] current_state,next_state;
	 reg[3:0] p,q,r;
	 reg[11:0] BCD_num;
	 reg[11:0] p3,q3,r3;
	 reg [11:0] sum_all ;
	 reg [7:0] temp_num;
	 

	 
	 localparam idle=3'b000,digit_load=3'b001,cube=3'b010,sum=3'b011,compare=3'b100;
	 
	 
	 always@(posedge clk)
	  

	  begin
	   if(reset)
		  begin
		  current_state<=idle;
		  temp_num<=1'b0;
		  
		  end
		  else begin
		  current_state<=next_state;
		  temp_num<=num_in;
		end  
	  end
	  always@(*)
	  
	  begin
	  
	  BCD_num=BCD(temp_num);
	  p=BCD_num[11:8];
	  q=BCD_num[7:4];
	  r=BCD_num[3:0];
	  p3=p*p*p;
     q3=q*q*q;
     r3=r*r*r;
	  sum_all=p3+q3+r3;
	  next_state=current_state;
	  
	  
	  case(current_state)
	   idle:begin
		     
		     armstrong_no =1'b0;
		     next_state=digit_load;
		      end
		digit_load:begin
		           
					  armstrong_no=1'b0;
					  next_state=cube;
					  end
		cube:begin
           			
            armstrong_no=1'b0;				
			   next_state=sum;
				
				end
				
		 sum:begin
           
			  armstrong_no=1'b0;
           next_state=compare;
           end
       compare:
           if(sum_all==temp_num)begin
              armstrong_no=1'b1;
				   next_state=idle;end
           else
			   begin
           	armstrong_no=1'b0;
            next_state=idle;				
	         end
		  endcase		
		end		
	 
	 
	 
	 
	 
	 
	 function [11:0]BCD;
	 input [7:0] data;
    reg [3:0] bit0,bit1,bit2;
    
		 integer n;
        begin
		  bit0=0;bit1=0;bit2=0;
		  for(n=0;n<8;n=n+1)
			begin
			  if(bit0>4)bit0=bit0+3;
			  if(bit1>4)bit1=bit1+3;
			  if(bit2>4)bit2=bit2+3;
			  {bit2,bit1,bit0}={bit2,bit1,bit0,data[7-n]};
			 end
			 BCD={bit2[2:0],bit1,bit0};		 
		end
	endfunction
	  
endmodule
