**Description**

A 1-to-8 Demultiplexer (DEMUX) takes a single input signal (I) and routes it to one of eight output lines ($Y_0$ through $Y_7$) based on a 3-bit selection signal (sel[2:0]). This implementation uses a Tree Topology, branching out from a single 1x2 DEMUX into a network that spans three logical levels.

**Hardware Architecture**

The design is organized into three distinct "levels" or "stages" of routing:

1. Level 1 (MSB Selection):dmux1 uses sel[2] to decide if the input I should go to the "Upper Half" (outputs 0-3) or the "Lower Half" (outputs 4-7).
  
2. Level 2 (Middle Bit Selection):dmux2 and dmux3 use sel[1] to further narrow down the path. These modules receive the signals from Level 1 via the internal wires z[0] and z[1].
3. Level 3 (LSB Selection):The final four modules (dmux4 through dmux7) use sel[0] to route the signal to the exact final output pin.

**Key Verilog Concepts**

Structural Hierarchy: This is the most "hardware-accurate" way to model. Each instantiation of Demultiplexer_2x1 maps to a physical block of gates.Interconnect Management: I used a wire [5:0] z bus to manage all internal connections. 
This keeps the top-level module clean and organized.

Signal Propagation: This design highlights the latency inherent in large routing structures. A signal must pass through three levels of 1x2 DEMUXes before reaching the output, demonstrating how "Select-to-Output" delay grows as the tree gets deeper.
🚀 Why a Tree Structure?

Modularity: One can build a 1x16 or 1x32 DEMUX just by adding another layer.Predictable Timing: Each path from input to any output passes through the exact same number of gates, ensuring balanced signal timing across all outputs.

**Console Result**

<img width="650" height="307" alt="Demu_1x8_console" src="https://github.com/user-attachments/assets/21074e07-fbb2-442b-9168-b57dcec840e3" />

**Synthesis Result**

<img width="347" height="443" alt="Demu_1x8_syn" src="https://github.com/user-attachments/assets/d74ef703-530a-40e6-8bcd-73656f7bf6c0" />


