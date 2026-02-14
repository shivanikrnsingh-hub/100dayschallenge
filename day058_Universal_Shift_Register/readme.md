**Description**

The Universal Shift Register (USR) is the most versatile register in digital design. It consolidates multiple modes of operation into a single unit, controlled by a select signal. In this specific implementation, I've used a concatenated case statement to handle direction and data loading, providing a clean and efficient way to manage complex control logic.

**Hardware Architecture**

The behavior is determined by the 2-bit control signal {shift_left, shift_right}. This implementation acts as a Mode Select controller:{shift_left, shift_right}

**Operation Description**

* 2'b10 Shift Left Moves bits from LSB to MSB; LSB is filled with 0.
* 2'b01S hift Right Moves bits from MSB to LSB; MSB is filled with 0.
* 2'b11 Parallel Load Synchronously captures the 8-bit parallel_in.
* 2'b00 / default Hold Maintains current state (no change).

**Key Verilog Concepts**
* Case Statement (case): Using a case statement instead of nested if-else blocks often results in cleaner synthesized logic (like a 4-to-1 Multiplexer) and improved code readability.
* Concatenation as Control: {shift_left, shift_right} creates a temporary 2-bit vector. This is a powerful technique for creating "opcode-like" control structures in RTL.
 * Bi-directional Logic:
 * Left Shift: {reg_data[6:0], 1'b0} shifts data towards the higher-order bits.
 * Right Shift: {1'b0, reg_data[7:1]} shifts data towards the lower-order bits.
 * Default Case: The default branch ensures the register has a defined "Hold" behavior, preventing the unintentional creation of latches during synthesis.

**Simulation**

<img width="1557" height="317" alt="universal_shift_reg_sim" src="https://github.com/user-attachments/assets/0fd12a70-0406-41be-92d9-2bb559a89d1d" />


