**Description**

This project demonstrates Dataflow Modeling (often used as the basis for Structural Modeling) in Verilog. Unlike Behavioral modeling which uses procedural blocks, this style uses continuous assignments to describe how data flows through the circuit from inputs to outputs.

In this module, I have implemented a suite of basic and universal logic gates using the assign keyword, which represents physical wires and gate connections.

**Hardware Logic**
The design uses Continuous Assignment Statements. These statements are concurrent, meaning the order in which they are written does not matter—the hardware synthesizer treats them as parallel logic gates connected by wires.

**Implemented Operations:**

* Basic Gates: AND (&), OR (|), NOT (~).

* Universal Gates: NAND and NOR implemented using bitwise logic.

* Special Gates: XOR (^) and XNOR (~^).

**Key Verilog Concepts**

* Wire Data Type: In this modeling style, outputs are implicitly treated as wire. Unlike the reg type used in Day 001, wires do not "store" values; they simply transmit them.

* Concurrent Execution: All assign statements execute at the same time. This more accurately reflects how physical hardware behaves compared to the sequential nature of software.

* Continuous Assignment: The assign statement ensures that any change in the input (a or b) is immediately reflected at the output, with no need for a sensitivity list.

**Simulation Result**

<img width="1782" height="1020" alt="structure_model_sim" src="https://github.com/user-attachments/assets/671e9ecf-97d4-4482-9c7d-e17181aa36ad" />


