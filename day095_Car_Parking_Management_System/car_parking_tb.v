`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:48:20 05/21/2026
// Design Name:   car_parking_management_system
// Module Name:   /home/ise/verilog_projects/challenge100days2/car_parking_tb.v
// Project Name:  challenge100days2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: car_parking_management_system
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module car_parking_tb;

    // Inputs
    reg clk;
    reg rst_n;
    reg car_entering;
    reg car_exiting;
    reg [1:0] passward;

    // Outputs
    wire green_led;
    wire red_led;
    wire [3:0] vacant_spaces;

    // Instantiate the Unit Under Test (UUT)
    car_parking_management_system #(
        .max_count(15)
    ) uut (
        .clk(clk), 
        .rst_n(rst_n), 
        .car_entering(car_entering), 
        .car_exiting(car_exiting), 
        .passward(passward), 
        .green_led(green_led), 
        .red_led(red_led), 
        .vacant_spaces(vacant_spaces)
    );

    // Clock Generation: 10ns period (50MHz)
    always #5 clk = ~clk;

    initial begin
        // Initialize Inputs
        clk = 0;
        rst_n = 0;
        car_entering = 0;
        car_exiting = 0;
        passward = 0;

        // Global Reset Phase
        #20;
        rst_n = 1;
        #25; // Align close to clock edges
        
        $display("[STATUS] Initial Vacant Spaces: %d", vacant_spaces);
        
        // --- CASE 1: Correct Password ---
        $display("\n--- Case 1: Car arrives with correct passcode ---");
        @(posedge clk);
        car_entering = 1;
        @(posedge clk);
        car_entering = 0;
        passward = 2'b10;
        @(posedge clk);
        passward = 2'b00;
        
        @(negedge clk); // Allow state machine loop processing
        $display("Result -> Green LED (Gate Open): %b, Vacant Spaces: %d", green_led, vacant_spaces);

        // --- CASE 2: Wrong Password ---
        $display("\n--- Case 2: Car arriving with wrong password ---");
        @(posedge clk);
        car_entering = 1;
        @(posedge clk);
        car_entering = 0;
        passward = 2'b01; // Invalid pass
        @(posedge clk);

		 
        $display("Result -> Red LED (Denied): %b, Vacant Spaces: %d", red_led, vacant_spaces);
         @(posedge clk);
			passward = 2'b01;
        // --- CASE 3: Fill Remaining 14 Spots ---
        $display("\n--- Case 3: Filling remaining spaces up to capacity ---");
        // We already have 1 car inside from Case 1. Let's add 14 more.
        repeat(14) begin
            @(posedge clk);
            car_entering = 1;
            @(posedge clk);
            car_entering = 0;
            passward = 2'b10;
            @(posedge clk);
            passward = 2'b00;
            repeat(2) @(posedge clk); 
        end
        $display("Result -> Lot status filled. Vacant Spaces: %d, Red LED (Full Indicator): %b", vacant_spaces, red_led);

        // Try entering when completely full
        $display("\n--- Case 3b: Attempting entry when no space available ---");
        @(posedge clk);
        car_entering = 1;
        @(posedge clk);
        car_entering = 0;
        
        repeat(2) @(posedge clk);
        $display("Result -> Vacant Spaces: %d, Red LED (Denied): %b", vacant_spaces, red_led);

        // --- CASE 4: Car Exiting ---
        $display("\n--- Case 4: Car exiting ---");
        @(posedge clk);
        car_exiting = 1;
        @(posedge clk);
        car_exiting = 0;
        
        repeat(2) @(posedge clk);
        $display("Result -> Car departed. Vacant Spaces recovered to: %d", vacant_spaces);
        
        #50;
        $display("\n[SUCCESS] Day 095 Parking System Verification Finished Cleanly!");
        $finish;
    end
              
endmodule