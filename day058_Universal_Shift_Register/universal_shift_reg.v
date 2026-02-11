`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:27:00 02/08/2026 
// Design Name: 
// Module Name:    universal_shift_reg 
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
module universal_shift_reg(
         input clk,reset,shift_left,shift_right,
			input [7:0] parallel_in,
			output [7:0] parallel_out
    );
reg [7:0] reg_data;
    always@(posedge clk)
	  begin
	   if(reset)
		  reg_data<=8'h00;
		  else
		   begin
			case({shift_left,shift_right})
         2'b10:reg_data<={reg_data[6:0],1'b0};
			2'b01:reg_data<={1'b0,reg_data[7:1]};
	      2'b11:reg_data<= parallel_in;   
	      default:reg_data<=reg_data;
			endcase
	  
	  
	  end
end
     assign parallel_out=reg_data;	  
	 
endmodule
