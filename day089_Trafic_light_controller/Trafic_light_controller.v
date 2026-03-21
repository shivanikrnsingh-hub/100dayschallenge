`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:19:37 03/21/2026 
// Design Name: 
// Module Name:    Trafic_light_controller 
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
module Trafic_light_controller(
    input clk,reset,
	 output reg [2:0] light_M1,
	 output reg [2:0] light_S,
	 output reg [2:0] light_MT,
	 output reg [2:0] light_M2
	 );


localparam [2:0] s1=3'b000,s2=3'b001,s3=3'b010,s4=3'b011,s5=3'b100,s6=3'b101;
reg [3:0] count;
reg [2:0] present_s;
localparam [2:0] sec7=3'b111,sec5=3'b101,sec2=3'b010,sec3=3'b011;

	always@(posedge clk or posedge reset)
	begin
	 if(reset)
	  begin
	  present_s<=s1;
	  count<=0;
	  end
	  else
	   begin
		case(present_s)
		 s1:if(count<sec7)begin
		     present_s<=s1;
			  count<=count+1;
			  end
			  else
			   begin
			   present_s<=s2;
				count<=0;
				end
		 s2:if(count<sec2)begin
           present_s<=s2;
           count<=count+1;	
           end
           else
            begin
             present_s<=s3;
             count<=0;
            end
       s3:if(count<sec5)begin
           present_s<=s3;
           count<=count+1;
           end
           else
            begin
            present_s<=s4;
				count<=0;
				end				
        s4:if(count<sec2)
		     begin
			  present_s<=s4;
			  count<=count+1;
			  end
			  else
			  begin
			  present_s<=s5;
			  count<=0;
			  end
		 s5:if(count<sec3)
          begin
          present_s<=s5;
          count<=count+1;
          end
          else
          begin
          present_s<=s6;
			 count<=0;
			 end	
      s6:if(count<sec2)
          begin
          present_s<=s6;
          count<=count+1;
          end
          else
          begin
          present_s<=s1;
			 count<=0;
			 end
      default:begin
		        present_s<=s1;
              count<=0;
              end				  
       endcase
     end
	 end  
	 
	 
	 always@(*)
	    begin
		   case(present_s)
			s1:
			begin
			light_M1=3'b001;
		   light_M2=3'b001;
			light_MT=3'b100;
			light_S=3'b100;
			end
			
			s2:
			begin
			light_M1=3'b001;
		   light_M2=3'b010;
			light_MT=3'b100;
			light_S=3'b100;
			end
	      
			s3:
			begin
			light_M1=3'b001;
		   light_M2=3'b100;
			light_MT=3'b001;
			light_S=3'b100;
			end
			
			s4:
			begin
			light_M1=3'b010;
		   light_M2=3'b100;
			light_MT=3'b010;
			light_S=3'b100;
			end
			
			s5:
			begin
			light_M1=3'b100;
		   light_M2=3'b100;
			light_MT=3'b100;
			light_S=3'b001;
			end
			
			s6:
			begin
			light_M1=3'b001;
		   light_M2=3'b010;
			light_MT=3'b100;
			light_S=3'b010;
			end
			default:begin
			 light_M1=3'b000;
		   light_M2=3'b000;
			light_MT=3'b000;
			light_S=3'b000;
			 end
		  endcase
      end		  

endmodule
