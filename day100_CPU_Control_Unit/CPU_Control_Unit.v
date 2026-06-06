`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:42:58 06/06/2026 
// Design Name: 
// Module Name:    CPU_Control_Unit 
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
module CPU_Control_Unit( 
        input reset,clk,zero_flag,carry_flag,
		  input [2:0] opcode,
		  output reg [2:0] alu_sel,
		  output reg pc_enable,
		  output reg ir_load,
		  output reg reg_write,
		  output reg mem_read,
		  output reg mem_write,
		  output reg halt
    );

    localparam RESET=3'b000,FETCH=3'b001,DECODE=3'b010,EXECUTE=3'b011,STOP=3'b100;
	 
	 reg [2:0] state,next_state;
	 
	 always@(posedge clk)
	 begin
	   if(reset)
		   state<=RESET;
			else
			  state<=next_state;
	end


   always@(*) begin
    	case(state)
		
		RESET:
		  next_state=FETCH;
		  
		FETCH:
		   next_state=DECODE;  
		DECODE:	
          begin
			 
			 case(opcode)
			 
			 3'b001,
			 3'b010,
			 3'b011,
			 3'b100:
			   next_state=EXECUTE;
				
			 3'b111:
            next_state=STOP;
          default:
          		 next_state=FETCH;
			 endcase
         end			 
         STOP:
             next_state=STOP;
        
          default:
            next_state=RESET;
           endcase
        end			  

      always@(*)begin
		
		pc_enable=0;
		ir_load=0;
		reg_write=0;
		mem_read=0;
		mem_write=0;
		alu_sel=0;
		halt=0;
		
		case(state)
		
		FETCH:
		begin
		 ir_load=1;
		 pc_enable=1;
		end


      EXECUTE:
      case(opcode)
      3'b001:begin
             mem_read=1;
             reg_write=1;				 
             end
		3'b010:begin
             mem_write=1;
             end
       3'b011:begin				 
              alu_sel=3'b001;
              reg_write=1;
              end
		 3'b100:begin
              alu_sel=3'b010;
              reg_write=1;
              end

       3'b110:begin
              pc_enable=1;
              end

         endcase

       STOP:halt=1;
       endcase
       end		 
endmodule
