 **Description**
 
The PISO (Parallel-In Serial-Out) Shift Register acts as the data transmitter in a digital system. It takes a multi-bit parallel bus (parallel_in) and, upon a load command, captures the data and sends it out bit-by-bit through a single output wire (serial_out). This is the fundamental component for serial communication protocols like UART, SPI, and USB, where reducing the number of physical wires is essential.

**Hardware Architecture**
This module uses a Behavioral Modeling approach with an internal 3-bit register q that handles two primary operations controlled by the load signal:

* Parallel Load (load = 1): On the rising edge of the clock, the entire 3-bit parallel_in vector is sampled into the internal register q.Serial Shift (load = 0): The register performs a right-shift operation. The bits move toward the LSB (Least Significant Bit), and a 0 is shifted into the MSB (Most Significant Bit).
* Logic: q <= {1'b0, q[2:1]}
* Serial Output: The LSB of the register (q[0]) is continuously assigned to serial_out.

**Key Verilog Concepts**

* Concatenation Operator { }: Used here to implement the shift logic. It "glues" a 0 to the top bits of the register while dropping the bottom bit.Multiplexed Logic: The if (load) ... else ... structure effectively acts as a 2-to-1 multiplexer for each flip-flop's input, choosing between new data or the previous bit in the chain.

* Non-Blocking Assignments (<=): Crucial for sequential logic to ensure all bits shift simultaneously without race conditions.

**Simulation Result**

<img width="1562" height="446" alt="PISO_sim" src="https://github.com/user-attachments/assets/ea950f99-7326-4d6c-867e-911580e0416b" />

