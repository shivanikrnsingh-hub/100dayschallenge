**Description**

The HCF (Highest Common Factor), also known as the Greatest Common Divisor (GCD), is a fundamental mathematical property used in cryptography, signal processing, and frequency scaling. This module implements the Euclidean Algorithm using repeated subtraction to find the HCF of two $N$-bit integers.Unlike a combinational divider, which consumes significant FPGA resources, this sequential design uses a Finite State Machine (FSM) to perform calculations over multiple clock cycles. This approach is highly area-efficient as it only requires a single subtractor and a comparator.

**Hardware Architecture**

The architecture follows a 5-state control flow to manage the iterative subtraction process:IDLE: Waits for the start signal. Upon activation, it latches the two input numbers (in1, in2) into internal registers a and b.

COMPARE: Evaluates the relationship between the current values of a and b.If $a > b$, it transitions to state A.

If $b > a$, it transitions to state B.

If $a = b$, the HCF has been found, and it transitions to EQUAL_OUT.

A & B (Subtraction States): Performs $a = a - b$ or $b = b - a$ respectively,

then returns to the COMPARE state.

EQUAL_OUT: Asserts the done flag and assigns the final value of a to the HCF output

**Technical Implementation Details**

Parameterization: The use of parameter N=8 allows the module to be scaled for any bit-width (e.g., 16-bit, 32-bit) without modifying the internal logic.

Handshaking: The start and done signals allow the module to be easily integrated into a larger system as a mathematical co-processor.

Efficiency: This design avoids the use of a division operator (/) or modulo operator (%), which are hardware-intensive. Instead, it relies on basic subtraction, which maps directly to efficient Adder/Subtractor chains in FPGA fabric.

**Simultion Results**

<img width="1511" height="248" alt="HCF_sim" src="https://github.com/user-attachments/assets/673b7db0-35c5-429b-9c6b-0d8d17e71eef" />



<img width="757" height="276" alt="hcf_console" src="https://github.com/user-attachments/assets/bdc29297-9c01-4f1d-a848-3bb39f48f456" />
