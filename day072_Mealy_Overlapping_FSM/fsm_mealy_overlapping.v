`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:15:56 02/20/2026 
// Design Name: 
// Module Name:    fsm_mealy_overlapping 
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
module fsm_mealy_overlapping(
     input clk,reset,din,
	  output reg out
    );
      
		reg [2:0] current_state,next_state;
		
		localparam [2:0] S0=3'b000;
		localparam [2:0] S1=3'b001;
		localparam [2:0] S2=3'b010;
		localparam [2:0] S3=3'b011;
		localparam [2:0] S4=3'b100;
		
		
		
		
		always@(posedge clk)
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
           next_state=S4;
           out=1'b0;
          end
		 S4:if(din==1'b1)
		    begin
		      next_state=S2;
				out=1'b1;
			 end	
			 else
           begin
           next_state=S0;
           out=1'b0;
          end
		   endcase
		end
		
endmodule
