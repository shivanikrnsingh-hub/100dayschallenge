**Description**

This project implements a 4-Bit Parallel Adder using a structural modeling approach.
By instantiating four 1-bit Full Adders and chaining them together, the circuit can perform addition on two 4-bit binary numbers.

**Hardware Architecture**

The design follows the Ripple Carry architecture. 
The carry-out ($C_{out}$) of each full adder is connected to the carry-in ($C_{in}$) of the next most significant full adder.

**Design Components:**

Full Adder (FA) Instances: 4 separate units, each handling one bit-position.
* Internal Wires: A 3-bit wire bus (wire [2:0] c) acts as the "ripple" path, carrying the overflow from one bit to the next.
*
**How it works:**

FA1 adds the Least Significant Bits (LSB) $a[0]$ and $b[0]$.

The carry generated ($c[0]$) "ripples" into FA2.
This process continues until FA4 produces the final sum bit $sum[3]$ and the overall carry out.

 **Key Verilog Concepts**
 * Structural Modeling: This module does not use equations; instead, it describes the physical interconnections between sub-modules.
 * Port Mapping: Used named association (e.g., .a(a[0])) to connect the top-level inputs to the internal Full Adder ports. This is a best practice as it prevents connection errors in larger designs.
 *
   **Critical Path:** This design highlights the concept of propagation delay, as the final carry bit must wait for all previous stages to complete their calculation.
   
**Why this is important**

The Parallel Adder is the backbone of the Arithmetic Logic Unit (ALU). 
While simple, it sets the stage for advanced adders like the Carry Lookahead Adder (which you'll tackle later) that aim to solve the "ripple delay" problem.

**Simulation Result**

<img width="1780" height="322" alt="4bit_paralell_adder_sim" src="https://github.com/user-attachments/assets/40cfe84a-85e9-45ef-b769-cbd0dda31774" />
