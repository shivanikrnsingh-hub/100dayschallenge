**Description**

Today’s project implements a Moore FSM to detect the overlapping sequence 11011. In a Moore machine, the output is strictly a function of the current state only. Unlike the Mealy machines we designed on Days 72 and 73, the output here does not change immediately when the input din changes; instead, it waits for the next clock edge to enter the "Success" state.To detect a 5-bit sequence like 11011, a Moore machine typically requires $N+1$ states (in this case, 6 states: S0 through S5).

**Hardware Architecture**

This module is written using the Three-Always-Block Style, which is the gold standard for FSM readability and synthesis:
* State Memory (Sequential): Updates the current_state on the clock edge.
* Next State Logic (Combinational): Determines next_state based on current_state and din.
* Output Logic (Combinational): Decodes the current_state to drive the out signal.

**State Table**

<img width="968" height="272" alt="image" src="https://github.com/user-attachments/assets/fa06fc87-becf-42f6-a423-71eefb3109e4" />

**State Diagram**

<img width="346" height="653" alt="fsm_moore_overlapping_diagram" src="https://github.com/user-attachments/assets/21a44107-20f3-43fa-8166-73210176b029" />

**Simulation Result**

<img width="1560" height="232" alt="fsm_moore_overlapping_fsm" src="https://github.com/user-attachments/assets/8e375b01-1a70-4588-8064-381294b30a84" />

