**Description**

Continuing the FSM series, today's project is the Non-Overlapping version of the 11011 sequence detector. In a non-overlapping detector, once a full sequence is found, the FSM completely resets its search. The bits used to complete one sequence cannot be reused to start the next.

For example, in the stream 11011011:

Overlapping: Detects two sequences (reusing the last 11).

Non-Overlapping: Detects only one sequence and then starts over from scratch at the next bit.

**Hardware Architecture**

This design maintains the Two-Always-Block Style, which is robust for synthesis:

* Sequential Block: Handles the state transitions on the posedge clk.
* Combinational Block: Evaluates the next_state and immediate out based on the current input din.The key architectural difference from Previous day  is in State S4. When the final bit (1) is detected, instead of jumping back to S2 (reusing bits), the FSM jumps back to S0 (complete reset).

<img width="972" height="196" alt="image" src="https://github.com/user-attachments/assets/eec3e9ee-845c-42ad-af47-9d9ad4ca74d0" />

**Simulation Result**

<img width="1383" height="188" alt="fsm_mealy_non_overlapping_sim" src="https://github.com/user-attachments/assets/ad69e4d2-cf97-4ace-8a99-66a061110cc5" />

