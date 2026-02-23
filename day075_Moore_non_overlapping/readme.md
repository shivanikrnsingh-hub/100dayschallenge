**Description**

Completing the quartet of sequence detectors, today's project is the Non-Overlapping Moore FSM for the sequence 11011.

In this configuration, the FSM waits for the complete sequence to be received before asserting the output in a dedicated "Success" state (S5). Once that state is reached, the FSM ignores any potential overlapping bits and resets its search entirely from the next clock cycle. This is the "strictest" form of sequence detection, ensuring that each detected pattern is unique and separate.

**Hardware Architecture**
This module utilizes the Three-Always-Block Style, ensuring a clean separation of concerns:

* State Memory: A sequential block that latches the next_state into the current_state on every clock pulse.

* Next State Logic: A combinational block using din to navigate the state transitions.

* Output Logic: A purely combinational block that drives out high only when the current_state is S5.

The defining characteristic of the Non-Overlapping Moore architecture is found in state S5: regardless of whether din is 0 or 1, the next_state always returns to S0.

**State Table**

<img width="992" height="317" alt="image" src="https://github.com/user-attachments/assets/4825bf33-0e71-4e5b-969a-72b3302706bf" />

**State Diagram**

<img width="405" height="650" alt="fsm_moore_non_overlapping_DIAGRAM" src="https://github.com/user-attachments/assets/1ae60f5c-9657-4529-9814-09fb4de61bab" />


**Simulation Diagram**

<img width="1587" height="250" alt="fsm_moore_non_overlapping_sim" src="https://github.com/user-attachments/assets/b4177cf0-7fe1-4d60-9ded-c3e39d7557cb" />
