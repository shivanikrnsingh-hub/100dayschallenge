**Description**
The PIPO (Parallel-In Parallel-Out) Register is the most direct way to store multi-bit data in a digital system. Unlike shift registers, a PIPO register does not move data between internal stages. Instead, it captures an entire bus of data (parallel_in) on a single clock edge and makes it immediately available at the output (parallel_out). It acts as a synchronous buffer, "freezing" data in time so it can be processed by other parts of the circuit.

**Hardware Architecture**

This design follows a Structural Modeling approach, where three independent D_flipflop instances are operated in parallel.

* Parallel Loading: Each bit of the input bus has its own dedicated storage element. There is no dependency between bits; bit 2 is stored in d1, bit 1 in d2, and bit 0 in d3.

* Zero-Shift Latency: Data does not "ripple" through the registers. It is transferred from input to output in exactly one clock cycle.

* Shared Control: A single clk and reset signal govern all three flip-flops, ensuring the entire 3-bit word is updated or cleared at the exact same moment.

**Key Verilog Concepts**

Vector Port Mapping: The code demonstrates how to connect specific indices of a bus (parallel_in[2]) to individual module ports.

Structural Parallelism: By instantiating multiple modules side-by-side rather than in a chain (as seen in SISO/SIPO), we create a parallel data path.

Synchronization: This module is the fundamental building block for CPU Registers (like EAX or R0), where data needs to be held stable for the duration of a clock cycle for the ALU to perform operations.

**Simulation Result**

<img width="1682" height="318" alt="PIPO_sim" src="https://github.com/user-attachments/assets/e455e52f-02dd-434f-89fa-291750a32e3a" />
