
**Description**

Frequency division by an even power of two is one of the most hardware-efficient operations in digital design. While you can use a counter and a comparator, this implementation uses a Shift-Register based Toggle approach.

By cascading D-Flip-Flops in a feedback loop, the frequency is halved at each stage. To divide by 4, the circuit effectively creates a 2-bit ripple-like effect where the output toggles only after two full cycles of the preceding stage.

**Hardware Architecture**

This module utilizes two D-Flip-Flops in a structural configuration:

Stage 1 (d1): Takes the inverted final output (~clk_by4) as its input. This creates the foundational toggle logic.

Stage 2 (d2): Samples the output of the first stage (clk_by2).

The Result: Because both flip-flops are triggered by the same high-speed clk, the data takes two clock cycles to propagate through the chain and "flip" the state, resulting in a perfectly symmetrical divide-by-4 clock.

**Key Verilog Concepts**

Structural Modeling: Instead of writing behavioral always blocks, this module instantiates sub-components (D_flipflop) to build the logic.

Synchronous Division: Unlike "Ripple Counters" (where the output of one FF clocks the next), this design is fully synchronous. Both flip-flops share the same clk signal, which is preferred in modern FPGA/ASIC design to avoid clock skew and timing violations.

Feedback Loop: The ~clk_by4 feedback into the first stage is what drives the continuous oscillation of the divider.

**Similation Result**

<img width="1030" height="232" alt="frequency_divider_even_sim" src="https://github.com/user-attachments/assets/c87c4456-6534-455a-9a56-532977637930" />
