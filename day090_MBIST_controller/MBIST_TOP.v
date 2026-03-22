`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:20:17 03/22/2026 
// Design Name: 
// Module Name:    MBIST_TOP 
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
module MBIST_TOP(
input clk,reset,

input force_error,

input start_test,

output test_done,test_fail
    );
	 
wire [7:0] data_in;//data to ram	 
wire [3:0] addr;
wire [7:0] data_out;//data from ram
wire wr_en;

MBIST_controller MC (
      .clk(clk),.reset(reset),.start_test(start_test),
	  .ram_data_out(data_out),
	  .bist_addr(addr),
	  .bist_data_in(data_in),
	  .bist_wr_en(wr_en),
	  .test_done(test_done),.test_fail(test_fail)   );
	  
	  
MBIST_RAM ram ( 
    .clk(clk),
	 .reset(reset),
	  .addr(addr),
	 .data_in(data_in),
	  .force_error(force_error),
	  .data_out(data_out)
    );

endmodule
