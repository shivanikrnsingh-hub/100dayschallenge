**Description**

Booth's Algorithm is an efficient method for multiplying two signed binary numbers in 2's complement form.
Unlike standard "unsigned" multiplication which only adds and shifts, Booth's algorithm examines pairs of bits to decide whether to add, subtract, or do nothing. This significantly optimizes the process of handling negative numbers without needing to convert them back and forth.

**Hardware Architecture** 

The design uses an iterative process controlled by a for loop, mimicking a sequential hardware controller.
The Algorithm Logic:Initialization: 
* A (Accumulator) is set to 0.Q is loaded with the Multiplier (b).q_1 is an extra bit initialized to 0.Bit Inspection: In each of the 4 iterations (for 4-bit numbers), the circuit checks the two bits {Q[0], q_1}:2'b01 (End of string of 1s):
*  Add Multiplicand ($A = A + a$).2'b10 (Start of string of 1s): Subtract Multiplicand ($A = A - a$).00 or 11: Do nothing.
  
*  Arithmetic Shift Right (>>>): This is the "magic" step. The combined registers {A, Q, q_1} are shifted right by 1 bit.
  
  Crucially, it preserves the sign bit (MSB), ensuring the negative values remain negative.
  
**Key Verilog Concepts**

signed Data Type: By declaring inputs and outputs as signed, you tell the Verilog compiler to treat the MSB as a weight of $-2^{N-1}$.

Arithmetic Shift (>>>): Unlike the logical shift (>>), the arithmetic shift fills the vacated MSB with the previous MSB value (sign extension).

System Task $signed(): This ensures the concatenation is treated as a signed entity during the shift operation, preventing the loss of the negative sign.

Blocking Assignments (=): Using = inside the loop is essential here because each step of the algorithm depends immediately on the modified value from the line above.

**Why Booth's Algorithm?**

Handles Signed Numbers: It works perfectly for positive × positive, positive × negative, and negative × negative.

Speed: In larger implementations, it can reduce the number of partial products, leading to faster multiplication in high-speed ALUs.

**Console Result**

<img width="1342" height="525" alt="booth_algorithm_console" src="https://github.com/user-attachments/assets/8c1dc945-bb85-47a6-9fe0-40dd524bf22d" />

