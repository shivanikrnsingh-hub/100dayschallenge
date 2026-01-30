 **Description**
 
 This project implements a 4-to-1 Multiplexer by instantiating three 2-to-1 Multiplexers. 
 Instead of writing the Boolean logic from scratch, this design uses a hierarchical structure to select one of four inputs (A, B, C, D) based on a 2-bit selection signal (sel[1:0]).
 
 **Hardware Architecture**
 
 The design is organized into two stages of selection:
 
 * Stage 1 (LSB Selection):

 m1 selects between a and b based on sel[0].
 m2 selects between c and d based on sel[0].
 
* Stage 2 (MSB Selection):
   m3 takes the outputs from the first stage (w[0] and w[1]) and selects between them based on sel[1].
**Key Verilog Concepts**
  * Module Reusability: This design reuses the mux_2x1 module from Day 014.
    In industry, this reduces verification effort because the sub-module is already tested.
  * Internal Wires: The wire [1:0] w bus acts as the physical connection between the first and second stages of the multiplexer tree.
  * Hierarchical Port Mapping: Connections are made by position or name, ensuring that the selection signals are routed correctly to the different levels of the tree.
  
**Why Use a Tree Structure?** 
It makes the design modular and easier to read, especially as the number of inputs grows (e.g., building a 16x1 or 32x1 Mux).

**Synthesis Result**

<img width="1040" height="753" alt="Mux_4x1_using_2x1_syn" src="https://github.com/user-attachments/assets/a27e59ee-3df1-4d89-aa17-886255a68103" />
