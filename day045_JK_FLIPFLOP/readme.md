**Description**

The JK Flip-Flop is known as the "Universal Flip-Flop" because it can be configured to emulate the behavior of any other flip-flop type (D, T, or SR). 

This module implements a Synchronous, Edge-Triggered JK Flip-Flop with an active-high reset. Unlike the SR latch, the JK Flip-Flop solves the "forbidden state" problem by introducing a Toggle feature.

**Hardware Architecture**

This design uses Behavioral Modeling inside a clocked always block (posedge clk), making it a sequential circuit.

Synchronous Reset: The reset signal is sampled only at the rising edge of the clock. When active, it forces the output Q to 0.The Toggle State: When both $J$ and $K$ inputs are high (2'b11), the output $Q$ inverts its previous value ($Q_{next} = \overline{Q}$). 

This is the defining characteristic of the JK Flip-Flop.

**Memory/Hold:**

If both inputs are low (2'b00), the flip-flop maintains its current state.Truth TableresetJKclkQ (Next State)Operation1XX↑0Reset000↑QHold001↑0Reset (Low)010↑1Set (High)011↑~QToggle.

**Key Verilog Concepts**

* Sequential Logic (posedge clk): By using the clock edge, the circuit becomes immune to glitches in the $J$ and $K$ lines that occur between clock pulses.Non-Blocking Assignments (<=): These are used to ensure that the state update happens concurrently at the clock edge, which is standard practice for modeling physical flip-flops.

* Case Statement Logic: Using {J, K} as a bit-vector in a case statement creates a clean, readable mapping of the flip-flop's excitation table.

**Applications**

* Binary Counters: The toggle mode is the foundation for ripple counters and synchronous counters.
* Frequency Division: A JK Flip-Flop with $J=1, K=1$ divides the input clock frequency by 2.
* Control Logic: Used in complex state machines where flexible state transitions are required.
