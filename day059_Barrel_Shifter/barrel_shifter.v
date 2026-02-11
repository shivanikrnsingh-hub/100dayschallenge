`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:44:58 02/11/2026 
// Design Name: 
// Module Name:    barrel_shifter 
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
module barrel_shifter(
   input [7:0] data,
	input [2:0] shift,
	
	output [7:0] out
      );
   
	Mux8x1_using4x1 m1 (.in(data),.sel(shift),.out(out[0]));
	Mux8x1_using4x1 m2 (.in({data[0],data[7:1]}),.sel(shift),.out(out[1]));
	Mux8x1_using4x1 m3 (.in({data[1:0],data[7:2]}),.sel(shift),.out(out[2]));
	Mux8x1_using4x1 m4 (.in({data[2:0],data[7:3]}),.sel(shift),.out(out[3]));
	Mux8x1_using4x1 m5 (.in({data[3:0],data[7:4]}),.sel(shift),.out(out[4]));
	Mux8x1_using4x1 m6 (.in({data[4:0],data[7:5]}),.sel(shift),.out(out[5]));
	Mux8x1_using4x1 m7 (.in({data[5:0],data[7:6]}),.sel(shift),.out(out[6]));
	Mux8x1_using4x1 m8 (.in({data[6:0],data[7]}),.sel(shift),.out(out[7]));
	
	

endmodule
