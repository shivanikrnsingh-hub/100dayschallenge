`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:53:46 02/22/2026 
// Design Name: 
// Module Name:    dual_port_ram 
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
module dual_port_ram #(parameter data_width=8,parameter addr_width=7)(
        input [addr_width-1:0] addr_a,addr_b,
		  input [data_width-1:0] data_in_a,data_in_b,
		  input clk,reset,wr_a,wr_b,
		  output reg [data_width-1:0] data_a,data_b,
		  output reg busy
    );

      
    reg [data_width-1:0] ram [2**addr_width-1:0];
	 
	 always@(posedge clk)
		 begin 
			if(reset)
			 begin
			 busy<=1'b0;
			 data_a<=1'b0;
			 data_b<=1'b0;
			 end
		    else 
			  begin
				 if(wr_a&&wr_b&&(addr_a==addr_b))
				    begin
					  busy<=1'b1;
					  ram[addr_a]<=data_in_a;
					  data_a<=ram[addr_a];
					  //a<b(priority)
				    end
					  else
					   begin
						busy<=1'b0;
						if(wr_a)
							ram[addr_a]<=data_in_a;
	             	else 
                     data_a<=ram[addr_a];

						 if(wr_b)
						 
							ram[addr_b]<=data_in_b;
						 else
							data_b<=ram[addr_b];
							
						end	
            end		
        end
	
endmodule
