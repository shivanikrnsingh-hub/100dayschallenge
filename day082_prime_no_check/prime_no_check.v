`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:07:08 02/28/2026 
// Design Name: 
// Module Name:    prime_no_check 
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
module prime_no_check(
    input clk,reset,start,
	 input [3:0] num,
	 output reg prime,Done
    );
     
	  reg [3:0] sub_reg;
	  reg [3:0] i;
	  reg [2:0] state;
	  
     localparam [2:0] idle=3'b000,even_check=3'b001,evaluate=3'b010,modulo_sub=3'b011,done=3'b100;
	 
		 always@(posedge clk)
		  begin
			 if(reset)begin
			 state<=idle; 
			 prime<=1'b0;
			 Done<=1'b0;
			 end		 
			 else
			 begin
			 case(state)
			 
       	idle:if(start)begin
              state<=even_check;
              prime<=1'b0;	
              Done<=1'b0;end
              else
              state<=idle;

         even_check:
			           if(num<2)
						    begin
							 prime<=1'b0;
							 state<=done;
							 end
						  else if(num==2)begin
						    prime<=1'b1;
							 state<=done;end
						  else if(num[0]==0)begin
                    prime<=1'b0;
                    state<=done;
						  end
						  else begin
						  i<=3;
						  state<=evaluate;
						  end
         evaluate:begin
			          if(i*i>num)begin
						 prime<=1'b1;
						 state<=done;end else
						 begin
                   sub_reg<=num;
						 state<=modulo_sub;
						  end
						  end
			modulo_sub:begin
                    if(sub_reg>=i)begin
                       sub_reg<=sub_reg-i;
							  state<=modulo_sub;
							  end
                    else begin
                        if(sub_reg==0)begin
                       prime<=1'b0;
                       state<=Done;
                       end
                     else 
						 
						   begin
                     i<=i+2;
                     state<=evaluate;
                     end
                   end	
                  end						 
         done:begin
              Done<=	1'b1;
              state<=idle;
              end

         endcase
       end     
	  end			
endmodule
