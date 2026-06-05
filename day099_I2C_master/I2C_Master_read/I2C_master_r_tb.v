`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:20:07 06/04/2026
// Design Name:   I2C_Master_r
// Module Name:   /home/ise/verilog_projects/minor_project/I2C_master_r_tb.v
// Project Name:  minor_project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: I2C_Master_r
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module I2C_master_r_tb;

	// Inputs
	reg clk;
	reg rst_n;
	reg start;
	reg [6:0] addr;
	

	// Outputs
	wire scl;
	wire busy;
	wire [7:0] data_out;

	// Bidirs
	wire sda;

   pullup(sda);
	
	// Instantiate the Unit Under Test (UUT)
	I2C_Master_r uut (
		.clk(clk), 
		.rst_n(rst_n), 
		.start(start), 
		.addr(addr),  
		.scl(scl), 
		.sda(sda), 
		.busy(busy), 
		.data_out(data_out)
	);

	reg [7:0] Slave_data = 8'h3C;
	reg [3:0] bit_cnt;
	reg drive_slave;
	
	
	assign sda = drive_slave?Slave_data[bit_cnt]:1'bz;
	
	initial begin
	 clk=0;
	forever #5 clk=~clk;
	end
	
	initial begin
	  
	  rst_n=0;
	  start=0;
	  addr=7'h42;
	  
	  #20 rst_n=1;
	  #30 start =1;
	  #10 start =0;
	  #500;
	  $finish;
	  end
	  
	  
	  always@(posedge clk)begin
	    if (uut.state==uut.READ) begin
		   drive_slave<=1;
			bit_cnt<=uut.bit_cnt;
			end else
			      begin
					  drive_slave<=0;
					 end
               end
    
     initial begin
          $dumpfile("i2c_master_r.vcd");
          $dumpvars(0,I2C_master_r_tb);			 
	end
	
      
endmodule

