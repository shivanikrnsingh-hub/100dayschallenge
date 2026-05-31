`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:15:40 05/31/2026 
// Design Name: 
// Module Name:    Time_Keeper 
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
module Time_Keeper(
    input wire clk,      
    input wire rst_n,
    output reg [5:0] sec_count,  // 0 to 59 needs 6 bits
    output reg [5:0] min_count   // 0 to 59 needs 6 bits
);

    wire minute_tick;
    
        assign minute_tick = (sec_count == 6'd59);

    // 1. Seconds Counter Logic
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            sec_count <= 6'd0;
        end else begin
            if (minute_tick) begin
                sec_count <= 6'd0;
            end else begin
                sec_count <= sec_count + 1'b1;
            end
        end
    end

    // 2. Minutes Counter Logic 
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            min_count <= 6'd0;
        end else if (minute_tick) begin
            if (min_count == 6'd59) begin
                min_count <= 6'd0;
            end else begin
                min_count <= min_count + 1'b1;
            end
        end
    end

endmodule
