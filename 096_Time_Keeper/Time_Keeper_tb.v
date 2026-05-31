`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:01:42 05/30/2026
// Design Name:   Time_Keeper
// Module Name:   /home/ise/verilog_projects/challenge100days2/Time_Keeper_tb.v
// Project Name:  challenge100days2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Time_Keeper
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
module Time_Keeper_tb;

    reg clk;
    reg rst_n;
    wire [5:0] sec_count;
    wire [5:0] min_count;

    // Instantiate UUT
    Time_Keeper uut (
        .clk(clk), 
        .rst_n(rst_n), 
        .sec_count(sec_count), 
        .min_count(min_count)
    );

    // High-speed simulation clock
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst_n = 0;

        #50;
        rst_n = 1; // Release reset
        
        // Let it run long enough to see the seconds rollover multiple minutes
        // One full minute = 60 clock ticks * 10ns = 600ns
        #2000; 
        
        $finish;
    end
      
endmodule

