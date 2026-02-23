`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:24:52 02/21/2026 
// Design Name: 
// Module Name:    Multiple_sequence_detector 
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
module Multiple_sequence_detector(
        input clk,reset,din,
		  output reg out
    );
    
 
	reg [2:0] current_state,next_state;
	 
	 localparam [2:0] S0=3'b000,//a
	                  S1=3'b001,//b
	                  S2=3'b010,//c
	                  S3=3'b011,//d
	                  S4=3'b100,//e
	                  S5=3'b101,//f
	                  S6=3'b110;//g
							
							
					always@(posedge clk)
                   begin 
                      if(reset)
                        begin                        
								current_state<=S0;
								end
                      else
                         current_state<=next_state;
                   end

              always@(current_state,din)
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
						     next_state=S4;
							  out=1'b0;
							  end
						  S2:if(din==1'b1)
						     begin
						     next_state=S2;
							  out=1'b0;
							  end
							  else
							  begin
						     next_state=S3;
							  out=1'b0;
							  end
						  S3:if(din==1'b1)
						     begin
						     next_state=S1;
							  out=1'b0;
							  end
							  else
							  begin
						     next_state=S6;
							  out=1'b1;
							  end
						  S4:if(din==1'b1)
						     begin
						     next_state=S5;
							  out=1'b0;
							  end
							  else
							  begin
						     next_state=S6;
							  out=1'b0;
							  end
						  S5:if(din==1'b1)
						     begin
						     next_state=S2;
							  out=1'b0;
							  end
							  else
							  begin
						     next_state=S5;
							  out=1'b1;
							  end
						  S6:if(din==1'b1)
						     begin
						     next_state=S1;
							  out=1'b1;
							  end
							  else
							  begin
						     next_state=S0;
							  out=1'b0;
							  end
					     default:begin
						          next_state=S0;
									 out=1'b0;
									 end
					endcase
             end					

endmodule
