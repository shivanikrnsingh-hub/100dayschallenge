**Description**

The Up/Down Counter is a versatile sequential circuit that can count in two directions based on a control input (mode). This specific design is parameterized, allowing the bit-width to be adjusted easily.A unique feature of this implementation is that it doesn't just count to the maximum binary value ($2^N - 1$); instead, it uses the parameter $N$ to define a custom limit of $2 \times N - 1$. This makes it a Modulo-2N bidirectional counter, perfect for applications where the counting range needs to be strictly controlled rather than simply wrapping at the register's physical limit.
 
**Hardware Architecture**

The module uses synchronous logic to transition between states based on the mode signal:

* Up-Counting (mode = 1): The counter increments on every clock edge. When it reaches the terminal count ($2N-1$), it synchronously resets to $0$.Down-Counting (mode = 0): The counter decrements. If the current value is $0$, it "wraps around" to the terminal count ($2N-1$) to maintain the cyclic sequence.

* Synchronous Reset: A high-priority reset signal clears the counter to $0$ on the next rising clock edge.

**Key Verilog Concepts**

Parameterized Bit-Width (parameter N): By using [N-1:0], the counter can be scaled from a 4-bit counter to a 32-bit counter without changing the logic.

Nested Conditional Logic: The use of if(mode) followed by boundary checks (counter == 2*N-1 or counter == 0) ensures that the counter stays within the defined mathematical range.

Non-Blocking Assignments (<=): Standard practice for sequential logic to ensure that the "read-before-write" behavior of flip-flops is modeled correctly.

**Simulation Result**

<img width="1545" height="262" alt="UpDown_Counter_sim" src="https://github.com/user-attachments/assets/43d1547b-1a32-480c-b8d6-58e12995e8b0" />


<img width="867" height="687" alt="UpDown_Counter_console" src="https://github.com/user-attachments/assets/f3a53348-4903-40bb-b825-716baf1cc504" />
