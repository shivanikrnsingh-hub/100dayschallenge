**Description**

This project implements an 8-bit Even Parity Generator and Checker. These modules are used for basic error detection in digital communication. By using the Reduction XOR Operator, the design is kept optimized and scalable.

**1. Even Parity Generator**
The generator processes an 8-bit data input and produces a single parity bit.

* Logic: It calculates the parity bit such that the total number of '1's in the (Data + Parity) set is even.

* Implementation: assign parity = ^data_in;

**How it works:**
 The reduction XOR operator (^) performs a bitwise XOR on all bits of the vector, effectively returning '1' if there is an odd number of set bits and '0' if there is an even number.

**2. Even Parity Checker**
The checker verifies the integrity of the received 8-bit data against the received parity bit.

* Logic: It concatenates the parity bit and the data, then checks the parity of the entire 9-bit set.

* Implementation: assign error = ^({parity_bit, data1});

* Result: * error = 0: Data is valid (Even number of '1's).

* error = 1: Data is corrupted (Odd number of '1's detected).

**Key Verilog Concepts**
* Reduction XOR Operator (^): This operator is highly efficient for parity logic. It collapses a multi-bit vector into a single bit by XORing every bit in the bus.

* Concatenation { }: Used in the checker to treat the parity_bit and data1 as a single 9-bit bus for the reduction operation.

* Combinational Logic: Both modules use continuous assignments (assign), ensuring zero-latency error detection (ignoring gate delays).

**Simulation Result**

**even parity checker**

  <img width="1782" height="1020" alt="even_parity_cheker_sim" src="https://github.com/user-attachments/assets/43db8a93-68ed-422a-9841-3c0bf63668d1" />

**even parity generator**

<img width="1461" height="371" alt="image" src="https://github.com/user-attachments/assets/b4f2b04e-4ddc-4903-b355-484a1462b55d" />


