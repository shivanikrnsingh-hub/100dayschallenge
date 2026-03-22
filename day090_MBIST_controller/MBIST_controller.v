`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:42:33 03/21/2026 
// Design Name: 
// Module Name:    MBIST_controller 
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
module MBIST_controller(
     input clk,reset,start_test,
	  input [7:0] ram_data_out,
	  output reg [3:0] bist_addr,
	  output reg [7:0] bist_data_in,
	  output reg bist_wr_en,
	  output reg test_done,test_fail
    );
	 
	 
	 localparam [1:0] idle=2'b00,write_addr=2'b01,read_ram=2'b10;
	 
	 reg [1:0] state;
	 
	 reg [3:0] count;
	 
	 always@(posedge clk)
	   begin
		 if(reset)begin
		   state<=idle;
			test_done<=0;
			test_fail<=0;
			count<=0;
			end
			else
			 begin
			  case(state)
			  idle: if(start_test)begin
                 state<=write_addr;	
					  test_done<=0;
					  end
                 else
                 state<=idle;
           write_addr: begin
			              bist_addr<=count;
							  bist_data_in<=8'haa;
			              bist_wr_en<=1;
			              if(count==15)begin					  
					        count<=0;
				           state<=read_ram;
							  end
							  else
							  count<=count+1;
							  end
			  read_ram: begin
			            bist_wr_en<=0;
							bist_data_in<=8'h00;
							bist_addr<=count;
							if(ram_data_out!=8'haa)begin
							 test_fail<=1;
							end
                     if(count==15)begin
                     test_done<=1;	
                     state<=idle;
                     end							
			            else
							count<=count+1;
			            end
           default:state<=idle;         	
						endcase
             end
           end				 
							
                       							
			 
		   

endmodule
