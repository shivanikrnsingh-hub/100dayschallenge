**Description**

A Mod-N Counter (also known as a divide-by-N counter) is a sequential circuit that counts from $0$ up to $N-1$ and then resets back to $0$ on the next clock cycle. Unlike a standard binary counter that always wraps around at $2^n$, a Mod-N counter allows for a custom "terminal count."

This specific implementation is highly flexible because it uses Verilog parameters. By changing the values of N and length during instantiation, this single piece of code can act as a Mod-6 counter (for seconds/minutes), a Mod-10 counter (for BCD), or any other count limit required by the system.

**Hardware Architecture**

The design follows a synchronous counting methodology:

* Parameterized Design: * N: Defines the count limit (e.g., $N=6$ means it counts $0, 1, 2, 3, 4, 5$).
* length: Defines the bit-width of the register (e.g., $3$ bits for values up to $7$).
* Synchronous Reset: Ensures the counter starts at $0$ reliably.
* Comparison Logic: On every clock edge, the current value is compared to $N-1$. If they match, the counter "clears" itself back to zero instead of incrementing.

**Key Verilog Concepts**
  * Parameters (parameter): This is a powerful RTL feature that makes the module reusable. It allows the designer to change the counter's behavior without modifying the internal logic.
  * Non-Blocking Assignments (<=): Used to avoid race conditions and ensure the counter behaves correctly as a sequential circuit.
  * Implicit vs. Explicit Reset: While the counter wraps around at $N-1$ explicitly, the reset signal provides a way to force the counter to $0$ at any time, which is essential for system synchronization.

**Simulation Result**

<img width="1527" height="208" alt="Mod-N_counter_sim" src="https://github.com/user-attachments/assets/a8c0e6f8-5356-43d9-b4fc-15bf66e14a5f" />
