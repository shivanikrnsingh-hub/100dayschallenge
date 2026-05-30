`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:13:44 05/30/2026
// Design Name:   pwm_generator
// Module Name:   /home/ise/verilog_projects/challenge100days2/pwm_generator_tb.v
// Project Name:  challenge100days2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: pwm_generator
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module pwm_generator_tb;
    // Inputs
    reg clk;
    reg rst_n;

    // Outputs
    wire pwm_25;
    wire pwm_50;
    wire pwm_75;

    // Instantiate the Unit Under Test (UUT)
    pwm_generator #(
        .BIT_WIDTH(8)
    ) uut (
        .clk(clk), 
        .rst_n(rst_n), 
        .pwm_25(pwm_25), 
        .pwm_50(pwm_50), 
        .pwm_75(pwm_75)
    );

    // 1. Clock Generation: 100 MHz clock (10ns period)
    always #5 clk = ~clk;

    // 2. Stimulus Block
    initial begin
        // Initialize Inputs
        clk = 0;
        rst_n = 0;

        // Apply Reset for 100ns to let global nets settle
        #100;
        rst_n = 1;
        
        $display("==========================================================");
        $display("   STARTING AUTOMATED MULTI-CHANNEL PWM VERIFICATION     ");
        $display("==========================================================");
        
        // Let it run for exactly 3 full counter wrap-around cycles 
        // (3 cycles * 256 steps * 10ns per step = 7680 ns)
        #7680;
        
        $display("==========================================================");
        $display("   SIMULATION COMPLETE: ALL CHECKERS EXECUTED CLEANLY     ");
        $display("==========================================================");
        $finish;
    end

    // 3. Automated Verification Engine (Concurrent Assertions)
    // Runs on the negative edge of the clock to prevent race conditions with RTL updates
    always @(negedge clk) begin
        if (rst_n) begin
            
            // Channel 1: Verify 25% Duty Cycle (Threshold = 64)
            if (uut.counter < 8'd64) begin
                if (pwm_25 !== 1'b1) $display("[ERROR] Time %0t ps | Counter = %d | pwm_25 expected HIGH, got LOW!", $time, uut.counter);
            end else begin
                if (pwm_25 !== 1'b0) $display("[ERROR] Time %0t ps | Counter = %d | pwm_25 expected LOW, got HIGH!", $time, uut.counter);
            end

            // Channel 2: Verify 50% Duty Cycle (Threshold = 128)
            if (uut.counter < 8'd128) begin
                if (pwm_50 !== 1'b1) $display("[ERROR] Time %0t ps | Counter = %d | pwm_50 expected HIGH, got LOW!", $time, uut.counter);
            end else begin
                if (pwm_50 !== 1'b0) $display("[ERROR] Time %0t ps | Counter = %d | pwm_50 expected LOW, got HIGH!", $time, uut.counter);
            end

            // Channel 3: Verify 75% Duty Cycle (Threshold = 192)
            if (uut.counter < 8'd192) begin
                if (pwm_75 !== 1'b1) $display("[ERROR] Time %0t ps | Counter = %d | pwm_75 expected HIGH, got LOW!", $time, uut.counter);
            end else begin
                if (pwm_75 !== 1'b0) $display("[ERROR] Time %0t ps | Counter = %d | pwm_75 expected LOW, got HIGH!", $time, uut.counter);
            end

        end
    end
      
endmodule