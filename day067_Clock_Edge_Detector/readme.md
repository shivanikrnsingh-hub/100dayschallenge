**Description**

The Edge Detector is a fundamental synchronous circuit used to identify transitions in a signal. It takes a long-duration input signal (clk_in) and converts its transitions into a single-cycle pulse. This is essential when you want a synchronous system to trigger an action only once when a signal changes, rather than continuously while the signal is high.

This module detects three types of transitions:

Rising Edge: Low-to-High transition.

Falling Edge: High-to-Low transition.

Dual Edge: Any change in the signal state.

**Hardware Architecture**

The circuit works by creating a "history" of the input signal using a 2-stage shift register (synchronizer):

synch0: Stores the current sampled value of clk_in.

synch1: Stores the value of clk_in from the previous clock cycle.

Logic Comparison: By comparing the current state (synch0) with the previous state (synch1), we can determine exactly when a transition occurred.

**Key Verilog Concepts**
Synchronous Pulse Generation: The outputs (rising_edge, falling_edge, dual_edge) are high for exactly one clock period of the system clk.

Boolean Edge Logic:

rising_edge: synch0 & (~synch1) (High now, but was Low before).

falling_edge: (~synch0) & synch1 (Low now, but was High before).

dual_edge: synch0 ^ synch1 (Now is different from before).

**Simulation Result**

<img width="1545" height="283" alt="clock_edge_detector_sim" src="https://github.com/user-attachments/assets/a003d942-7e21-4fb9-92fc-207f545e6e8c" />
