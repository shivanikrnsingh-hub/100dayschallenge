`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    05:43:39 02/16/2026 
// Design Name: 
// Module Name:    One_Hot_FSM 
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
module One_Hot_FSM(
       input reset,clk,
       output reg [3:0] state,
		 output reg [1:0] out
    );
   
	localparam [3:0]IDLE=4'B0001,
	                State1=4'b0010,
                   State2=4'b0100,
				       State3=4'b1000;
						 
	always@(posedge clk or posedge reset)
   begin
   if(reset)begin
           state<=IDLE;
           out<=2'b00;
			  end else
               begin
                 case(state)
                 IDLE:begin
			        out<=2'b00;
			        state<=State1;
			        end
			
			        State1:begin
			         out<=2'b01;
			         state<=State2;
			        end
			
			        State2:begin
			         out<=2'b10;
			         state<=State3;
			        end
			
			        State3:begin
			         out<=2'b11;
			         state<=IDLE;
			        end
			
			       default:begin
			         out<=2'b00;
			         state<=IDLE;
            
	               end
					endcase	
             end
          end				 
 endmodule
