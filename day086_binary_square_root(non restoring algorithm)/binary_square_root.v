`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:50:13 03/07/2026 
// Design Name: 
// Module Name:    binary_square_root 
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
module binary_square_root(
  input [7:0] redicant,
  input reset,clk,
  output reg done,
  output reg [3:0] square_root
    );
	 
	 reg [3:0] Q;
    reg [7:0] A;
	 reg [9:0] remainder;
	 reg [3:0] state;
	 reg [2:0] i;
	 wire [9:0] test_value;
	 assign test_value={4'b0000,Q,2'b01};
	 
	 localparam [2:0] idle=2'b00,calc=2'b01,Done=2'b10;
	 
	 always@(posedge clk)
	  begin
	  if(reset)
	   begin
		state<=0;
		done<=0;
		square_root<=0;
		Q<=0;
		remainder<=0;
		end
		else
		
		begin
		case(state)
		idle:begin
		      done<=0;
				A<=redicant;
            remainder<=0;
            Q<=0;
            i<=2'd3;
            state<=calc;
           end
       calc:begin
            if({remainder[7:0],A[7:6]}>={Q,2'b01})
				begin
            remainder<={remainder[7:0],A[7:6]}-{Q,2'b01};
            Q<={Q[2:0],1'b1};
            end 
				else 
            begin
            remainder<={remainder[7:0],A[7:6]};
            Q<={Q[2:0],1'b0}	;			
			
	         end
				A<=A<<2;
				if(i==0)
				 state<=Done;
				else
            i<=i-1;
            end
				
        Done:begin
             done<=1;
				 square_root<=Q;
				 state<=idle;
				 end
		  default:state<=idle;
       endcase		  
				 
	 end		  
	end			 
	 

endmodule
