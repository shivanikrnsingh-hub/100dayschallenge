**Description**

In many complex communication protocols, a single FSM needs to monitor the data line for more than one pattern. Today's project is a Multiple Sequence Detector designed to detect two distinct 4-bit sequences: 1100 and 1010.

This is a Mealy Machine, meaning the output out is asserted in the same clock cycle that the final bit of either sequence is detected. This design is significantly more complex than a single-sequence detector because the state branches must account for "shared" prefixes and divergent paths.

**Hardware Architecture**

The FSM is implemented using the Two-Always-Block style. It uses 7 states (S0-S6) to track progress across both potential patterns:

S0 (Idle): Waiting for the first 1.

Branching Path: 
  * After the first 1, the FSM moves to S1.
  * If the next bit is 1, it moves toward the 1100 path (S2).
  * If the next bit is 0, it moves toward the 1010 path (S4).

Detection:

  * Sequence 1100: Detected when the FSM is in S3 and receives a 0.

  * Sequence 1010: Detected when the FSM is in S5 and receives a 0.
  
  * Sequence 1001: Detected when the FSM is in S6 and receives a 1.

**State Diagram**

<img width="732" height="550" alt="image" src="https://github.com/user-attachments/assets/a8fc8ef0-58b4-45dc-b74d-dc4cd24ff4ca" />


**Key Verilog Concepts**

* Overlapping Detection Logic: The transitions from S5 and S6 allow the FSM to immediately begin looking for the next sequence without dropping back to Idle, which maximizes data throughput.

* Blocking vs. Non-Blocking: Note the correct use of non-blocking (<=) for the sequential state register and blocking (=) for the combinational next-state/output logic.

* State Optimization: This FSM uses 3 bits to represent 7 states. Using (* fsm_encoding = "user" *) (commented in your code) would force the compiler to use your specific binary assignments rather than optimizing them into One-Hot.

**Simulation Result**

<img width="1197" height="237" alt="multiple_sequence_detector_sim" src="https://github.com/user-attachments/assets/1dff3354-8925-47fb-9863-974ade41bcec" />


**Applications**

* Multi-Protocol Receivers: Detecting different types of "Start of Frame" (SOF) delimiters (e.g., distinguishing between a data packet and a control packet).

* Trigger Logic: Used in Digital Storage Oscilloscopes (DSOs) to trigger on multiple user-defined bit patterns.

* Pattern Matching Engines: Basic hardware-level regex matching
