`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:14:29 05/21/2026 
// Design Name: 
// Module Name:    vendig_machine 
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
module vendig_machine(
    input clk,rst_n,nickel,dime,
	 output reg dispense,change
	 
	 
	 );

    localparam s_0=2'b00,s_5=2'b01,s_10=2'b10;
	 
	 reg [1:0] current_state,next_state;
	 
	 
	 always@(posedge clk or negedge rst_n) begin
	    if(!rst_n)
		     current_state<=s_0;
			  else
			   current_state<=next_state;
			end


    always@(*)begin
         next_state=current_state;
          case(current_state)
                s_0:begin
                  if(nickel)
						   next_state=s_5;
						 else if(dime)
						   next_state=s_10;
						end
                 s_5:begin
                    if(nickel) next_state=s_10;
                    else if (dime) next_state=s_0;
                   end
              s_10:begin
                  if(nickel||dime)
                      next_state=s_0;
							 end
				default:next_state=s_0;
          endcase
        end			 
	

    always@(*)begin
        dispense=0;
        change=0;
        case(current_state)
           s_0:begin
              dispense=0;
               change=0;
              end
            s_5:begin
                if(dime)dispense=1;				
               end
             s_10:begin
                if(nickel) dispense=1;
                 else if(dime) begin
                      dispense=1;
                      change=1;
                 end
                 end
               endcase
             end
       
    		 
	 
endmodule
