**Description**

A Demultiplexer (or "Data Distributor") is the functional opposite of a Multiplexer.
It takes a single input signal (I) and routes it to one of several outputs based on a selection signal (sel).
A 1x2 DEMUX has one input, one select line, and two potential output paths.

**Hardware Architecture**

This design uses a compact Dataflow Modeling style.
The logic determines which output bit receives the input signal while the other output is pulled to a logic low (0).
Logic Equations:$Y_0 = I \cdot \overline{Sel}$
$Y_1 = I \cdot Sel$

**How it works:**
When $Sel = 0$: 

The concatenation result is {I, 1'b0}, meaning $Y_0 = I$ and $Y_1 = 0$.

When $Sel = 1$: The concatenation result is {1'b0, I}, meaning $Y_0 = 0$ and $Y_1 = I$.

**Key Verilog Concepts**

* Concatenation { }: You’ve used concatenation on both sides of the assignment.
* This allows you to update multiple output ports (y0 and y1) in a single line of code.
* Ternary Operator (? :): Acts as a conditional switch.
*  It is the most concise way to implement simple "if-else" logic in a continuous assignment.
*  Zero-Padding: By explicitly setting the unused output to 1'b0, you ensure the circuit doesn't create "latches" or undefined states,
  which is critical for clean hardware synthesis.

**Applications**
* Address Decoding: Directing a "Write Enable" signal to a specific memory bank.
* Serial-to-Parallel Conversion: Helping route bits from a single serial line to multiple parallel registers.
* Resource Sharing: Taking a signal from a shared processing unit and sending it to the correct peripheral.

**Synthesis Result**

<img width="551" height="467" alt="Demultiplexer_1x2_syn" src="https://github.com/user-attachments/assets/8f4c108a-3e0f-4ad2-8d5e-651d61c3b378" />
