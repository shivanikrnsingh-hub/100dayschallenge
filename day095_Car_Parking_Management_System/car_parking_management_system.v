`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:24:33 05/21/2026 
// Design Name: 
// Module Name:    car_parking_management_system 
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
module car_parking_management_system #(parameter max_count = 15
    )(
	 input clk,
	 input rst_n,
	 input car_entering,car_exiting,
	 input [1:0] passward,
	 
	 output reg green_led,red_led,
	 output reg [3:0] vacant_spaces
	 );
	 
	 localparam idle=2'b00,wait_pass=2'b01,open_gate=2'b10;
	 
	 reg[1:0] current_state,next_state;
	 reg[3:0] car_count;
	 
	 always@(posedge clk or negedge rst_n) begin
	  if(!rst_n)
	      current_state<=idle;
	  else
         current_state<=next_state;
    end


   always@(*)begin
    next_state=current_state;
      case(current_state)
          idle:begin
              if(car_entering&&(car_count<max_count))
                  next_state=wait_pass;
              else
                  next_state=idle;
            end
   
         wait_pass:begin
             if(passward==2'b10)
                next_state=open_gate;
              else
                next_state=idle;
           end
     open_gate:begin
          next_state=idle;
           end
         default:next_state=idle;
     endcase
    end


   always@(*)begin
     green_led=1'b0;
     red_led=1'b0;

     case(current_state)
          idle:begin
              if(car_count==max_count)
                   red_led=1'b1;
               end
            wait_pass:begin
                red_led=1'b1;
            end
            open_gate:begin
                green_led=1'b1;
            end
          endcase
         end


  always@(posedge clk or negedge rst_n)
         begin
          if(!rst_n)begin
            car_count<=4'd0;
         end else begin
             if((current_state==wait_pass)&&(passward==2'b10)&&(car_count<max_count))begin
                 car_count<=car_count+1;
               end
					else if(car_exiting && (car_count>0))begin
					  car_count<=car_count-1;
					 end 
            end
          end


   always@(*)begin
       vacant_spaces=max_count-car_count;
    end		 


endmodule
