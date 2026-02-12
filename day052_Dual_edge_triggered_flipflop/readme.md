**Description**

Standard flip-flops only capture data on one edge of the clock (usually the rising edge). A Dual-Edge Triggered Flip-Flop captures data on both the rising and falling edges. This allows the circuit to process two bits per clock cycle, effectively doubling the bandwidth of the data path while maintaining a lower clock speed, which helps in reducing power consumption and electromagnetic interference (EMI).

**Hardware Architecture**

Since standard FPGA/ASIC hardware cells are typically single-edge triggered, a DETFF is usually implemented using a parallel "shadow register" architecture:

* Positive-Edge Path (Q1): A D-FF that updates on the posedge clk.
* Negative-Edge Path (Q2): A D-FF that updates on the negedge clk.
* Selection Logic (MUX): A continuous assignment acts as a multiplexer to select the output.
* Logic: assign Q = clk ? Q1 : Q2;When clk is High, it outputs the value sampled at the rising edge.When clk is Low, it outputs the value sampled at the falling edge.

**Key Verilog Concepts**

* Parallel always Blocks: Demonstrates that multiple blocks can drive different internal registers (Q1, Q2) based on different triggers of the same clock.Clock-as-
* Control: In the assign statement, the clock is treated as a level-sensitive control signal for the MUX.
* Throughput Optimization: This design shows how to achieve high-speed data transfer ($2\times$ data per cycle) without the timing closure headaches of a high-frequency clock tree.

**Simulation** 
<img width="1383" height="252" alt="Dual_edge_triggered_flipflop_sim" src="https://github.com/user-attachments/assets/e54b44c9-6038-41c6-a867-cc217fa869ea" />

**Applications**

* DDR SDRAM Controllers: Capturing data on both edges of the DQS (Data Strobe).
* Clock Doublers: Generating pulses on every transition.
* High-Efficiency Pipelines: Moving data faster in power-constrained environments where increasing frequency isn't an option.
