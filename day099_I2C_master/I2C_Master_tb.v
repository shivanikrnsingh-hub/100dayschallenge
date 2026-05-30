`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:20:54 05/30/2026
// Design Name:   I2C_master
// Module Name:   /home/ise/verilog_projects/minor_project/I2C_Master_tb.v
// Project Name:  minor_project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: I2C_master
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
module I2C_master_tb;

    // Inputs
    reg clk;
    reg rst_n;
    reg start;
    reg [6:0] addr;
    reg [7:0] tx_data;

    // Outputs
    wire scl;
    wire ack_error;
    wire done;

    // Bidirectional I2C Data Line
    wire sda;
    
    // Slave Emulation Variables
    reg slave_sda_out;
    reg slave_drive_en;
    
    // Bidirectional driver logic for the testbench slave side
    assign sda = slave_drive_en ? slave_sda_out : 1'bz;
    
    // CRITICAL: Simulates the required physical external pull-up resistors on the I2C Bus
    pullup(sda);
    pullup(scl);

    // Instantiate Unit Under Test (UUT)
    I2C_master uut (
        .clk(clk), 
        .rst_n(rst_n), 
        .start(start), 
        .addr(addr), 
        .tx_data(tx_data), 
        .sda(sda), 
        .scl(scl), 
        .ack_error(ack_error), 
        .done(done)
    );

    // 1. System Clock Generation (50 MHz Input Master Clock -> 20ns period)
    always #10 clk = ~clk;

    // 2. Stimulus Control Routine
    initial begin
        // Initialize Inputs
        clk = 0;
        rst_n = 0;
        start = 0;
        addr = 7'b0000000;
        tx_data = 8'b00000000;
        
        // Initialize Slave Emulation Control
        slave_sda_out = 1'b1;
        slave_drive_en = 1'b0;

        // Hold Reset for 100ns
        #100;
        rst_n = 1;
        #50;
        
        $display("[SIM] Kickstarting Transaction 1: Address 0x5A (7'b1011010)");
        // Load target slave address and initiate transaction
        addr = 7'b1011010;
        tx_data = 8'hA5;
        start = 1;
        #1000; // Hold start signal open briefly
        start = 0;
        
        // Allow the master ample time to step through its internal clock dividers
        // 50 clock steps per internal toggle takes substantial processing windows
        #60000; 
        
        $display("[SIM] Transaction complete. Analyzing status flags.");
        if (ack_error == 1'b0) begin
            $display("[SUCCESS] Slave successfully acknowledged transaction transmission!");
        end else begin
            $display("[WARNING] Master flagged an ACK error response!");
        end

        #5000;
        $finish;
    end

    // 3. Automated Slave Emulator Logic
    // Detects when the master has finished transmitting the address bits 
    // and drives SDA low on the 9th clock pulse to ACK the master.
    always @(negedge scl) begin
        if (rst_n && uut.state == 3'b011) begin // Check if Master FSM is inside 'ack_wait'
            slave_drive_en <= 1'b1;
            slave_sda_out  <= 1'b0; // Pull SDA low to signal a successful hardware ACK
        end
    end

    // Release the bus as soon as SCL drops after the ACK phase
    always @(posedge scl) begin
        if (slave_drive_en) begin
            #10; // Brief hold time setup simulation
            slave_drive_en <= 1'b0;
        end
    end
      
endmodule
