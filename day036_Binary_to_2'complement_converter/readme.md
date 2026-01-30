**Description**

This module calculates the 2's Complement of a 4-bit binary number. In binary arithmetic, the 2's complement is the most common method for representing negative numbers. It allows for a unified hardware architecture where both addition and subtraction can be handled by the same Adder circuit.

**Hardware Architecture**

The design follows the two-step mathematical definition of 2's complement:1's Complement (Inversion): temp = 4'b1111 - data. Subtracting a number from all 1s is the same as flipping all its bits (performing a bitwise NOT).Adding the LSB: com_out = temp + 1. Adding 1 to the inverted result completes the 2's complement transformation.Logic Example:Input ($+3$): 0011Step 1 (Invert): 1100 (This is the 1's complement)Step 2 (Add 1): 1101 (This is $-3$ in 2's complement)


**Key Verilog Concepts**

Dataflow Modeling: Using assign statements creates a combinational circuit that reacts immediately to input changes.Arithmetic Abstraction: While you could use the bitwise NOT operator (~data), using 4'b1111 - data is a clever way to describe the logic mathematically.

Internal Wires: The wire [3:0] temp acts as the intermediate storage for the 1's complement before the final addition.

**Why Use 2's Complement?**

No "Negative Zero": Unlike Sign-Magnitude or 1's complement, 2's complement has only one representation for zero (0000).Simplified Hardware: To perform $A - B$, the hardware simply calculates $A + (\text{2's complement of } B)$. 

**Console Result**

<img width="603" height="337" alt="binary_to_2&#39;compliment_console" src="https://github.com/user-attachments/assets/6a9384fa-8478-4f2c-8f43-460da72ae36b" />

