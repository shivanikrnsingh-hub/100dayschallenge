**Description**

In digital systems, Clock Phasing is the process of generating multiple clock signals with the same frequency but shifted in time by a specific phase angle. This module generates four distinct clock phases: 0°, 90°, 180°, and 270°.

This is particularly useful in high-speed data sampling and DDR (Double Data Rate) interfaces, where you might need to sample data exactly at the center of the data eye (which is a 90° shift from the data transition).

**Hardware Architecture**

The design uses a combination of a Johnson Counter (Twisted Ring) and a Divide-by-2 flip-flop to derive the phases:

2-bit Johnson Counter (count): This counter creates the foundational quadrature relationship. A 2-bit Johnson counter cycles through 4 states: 00 -> 10 -> 11 -> 01.

Divide-by-2 Flip-Flop (div2): This acts as a reference toggle to assist in the XOR logic for the quadrature (90°/270°) signals.

Combinational Logic:

clk_0: Directly mapped to the counter output.

clk_90: Derived by XORing the counter with the div2 signal to shift the edge.

clk_180/270: Created by inverting the 0° and 90° signals respectively.

**Key Verilog Concepts**

Asynchronous Reset: The always @(posedge clk, posedge reset) block ensures the phasing logic starts in a deterministic state immediately upon reset.

Twisted Feedback: The line count <= {~count[0], count[1]}; implements the Johnson feedback, which is inherently glitch-free because only one bit changes at a time.

Phase Inversion: Using the bitwise NOT (~) operator is the most efficient way to generate 180° shifts (complementary clocks).

**Simultaion Result**

<img width="1442" height="337" alt="clock_phasing_sim" src="https://github.com/user-attachments/assets/ab8287b5-4633-4126-ad6c-a9f6524f2833" />

