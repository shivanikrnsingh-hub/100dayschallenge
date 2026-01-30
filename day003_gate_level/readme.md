 **Description**
 
This project demonstrates Gate Level Modeling in Verilog. This is the lowest level of abstraction in Hardware Description Languages (HDL). Instead of using mathematical operators or procedural blocks, we use Built-in Gate Primitives to describe the exact hardware structure.

This style is very close to a physical schematic, as it specifies exactly which gates are used and how they are wired together.

**Hardware Architecture**
In this module, I have instantiated Verilog's built-in primitives. Each gate follows a specific syntax: gate_type instance_name (output, input1, input2, ...);.

**Implemented Primitives:**

* and, or, xor: Basic logic primitives.

* nand, nor, xnor: Universal and special logic primitives.

* not: A single-input primitive.

**Key Verilog Concepts**

Primitives: These are built-in modules in Verilog (like and, nand, or) that do not need to be defined by the user.

* Instance Names: Even though the synthesizer doesn't strictly require them for primitives (e.g., and1, or1), it is a professional practice to name them for easier debugging in the netlist.

* Net-Based Connection: This modeling style treats every connection as a physical wire. There is no concept of "storing" a value; the signal propagates through the gate delay.

**Simulation Result**

<img width="1782" height="1020" alt="Gate_level_sim" src="https://github.com/user-attachments/assets/d84b8ce6-f557-4d34-92a4-40ebe07a8c37" />

