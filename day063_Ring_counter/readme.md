**Description**

A Ring Counter is a specialized circular shift register where the output of the last flip-flop is fed back to the input of the first. In a standard ring counter, the register is initialized such that only a single bit is "1" (High) while all others are "0". As the clock pulses, this single "1" circulates through the register.For an $N$-bit ring counter, there are exactly $N$ unique states. This implementation is parameterized, allowing you to generate a ring of any size (4-bit, 8-bit, etc.) by simply changing the N value during instantiation.

**Hardware Architecture**

The design uses a Circular Right Shift mechanism:Initialization: On reset, the counter is set to 1 (e.g., 0001 for a 4-bit counter). This ensures the "hot bit" exists to start the cycle.

The Rotation: On every clock edge, the Least Significant Bit (counter[0]) is moved to the Most Significant Bit position, and the rest of the bits are shifted right.

Logic: counter <= {counter[0], counter[N-1:1]}

State Characteristics: Since only one bit is active at a time, the output is effectively One-Hot Encoded.

**Key Verilog Concepts** 

Concatenation for Rotation: The syntax {counter[0], counter[N-1:1]} is a very efficient way to describe a circular shift in hardware. It maps wires in a way that creates a loop without needing complex multiplexers.

Non-Zero Reset: A common mistake in ring counters is resetting to 0. If all bits are 0, the rotation will continue to produce 0 indefinitely. Resetting to 1 (or any value with at least one 1) is critical.

One-Hot Logic: Because only one bit is High at any time, the outputs can be used directly as "Enable" signals for different stages of a process without needing an additional decoder.

**Simulation Result**

<img width="1528" height="215" alt="ring_counter_sim" src="https://github.com/user-attachments/assets/99c34382-9390-408a-9211-ceed8b8b34b0" />

<img width="852" height="687" alt="ring_counter_console" src="https://github.com/user-attachments/assets/85931a01-86e2-4ead-8885-ffb77b0cee2e" />


