
**Description**

As I move into the final 30 days of my #100DaysOfRTL challenge, I am shifting focus toward Finite State Machines (FSMs).
Today’s project is a 4-state FSM using One-Hot Encoding.In One-Hot encoding, exactly one bit of the state register is "High" (1) for each state. 
While this uses more flip-flops than Binary or Gray encoding ($N$ flip-flops for $N$ states), it significantly simplifies the combinational logic required to decode the current state. This makes it a preferred choice for high-speed FPGA designs where flip-flops are abundant but logic levels (LUT depth) should be minimized to meet timing.

**Hardware Architecture**

This design implements a Moore-style FSM (outputs depend only on the current state) within a single synchronous block:

State Encoding:

    * IDLE:   4'b0001
    
    * State1: 4'b0010
    
    * State2: 4'b0100
    
    * State3: 4'b1000
    
* Transition Logic: The FSM cycles linearly through the states: **IDLE** -> **State1** -> **State2** -> **State3** -> **IDLE** .
  
* Asynchronous Reset: Ensures the FSM always starts in the IDLE (0001) state.

**Key Verilog Concepts**

* localparam for State Definitions: Using localparam makes the code readable and easy to maintain compared to hard-coding bit values inside the case statement.One-Hot Advantages: Because only one bit is active, the next-state logic only needs to check a single bit. For example, instead of decoding 2'b11 to find "State 3", the hardware simply looks at state[3].
  
* Safe FSM Design: The default case is included to ensure that if the FSM ever enters an invalid state (like 4'b0011 due to a timing violation or radiation-induced bit flip), it automatically recovers to the IDLE state.

<img width="695" height="193" alt="image" src="https://github.com/user-attachments/assets/5dca722d-3d4e-45bc-9138-ebdc7043c25a" />




**Simulation Result**




<img width="1552" height="287" alt="one_hot_fsm_sim" src="https://github.com/user-attachments/assets/34d16216-0248-4fdc-981f-ea3b154eb4b3" />

