**Description**

Standard counters follow a strictly incremental binary path ($0, 1, 2, 3...$). However, in many digital systems—such as control units for specialized hardware—you need a Specific Sequence Counter. This module implements a non-contiguous sequence using a Finite State Machine (FSM) approach.The counter follows this specific pattern:0 → 3 → 5 → 7 → 9 → 11 → (Back to 0)This design demonstrates how to use a case statement to define arbitrary state transitions, ensuring that the hardware only visits valid "states" and handles invalid states gracefully.

**Hardware Architecture**

This module utilizes a Two-Register Architecture within a single synchronous block:

count (Next State Logic): Acts as the internal state pointer, determining which value comes next in the sequence.

counter (Output Logic): The actual output register that holds the value of the current state.

Asynchronous Reset: The use of posedge reset in the sensitivity list ensures the system can be forced back to 4'b0000 immediately, regardless of the clock.

**Key Verilog Concepts**

* Case-Based State Transitions: Instead of using arithmetic operators like +1, we explicitly map every current value to a specific next value. This is the foundation of Hard-Wired Control Units.

* Asynchronous Reset: The always @(posedge clk, posedge reset) block implements an active-high asynchronous reset, which is standard practice for ensuring a safe startup state in FPGAs.
* Default Case: The default branch is critical. If the counter somehow enters an undefined state (due to noise or alpha particles), it will automatically recover by jumping back to 4'b0000.

**Simulation Result**

<img width="1556" height="277" alt="special_sequence_counter_sim" src="https://github.com/user-attachments/assets/1d53be15-0033-4537-818c-b7cc04f9ac0b" />
