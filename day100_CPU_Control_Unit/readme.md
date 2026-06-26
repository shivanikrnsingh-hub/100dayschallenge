# **Day 100: Simple CPU Control Unit FSM** 

Welcome to the **Day 100** milestone project of my **100-Day Verilog Challenge**! To cap off this journey, this repository implements a synthesizable, Finite State Machine (FSM)-based **CPU Control Unit**. This module acts as the central brain of a basic CPU, decoding 3-bit opcodes and generating critical control paths for the Program Counter (PC), Instruction Register (IR), Register File, Data Memory, and ALU.

---

## **Architecture Overview**

The control unit is structured using a multi-stage Moore/Mealy hybrid FSM topology. It systematically cycles through traditional hardware execution phases:

### **State Registers**
* **`RESET` (`3'b000`)**: Initializes all control registers and boots straight to fetch.
* **`FETCH` (`3'b001`)**: Asserts internal lines to safely load the next instruction into the IR.
* **`DECODE` (`3'b010`)**: Evaluates the incoming 3-bit `opcode` to route the pipeline.
* **`EXECUTE` (`3'b011`)**: Drops down into specific execution blocks (ALU math, Memory I/O) based on the instruction type.
* **`STOP` (`3'b100`)**: Hard-halts the CPU pipeline until a hardware reset signal occurs.

---

## **Instruction Set Architecture (ISA) Mapping**

The controller interprets a **3-bit opcode** to manipulate the system bus using these parameters:

| Opcode | Instruction | Action / Active Control Signals | Next State |
| :---: | :--- | :--- | :---: |
| `001` | **LOAD** | `mem_read = 1`, `reg_write = 1` | FETCH |
| `010` | **STORE** | `mem_write = 1` | FETCH |
| `011` | **ADD** | `alu_sel = 3'b001`, `reg_write = 1` | FETCH |
| `100` | **SUB** | `alu_sel = 3'b010`, `reg_write = 1` | FETCH |
| `110` | **JUMP** | `pc_enable = 1` | FETCH |
| `111` | **HALT** | `halt = 1` | STOP |



---

## **Simulation & Testbench**

The accompanying testbench (`CPU_control_unit_tb.v`) runs a full system lifecycle test, driving every single instruction sequentially on a 10ns clock window (`#5 clk = ~clk`).

### **Verified Simulation Steps**
1. **Power-On Reset:** Holds `reset` high for 20ns to force the state machine to `RESET`.
2. **Instruction Train:** Executes `LOAD`--> `STORE`--> `ADD`-->  `SUB` --> `JUMP` --> `HALT`.
3. **Pipeline Trapping:** Confirms that a `HALT` instruction locks the machine into the `STOP` state permanently.




