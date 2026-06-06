`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:34:41 06/06/2026
// Design Name:   CPU_Control_Unit
// Module Name:   /home/ise/verilog_projects/challenge100days2/CPU_control_unit_tb.v
// Project Name:  challenge100days2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CPU_Control_Unit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module CPU_control_unit_tb;

	// Inputs
	reg reset;
	reg clk;
	reg zero_flag;
	reg carry_flag;
	reg [2:0] opcode;

	// Outputs
	wire [2:0] alu_sel;
	wire pc_enable;
	wire ir_load;
	wire reg_write;
	wire mem_read;
	wire mem_write;
	wire halt;

	// Instantiate the Unit Under Test (UUT)
	CPU_Control_Unit uut (
		.reset(reset), 
		.clk(clk), 
		.zero_flag(zero_flag), 
		.carry_flag(carry_flag), 
		.opcode(opcode), 
		.alu_sel(alu_sel), 
		.pc_enable(pc_enable), 
		.ir_load(ir_load), 
		.reg_write(reg_write), 
		.mem_read(mem_read), 
		.mem_write(mem_write), 
		.halt(halt)
);


		always #5 clk = ~clk;




		initial
		begin


		clk = 0;
		reset = 1;

		opcode = 3'b000;
		zero_flag = 0;
		carry_flag = 0;




		#20;

		reset = 0;



		// ----------------------
		// LOAD instruction
		// opcode = 001
		// ----------------------

		opcode = 3'b001;

		#40;


		// ----------------------
		// STORE instruction
		// opcode = 010
		// ----------------------

		opcode = 3'b010;

		#40;


		// ----------------------
		// ADD instruction
		// opcode = 011
		// ----------------------

		opcode = 3'b011;

		#40;


		// ----------------------
		// SUB instruction
		// opcode =100
		// ----------------------

		opcode = 3'b100;

		#40;


		// ----------------------
		// JUMP instruction
		// opcode =110
		// ----------------------

		opcode = 3'b110;

		#40;


		// ----------------------
		// HALT instruction
		// opcode =111
		// ----------------------

		opcode = 3'b111;

		#40;



		$finish;

		end



		// Monitor

		initial
		begin

		$monitor(
		"Time=%0t | State=%b | Opcode=%b | PC_EN=%b | IR_LOAD=%b | REG_WR=%b | MEM_RD=%b | MEM_WR=%b | ALU=%b | HALT=%b",
		$time,
		uut.state,
		opcode,
		pc_enable,
		ir_load,
		reg_write,
		mem_read,
		mem_write,
		alu_sel,
		halt
		);

		end


endmodule

