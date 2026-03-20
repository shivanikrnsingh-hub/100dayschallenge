`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:26:01 03/14/2026 
// Design Name: 
// Module Name:    HCF_check 
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
module HCF_check#(parameter N=8)(
     input reset,clk,start,
	  input [N-1:0] in1,in2,
	  output reg [N-1:0] HCF,
	  output reg  done
    );

  reg [N-1:0] a,b;
  reg [2:0] state;
  localparam [2:0] idle=3'b000,compare=3'b001,A=3'b010,B=3'b011,equal_out=3'b100;
  always@(posedge clk or posedge reset)
  begin
          if(reset)
			 begin
           a<=0;
           b<=0;
            done<=0;
            HCF<=0;
				state<=idle;
          end
          else
            begin
            case(state)
             idle:if(start)begin	
                  a<=in1;
                  b<=in2;	
                  done<=0;						
					   state<=compare;
						end
						else
					   state<=idle;
						
				compare:if(a>b)
                    state<=A;
                    else if(b>a)
                    state<=B;
						  else
						  state<=equal_out;
				A:begin
				  a<=a-b;
              state<=compare;
				  end
            B:begin
				  b<=b-a;
				  state<=compare;
				  end
				equal_out:begin
			             HCF<=a;
							 done<=1;
                      state<=idle;
                      end
            endcase
           end
         end		

       	
endmodule
  
  
