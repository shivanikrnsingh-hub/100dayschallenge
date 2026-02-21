`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:17:50 02/20/2026 
// Design Name: 
// Module Name:    fsm_moore_overlapping 
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
module fsm_moore_overlapping(
       input clk,reset,din,
		 output reg out
    );

  reg [2:0] current_state,next_state;
  
  localparam [2:0] S0=3'b000,
                   S1=3'b001,
						 S2=3'b010,
						 S3=3'b011,
						 S4=3'b100,
						 S5=3'b101;
						 
		always@(posedge clk )
		    begin
            if(reset)
                current_state<=S0;
              else
                current_state<=next_state;
            end	

      always@(din,current_state)
               begin
                case(current_state)
                S0:if(din==1'b1)
					      next_state=S1;
						  else
						   next_state=S0;
                S1:if(din==1'b1)
					      next_state=S2;
						  else
						   next_state=S0;
                S2:if(din==1'b0)
					      next_state=S3;
						  else
						   next_state=S2;
                S3:if(din==1'b1)
					      next_state=S4;
						  else
						   next_state=S0;
                S4:if(din==1'b1)
					      next_state=S5;
						  else
						   next_state=S0;
                S5:if(din==1'b1)
					      next_state=S2;
						  else
						   next_state=S3;
                default:next_state=S0;							
                endcase
               end
    
        always@(*)
               begin
                case(current_state)
                   S0:out=1'b0;
                   S1:out=1'b0;
                   S2:out=1'b0;						 
                   S3:out=1'b0;
						 S4:out=1'b0;
						 S5:out=1'b1;
						 default:out=1'b0;
                endcase
					end 

endmodule
