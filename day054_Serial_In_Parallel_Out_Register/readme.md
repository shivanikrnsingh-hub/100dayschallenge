**Description**

The SIPO (Serial-In Parallel-Out) Shift Register is a fundamental building block for data communication. It takes data bit-by-bit from a single wire (serial_in) and, after a set number of clock cycles, presents the entire "word" at once on a multi-bit bus (parallel_out). This is the core logic behind how a computer receives data from a serial port or a sensor.

**Hardware Architecture**

This implementation uses a Structural Design pattern, daisy-chaining three D_flipflop modules.
The Chain: 
* serial_in goes into d1 $\rightarrow$ output is parallel_out[2]parallel_out[2] goes into d2 $\rightarrow$ output is parallel_out[1]parallel_out[1] goes into d3 $\rightarrow$ output is parallel_out[0]

* Parallel Access: Unlike the SISO register, we have "taps" at every stage of the pipeline, allowing us to see the state of every flip-flop simultaneously.
  
**Key Verilog Concepts**

* Bus Slice Mapping: I am directly mapping individual bits of the output [2:0] parallel_out bus to the output ports of the D_flipflop instances.

* Component Instantiation: Reusing the D_flipflop primitive ensures that if your basic flip-flop is verified, your shift register is inherently more reliable.Data Transformation: This module demonstrates Serial-to-Parallel conversion, which is essential for interfaces like SPI or UART where data arrives on one pin but must be processed by an 8-bit or 32-bit CPU.

**Simulation Result**

<img width="766" height="395" alt="SIPO_console" src="https://github.com/user-attachments/assets/dde80e68-2dba-4230-8379-1e1fca3dcf2c" />
