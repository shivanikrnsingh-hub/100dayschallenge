**Description**

The Factorial Calculator is a sequential logic circuit designed to compute the factorial ($n!$) of a 4-bit unsigned integer. 
Calculating factorials in hardware requires an iterative approach, as the result grows exponentially ($4! = 24$, while $12! = 479,001,600$).

This module uses a single-multiplier architecture that performs the calculation over multiple clock cycles. It takes a 4-bit input (num_in) and provides a 32-bit output (result), allowing it to handle factorials up to $12!$ without overflow.

**Hardware Architecture**
The design utilizes a Resource-Shared Sequential Circuit rather than a massive combinational multiplier tree. This saves significant area on an FPGA.

* Multiplier-Accumulator: On every clock cycle where start is High, the current result is multiplied by an incrementing counter.

* Iterative Logic: The circuit continues to multiply until the counter matches the input value num_in.
* Control Path: 
* Reset: Initializes the result to $1$ (since $0! = 1$) and clears the counter.
* Start: Triggers the iterative multiplication process.
* Done: A handshake signal that asserts High once the calculation is complete, notifying the external system that the result is valid.


**Simulation Output**

<img width="846" height="603" alt="factorial_no" src="https://github.com/user-attachments/assets/825caf08-086a-4125-a6d3-d404baff1f80" />
