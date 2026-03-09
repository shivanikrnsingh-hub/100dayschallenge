
**Description**

An Armstrong Number (also known as a narcissistic number) is a number that is equal to the sum of its own digits each raised to the power of the number of digits. 

For a 3-digit number, this means the sum of the cubes of its digits equals the number itself ($abc = a^3 + b^3 + c^3$).This module implements a sequential checker for 8-bit integers. 

Since an 8-bit number can range from 0 to 255, the design specifically handles up to three decimal digits. The core logic involves converting binary to BCD, cubing the individual digits, and verifying the sum against the original input.

**Hardware Architecture**

The design is partitioned into a control path (FSM) and a data path utilizing a specialized Verilog function:

* Binary to BCD Function: Implements the Double Dabble (Shift-and-Add-3) algorithm. This converts the 8-bit binary input into three 4-bit BCD nibbles representing the Hundreds, Tens, and Units places.

* Finite State Machine (FSM): A 5-state machine manages the computation pipeline:
    * IDLE: Resets flags and prepares for input.
    * DIGIT_LOAD: Latches the BCD nibbles into registers $p, q,$ and $r$.
    * CUBE: Performs parallel cubing of the three digits ($p^3, q^3, r^3$).
    * SUM: Aggregates the cubed results into a single 12-bit sum.
    * COMPARE: Performs the final equality check between the accumulated sum and the original 8-bit input.
 
**State transition logic**


<img width="722" height="227" alt="image" src="https://github.com/user-attachments/assets/77d1e001-b529-4a1f-b1d6-23eac6ea05d3" />


**Simulation Output**

<img width="877" height="455" alt="armstrong_no_console" src="https://github.com/user-attachments/assets/9c36ea6b-c43f-46cc-995b-4f1ce56c5a84" />

