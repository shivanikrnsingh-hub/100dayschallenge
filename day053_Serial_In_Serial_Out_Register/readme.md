 **Description**
 
 The SISO (Serial-In Serial-Out) Shift Register is a fundamental sequential circuit used to delay data or provide a temporary buffer for bit-stream processing. In this design, data enters one bit at a time via serial_in and is "shifted" through a series of Flip-Flops on every rising edge of the clock. It takes exactly $N$ clock cycles (where $N$ is the number of stages) for a bit to travel from the input to the output.
 
**Hardware Architecture**

* This implementation utilizes Structural Modeling, which is a best practice for building modular RTL. It instantiates the D_flipflop module you developed earlier in the series.
* Daisy-Chain Connection: The output of the first stage (q0) feeds the input of the second, and q1 feeds the third.
* Sequential Latency: Because there are 3 Flip-Flops, this acts as a 3-cycle delay line.
* Synchronous Reset: All stages are governed by a common reset, ensuring the pipeline is cleared simultaneously to avoid junk data.
**Key Verilog Concepts**
Component Reusability: By instantiating D_flipflop, you demonstrate how to build complex systems from simple, verified primitives.
Internal Wires: wire q0, q1 are used to create the internal data path that isn't visible at the top-level ports.
Structural Interconnects: Mapping the output Q of one instance to the input D of the next creates the "shifting" mechanism.

**Simulation**

<img width="1752" height="531" alt="SISO_sim" src="https://github.com/user-attachments/assets/2edbfd21-ec99-454e-b0b1-706614c70b1c" />


**Applications**
* Bit Delay Lines: Synchronizing signals that arrive at different times in a digital system.
* Serial Communication: Receiving or transmitting data over a single wire (e.g., UART/SPI).Digital Signal Processing (DSP): Storing samples for filters or correlation algorithms.
