**Description**
This project implements a 2x2 Vedic Multiplier using the Urdhva-Tiryagbhyam (Vertically and Crosswise) technique from ancient Indian Vedic Mathematics. This method is highly efficient as it generates all partial products simultaneously, making it much faster than the traditional shift-and-add approach.

* **Hardware Architecture**
The 2x2 Vedic multiplier is a combinational circuit designed using basic logic gates and adders. It takes two 2-bit inputs A[1:0] and B[1:0] and produces a 4-bit product M[3:0].

* **Logic Components:**
*4 AND Gates: Used to generate the partial products.
*2 Half Adders: Used to sum the intermediate results and propagate the carries.

* **Step-by-Step Logic:**
*LBS (Bit 0): Multiply the least significant bits: M[0] = A[0] & B[0].

*Middle (Bit 1): Cross-multiply and add: (A[1] & B[0]) + (A[0] & B[1]). The sum is M[1] and the carry goes to the next stage.

*MSB (Bits 3 and 2): Multiply the most significant bits and add the carry from the previous step: (A[1] & B[1]) + Carry.

**Advantages**
High Speed: Parallel generation of partial products reduces the critical path delay.

Low Power: Minimal switching activity compared to complex array multipliers.
