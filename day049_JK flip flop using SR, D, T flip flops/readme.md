**Description**

This module illustrates the conversion of SR, D, and T Flip-Flops into a JK Flip-Flop. While the JK flip-flop is the most versatile because of its "Toggle" capability, it is often necessary to build this functionality using simpler primitives. By designing the correct "Excitation Logic," we can force other flip-flops to adopt the JK truth table, including the toggle state ($J=1, K=1$).


**Hardware Architecture**

The design uses structural modeling to connect excitation logic to the inputs of the instantiated flip-flops.

1. JK behavior using SR Flip-FlopAn SR flip-flop can act like a JK flip-flop by feeding back the output to the inputs to prevent the forbidden ($1,1$) state.
* Logic: $S = J\overline{Q}, R = KQ$
* Implementation: assign w1 = ~Q_SR & J; assign w2 = Q_SR & K;

2. JK behavior using D Flip-FlopTo implement the JK characteristic equation on a D-FF, we use logic that selects between setting, resetting, or holding/toggling based on the current state.
* Logic: $D = J\overline{Q} + \overline{K}Q$
* Implementation: assign w5 = (~Q_D & J) | (~K & Q_D);

3. JK behavior using T Flip-FlopSince the T flip-flop only knows how to "Hold" or "Toggle," the excitation logic must determine when a state change is required based on the $J$ and $K$ inputs.
* Logic: $T = J\overline{Q} + KQ$
* Implementation: assign w8 = (Q_T & K) | (~Q_T & J);

**Key Verilog Concepts**

* Feedback Loops: Utilizing the current output state (Q) as an input to the combinational logic to determine the next state.
* Boolean Minimization: The equations used (w1-w8) are the minimized forms of the JK excitation table.
* Interconnect Management: Efficient use of internal wires to bridge the gap between input ports and sub-module ports.

**Applications**

* ALU Design: Building flexible registers that can toggle or hold data.
* Complex Counter Design: Using simple D-FF based FPGA slices to implement complex JK-based counting sequences.
* Logic Synthesis: Understanding how high-level behavioral code is transformed into low-level gate structures by synthesis tools.
