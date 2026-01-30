 **Description**
 
 This project implements a 4-Bit Carry Lookahead Adder.
 While the Ripple Carry Adder (Day 007) is simple, it is slow because each bit must wait for the carry to "ripple" from the previous stage.
 The CLA overcomes this by predicting the carry for all bits simultaneously using combinational logic.
 
 **Hardware Architecture**
 
 The CLA design is based on two fundamental signals for every bit position:
 * Generate ($G$): $G_i = A_i \cdot B_i$ (A carry is definitely generated at this stage).
 * Propagate ($P$): $P_i = A_i \oplus B_i$ (An incoming carry will be passed to the next stage).
 
 **The Lookahead Logic,Instead of waiting, the carry for each stage is calculated using the following Boolean equations:**
 * $C_0 = G_0 + (P_0 \cdot C_{in})$
 * $C_1 = G_1 + (P_1 \cdot G_0) + (P_1 \cdot P_0 \cdot C_{in})$
 * $C_2 = G_2 + (P_2 \cdot G_1) + (P_2 \cdot P_1 \cdot G_0) + (P_2 \cdot P_1 \cdot P_0 \cdot C_{in})$

   By expanding these equations, every carry bit becomes a function of the initial $C_{in}$ and the $A, B$ inputs, allowing them to be calculated in parallel.

   **Key Verilog Concepts**

   * Gate-Level Primatives: Used and and xor primitives to generate the $P$ and $G$ signals and the final $Sum$.
   * Dataflow Logic: Used assign statements to implement the complex lookahead carry equations.
   * Performance Optimization: This design significantly reduces the Critical Path Delay compared to the Ripple Carry Adder, making it suitable for high-speed ALUs.

    The CLA is a classic example of trading area for speed—we use more logic gates (more area) to achieve a much faster addition (less time).

   **Simulation Result**

   <img width="1767" height="233" alt="carry_lookahead_sim" src="https://github.com/user-attachments/assets/095f4d33-4da1-460c-94e8-e74ce2b7b650" />
