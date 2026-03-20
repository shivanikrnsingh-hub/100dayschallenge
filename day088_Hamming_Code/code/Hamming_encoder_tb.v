`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:03:25 03/20/2026
// Design Name:   Hamming_encoder
// Module Name:   /home/ise/verilog_projects/challenge100days2/Hamming_encoder_tb.v
// Project Name:  challenge100days2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Hamming_encoder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Hamming_encoder_tb;

	// Inputs
	reg [3:0] data_in;

	// Outputs
	wire [6:0] data_out;
	wire [3:0] data_out_decoder;
   wire [2:0] error_position;
	wire [6:0] corrected_code;
	wire detected;
	// Instantiate the Unit Under Test (UUT)
	Hamming_encoder uut (
		.data_in(data_in), 
		.data_out(data_out)
	);


    Hamming_code_error_detector uut1(
       .code_in(data_out),
       .data_out(data_out_decoder),
		 .error_position(error_position),
       .cor_code(corrected_code),.error_detected(detected)		 
	 
	 );
	initial begin
		// Initialize Inputs
		data_in =4'd12;
		#10;
		$display("data_in:%b | data_out: %b | error position=%b",data_in,data_out,error_position);
		$display("Corrected code: %b",corrected_code);
		#10;
		data_in=4'd8;
		#10;
		$display("data_in:%b | data_out: %b | error position=%b",data_in,data_out,error_position);
		$display("Corrected code: %b",corrected_code);
      #10
      $finish;  
		// Add stimulus here

	end
      
endmodule

