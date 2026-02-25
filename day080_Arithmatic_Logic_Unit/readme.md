**Description**

The ALU (Arithmetic Logic Unit) serves as the fundamental computational core of a processor. This module executes a variety of arithmetic operations (addition, subtraction, multiplication) and bitwise logical operations (AND, OR, XOR, shifts) based on a 4-bit operation selector (op_sel).The architecture utilizes a Hybrid Design approach: computation is performed using combinational logic for immediate processing, while the final results and status flags are registered on the rising clock edge to ensure synchronous data stability within a larger system.

**Hardware Architecture**

The design operates in two distinct stages:
* Combinational Logic Stage: Decodes the op_sel input to select the corresponding mathematical or logical path. It calculates the raw result and determines internal carry and overflow conditions.
* Sequential Output Stage: Latches the results into registers on the posedge clk. This stage also generates four critical status flags:
  
  * Carry: Asserted if an unsigned arithmetic operation exceeds the 4-bit boundary ($> 15$).
  * Overflow: Asserted during signed operations if the result is mathematically inconsistent with the sign bits of the operands.Zero: Asserted if the 4-bit Result is exactly 0000.
  * Sign: Reflects the Most Significant Bit (MSB) of the result, indicating a negative value in two's complement representation.

**Technical Implementation Details**

  * Signed Overflow Detection: The logic implements a standard check: over = (A[3] == B[3]) && (result_buff[3] !== A[3]). This identifies errors when two operands of the same sign produce a result of the opposite sign.

  * Multiplication Handling: An 8-bit internal register (mult_result) captures the product of two 4-bit numbers to prevent data loss during calculation, though only the lower 4 bits are mapped to the primary output.

  * Comparison Operations: The equality (==) and greater-than (>) operations return a boolean result (4'b0001 for true, 4'b0000 for false), facilitating branch-decision logic in higher-level controllers.

**Simulation Result**

<img width="845" height="435" alt="aluu_console" src="https://github.com/user-attachments/assets/2d754bb5-5985-4dac-ba38-57c87821505b" />
