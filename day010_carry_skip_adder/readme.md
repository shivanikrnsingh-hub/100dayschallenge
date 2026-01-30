**Description**

This project implements a 4-Bit Carry Skip Adder. 
It is an optimization of the Ripple Carry Adder (RCA) that aims to reduce the time spent waiting for a carry to propagate through the entire chain.
If all bit positions in a block are ready to "propagate" a carry, the carry-in is allowed to "skip" the ripple path and go directly to the output.

**Hardware Architecture**

The design consists of two main parts:The Ripple Path: A standard 4-bit Parallel Adder (bit4_parallel_adder) that calculates the sum and the ripple carry ($c$).

**The Skip Path:** Logic that calculates a "Skip Select" signal ($sel$) based on the Propagate ($p$) signals of each bit.

**How it works:**

* Propagate Signals ($p$): For each bit, we check if $A \oplus B$ is true. If it is, that bit will pass any incoming carry to its output.
* Skip Condition ($sel$): If all bits in the block have $p=1$, then any $Cin$ coming into the block will definitely come out as $Cout$.
* The Mux: If $sel$ is true, $Cout$ is taken directly from $Cin$ (the skip). If $sel$ is false, $Cout$ is taken from the ripple carry ($c$).

**Key Verilog Concepts**
* Hierarchical Design: Reuses the bit4_parallel_adder module, demonstrating modular hardware design.
* Reduction AND: The and (sel, p[0], p[1], p[2], p[3]) ensures the skip only happens if the carry is guaranteed to propagate through all 4 bits.
* Ternary Operator: Used assign cout = (sel ? cin : c) to implement a 2-to-1 Multiplexer efficiently in a single line.

**Performance Advantage**

The Carry Skip Adder is faster than a Ripple Carry Adder because the worst-case delay is reduced. 
In large adders (like 16-bit or 32-bit), skipping across 4-bit blocks significantly speeds up the carry propagation compared to rippling through every single bit.

**Console Result**


<img width="593" height="200" alt="carry_skip_adder_console" src="https://github.com/user-attachments/assets/ee5d5537-40e6-4aa7-8570-76b9b8c6f6cd" />
