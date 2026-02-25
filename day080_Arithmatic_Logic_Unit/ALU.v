`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:48:21 02/24/2026 
// Design Name: 
// Module Name:    ALU 
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
module ALU(
      input [3:0] A,B,
		input clk,
		input [3:0] op_sel,
		output reg [3:0] Result,
		output reg carry,sign,overflow,zero
    );

    reg [3:0] result_buff;
    reg [4:0] comp_result;
    reg over,ca;
	 reg [7:0] mult_result;
	 
	 always@(*)begin
	   
		result_buff=4'b0000;
		mult_result=8'b00000000;
		comp_result=4'b0000;
		ca=1'b0;
		over=1'b0;
	   case(op_sel)
	  4'b0000:begin//addition
	          comp_result=A+B;
				 ca=comp_result[4];
				 result_buff=comp_result[3:0];
				 over=(A[3]==B[3])&&(result_buff[3]!==A[3]);
				 end
		
     4'b0001:begin//subtraction
	          comp_result=A-B;
				 ca=comp_result[4];
				 result_buff=comp_result[3:0];
				 over=(A[3]!==B[3])&&(result_buff[3]==A[3]);
				 end
		
     4'b0010://anding
             result_buff=A&B;
     4'b0011://oring        				 
             result_buff=A|B;
     4'b0100://EXOR       				 
             result_buff=A^B;
     4'b0101://NOT        				 
             result_buff=~A;
				 
     4'b0110://multiplication 
	          begin       				 
             mult_result=A*B;
				 result_buff=mult_result[3:0];
				 end
    // 4'b0111://divide        				 
         //    result_buff=(B!==0)?A/B:4'b0000;
    				 
	  4'b1000://        				 
             result_buff=A<<1;//left shift
     4'b1001://        				 
             result_buff=A>>1;//right shift
    				 
	  4'b1010://increment        				 
             result_buff=A+1;
     4'b1011://decrement        				 
             result_buff=A-1;
				 
	  4'b1100://equality check
	         result_buff=(A==B)?4'b0001:4'b0000;	
     4'b1101://greater than check
             result_buff=(A>B)?4'b0001:4'b0000;	  
     default:
	  result_buff=4'b0000;	  
	  			 
     endcase
    end	

    always@(posedge clk)
          begin
			 Result<=result_buff;
			 carry<=ca;
			 overflow<=over;
			 zero<=(result_buff==4'b0000);
			 sign<=result_buff[3];
			 
     		end	 
				 
endmodule
