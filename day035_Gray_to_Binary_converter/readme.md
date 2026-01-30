**Description**

This project implements a Gray to Binary Code Converter. While Gray code is excellent for transmission and error prevention, it is difficult to perform arithmetic on. This module converts Gray code back into standard binary so that the data can be used by Adders, Multipliers, or ALUs.

**Hardware Architecture**

The conversion uses a cascading XOR structure. Unlike the Binary-to-Gray converter where all XORs can trigger at the same time, here, each bit (except the MSB) must wait for the result of the bit to its left.Logic Equations:$B_3 = G_3$ (Directly buffered)$B_2 = G_2 \oplus B_3$$B_1 = G_1 \oplus B_2$$B_0 = G_0 \oplus B_1$

**Key Verilog Concepts**

Signal Dependency: Notice how xor1 uses out_binary[3] as an input. This creates a chain of dependencies. In timing analysis, this is known as a Carry-like Chain, where the total delay is the sum of all XOR gate delays.

Gate-Level Modeling: By using xor xor1(out_binary[2], in_gray[2], out_binary[3]), you are explicitly defining the feedback path from the output of one gate to the input of the next.MSB Identity: Both conversion types (Binary $\to$ Gray and Gray $\to$ Binary) share the same rule for the Most Significant Bit: it remains unchanged.

**Console Results**

<img width="592" height="278" alt="gray_to_binary_console" src="https://github.com/user-attachments/assets/5ad49fa5-c619-4b86-9b1e-b2d8d041663a" />
