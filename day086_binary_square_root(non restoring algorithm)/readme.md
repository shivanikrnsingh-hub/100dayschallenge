**Description**

The Binary Square Root Calculator is a sequential hardware module designed to compute the integer square root ($\lfloor \sqrt{x} \rfloor$) of an 8-bit radicand. Calculating square roots in RTL is a non-trivial task that typically requires iterative algorithms.

This implementation uses the Restoring Square Root Algorithm (digit-by-digit method). Similar to long division, this algorithm processes the input in 2-bit pairs (bits are shifted from the radicand into the remainder) to determine each bit of the root, from the Most Significant Bit (MSB) to the Least Significant Bit (LSB).

**Hardware Architecture**

The design follows a Finite State Machine (FSM) control flow to manage the iterative subtraction and shifting:

Control Path:IDLE: Initializes the registers. The 8-bit input is latched into A, while the remainder and the result register Q are cleared. The loop counter i is set to 3 (covering 4 iterations for an 8-bit input).

CALC: The core iterative state. In each cycle, the remainder is shifted left by 2 bits, incorporating the next pair from A. A comparison is made against the current root guess plus a logic '01' suffix.

DONE: Asserts the done signal and outputs the final 4-bit square_root.

Data Path:Shift Register (A): Feeds the radicand bits into the calculation 2 bits at a time.

Result Register (Q): Accumulates the calculated root bits.

Subtractor/Comparator: Determines if the current remainder can accommodate the test value.

Execution Trace (Example: $\sqrt{64} = 8$)For an input of 8'b01000000 (64 decimal):Final Result: Q = 4'b1000 (8 decimal).

**Technical Implementation Details**

Resource Optimization: By calculating the root sequentially over 4 clock cycles, the design avoids the massive area overhead of a combinational square rooter.

Handshaking: The done signal serves as a valid flag, ensuring the calling system does not use the square_root value while the FSM is still in the calc state.

Precision: For an 8-bit input, the maximum possible square root is $\lfloor \sqrt{255} \rfloor = 15$, which fits perfectly into the 4-bit square_root output.

**Simulation Output**

<img width="903" height="330" alt="binary_square_root_console" src="https://github.com/user-attachments/assets/c45beb0d-7025-46de-8dab-4347b3498ca9" />

