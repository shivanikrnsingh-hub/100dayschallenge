
**Description**

Today’s module is an Overlapping Mealy FSM designed to detect a specific binary sequence.
In a Mealy Machine, the output depends on both the current state and the current input. 
This usually allows for fewer states compared to a Moore machine (where the output only depends on the state).This FSM is designed to detect the sequence 11011.Because it is an overlapping detector, the end of one detected sequence can serve as the beginning of the next. For example, in the stream 11011011, the last two 1s of the first match are reused to start the next match.

**Hardware Architecture**

The code follows the Two-Always-Block Style:State Register (Sequential): Updates current_state on the rising edge of the clk.

Next State & Output Logic (Combinational): Uses a case statement to determine the next_state and the value of out based on din.Note on Overlap: In state S4, if din is 1, the FSM jumps back to S2 (which represents having already found "11"). This is what makes it an overlapping detector.


<img width="970" height="195" alt="image" src="https://github.com/user-attachments/assets/76b4e6fe-adf6-4c74-8c5f-c2715edb04cc" />

**STATE DIAGRAM**

<img width="397" height="655" alt="fsm_mealy_overlapping_DIAGRAM" src="https://github.com/user-attachments/assets/32d0cdbc-d436-48d6-bc1b-01b37322b6a7" />


**Key Verilog Concepts**

Mealy Output Timing: Notice that out is assigned inside the combinational block. In a Mealy machine, the output can change as soon as the input din changes, potentially leading to "glitches" if the input isn't synchronized.

Two-Block Coding Style: This is much easier to debug than a single-block FSM because it separates the memory (registers) from the logic (gates).

Reset Logic: The asynchronous-style reset (though written synchronously in the always block) ensures the FSM returns to the S0 start state.

**Applications**

Pattern Recognition: Identifying specific headers or sync-bytes in a serial data stream.

String Matching: Used in hardware-accelerated search algorithms.

Control Units: Triggering specific hardware events when a precise bit pattern is received from a sensor.
