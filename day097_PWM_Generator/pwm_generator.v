`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:09:55 05/30/2026 
// Design Name: 
// Module Name:    pwm_generator 
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

module pwm_generator #(
    parameter BIT_WIDTH = 8
)(
    input wire clk,
    input wire rst_n,
    output wire pwm_25,  // Changed from reg to wire for combinational assignment
    output wire pwm_50,  
    output wire pwm_75   
);

    // Master Counter Register
    reg [BIT_WIDTH-1:0] counter;

    // Thresholds
    localparam THRESHOLD_25 = 8'd64;
    localparam THRESHOLD_50 = 8'd128;
    localparam THRESHOLD_75 = 8'd192;

    // 1. Sequential Counter Block
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            counter <= {BIT_WIDTH{1'b0}};
        end else begin
            counter <= counter + 1'b1;
        end
    end

    // 2. Combinational Comparator Blocks (Zero-lag execution)
    assign pwm_25 = (counter < THRESHOLD_25) ? 1'b1 : 1'b0;
    assign pwm_50 = (counter < THRESHOLD_50) ? 1'b1 : 1'b0;
    assign pwm_75 = (counter < THRESHOLD_75) ? 1'b1 : 1'b0;

endmodule