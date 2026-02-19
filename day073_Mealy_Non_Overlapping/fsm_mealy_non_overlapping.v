`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:54:29 02/19/2026 
// Design Name: 
// Module Name:    fsm_mealy_non_overlapping 
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
module fsm_mealy_non_overlapping(
        input din,clk,reset,
		  output reg out
    );
	 
	 
	 reg [2:0]current_state,next_state;
	 
	 localparam [2:0] S0=3'b000,
	                  S1=3'b001,
							S2=3'b010,
							S3=3'b011,
							S4=3'b100;
	 
	 
	 always@(posedge clk)
	 begin
	  if(reset)
	    current_state<=S0;
		 else
		 current_state<=next_state;
     end
	  
	  
	 always@(current_state,din)
         case(current_state)	
              S0:if(din==1'b1)
				  begin
				   next_state=S1;
					out=1'b0;
				  end	
				  else
				   begin
				   next_state=S0;
					out=1'b0;
				  end	
              S1:if(din==1'b1)
				  begin
				   next_state=S2;
					out=1'b0;
				  end
              else				  
				  begin
				   next_state=S0;
					out=1'b0;
				  end	
				  S2:if(din==1'b0)
				  begin
				   next_state=S3;
					out=1'b0;
				  end 
				  else
				  begin
				   next_state=S2;
					out=1'b0;
				  end	
				  S3:if(din==1'b1)
				  begin
				   next_state=S4;
					out=1'b0;
				  end 
				  else
				  begin
				   next_state=S0;
					out=1'b0;
				  end	
				  S4:if(din==1'b1)
				  begin
				   next_state=S0;
					out=1'b1;
				  end 
				  else
				  begin
				   next_state=S0;
					out=1'b0;
				  end
             default:begin
				         next_state=S0;
                     out =1'b0;	
                     end							
        
       endcase
		 
endmodule
