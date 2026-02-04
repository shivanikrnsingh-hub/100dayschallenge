**Description**

This module completes the flip-flop conversion series by implementing a T (Toggle) Flip-Flop using SR, JK, and D Flip-Flops. The T Flip-Flop is a specific case of sequential logic where the output state inverts whenever the input $T$ is high. This project demonstrates how to derive the specific Excitation Logic required for each host flip-flop to achieve this toggle behavior.

**Hardware Architecture**

The design uses structural instantiations of standard flip-flops, with their inputs driven by combinational logic that satisfies the T-FF characteristic equation: $Q_{next} = T \oplus Q_{prev}$.

1. T behavior using SR Flip-FlopTo make an SR-FF toggle, we must set $S$ when we want to move from 0 to 1, and set $R$ when moving from 1 to 0. This is achieved by gating the $T$ input with the current state.
* Logic: $S = T\cdot\overline{Q}$, $R = T\cdot Q$
* Implementation: assign w1 = T & (~Q_SR); assign w2 = T & Q_SR;

2. T behavior using JK Flip-FlopThe JK Flip-Flop is the most efficient host for a T-FF. Because the JK-FF naturally toggles when both inputs are high, we simply tie $J$ and $K$ to the $T$ input.
* Logic: $J = T, K = T$
* Implementation: Directly mapped in the instantiation.

3. T behavior using D Flip-FlopA D-FF captures its input exactly. To make it toggle, we must feed back the current state and XOR it with the $T$ input. This ensures that if $T=1$, the D input receives the inverse of the current state.

* Logic: $D = T \oplus Q$
* Implementation: assign w3 = T ^ Q_D;

**Key Verilog Concepts**

* XOR Logic (^): Utilizing the XOR gate as a controlled inverter—the fundamental math behind the T-to-D conversion.
* Gated Feedback: Using the current state ($Q$) to "steer" the $T$ signal into the $S$ or $R$ inputs.
* Structural Verification: By instantiating all three versions in one module,  verified that all outputs ($Q_{SR}, Q_{JK}, Q_{D}$) behave identically in simulation.

**Applications**

* Frequency Scalers: Converting a fixed clock into a lower frequency.
* Gray Code Counters: Using toggle logic to ensure only one bit changes at a time.
* FPGA Optimization: Most FPGAs consist of D-type registers; knowing the $T = T \oplus Q$ conversion is essential for building counters in an FPGA environment.
