**Description**

This project demonstrates the Behavioral Modeling style in Verilog. Behavioral modeling is the highest level of abstraction, where the circuit is described by its functional behavior rather than its physical gate structure or interconnections.

* In this module, I have implemented all the basic and universal logic gates using procedural assignments within an always block.

**Hardware Logic**

The design utilizes the always@(*) block, which is sensitive to any change in the input signals (a or b). This ensures the outputs are updated immediately (combinational logic), mimicking the behavior of physical gates.

**Implemented Gates:**

* AND, OR, XOR: Standard basic logic operations.

* NAND, NOR, XNOR: Universal and special logic operations using the bitwise NOT ~ operator.

* NOT: A unary operation performed on input a.

**Key Verilog Concepts**

* Reg Data Type: In behavioral modeling, outputs must be declared as reg because they are assigned within a procedural (always) block.

* Sensitivity List: The (*) symbol indicates that the block is sensitive to all inputs, preventing the creation of unintended latches.

* Blocking Assignments: Used the = operator for combinational logic to ensure assignments happen in the order they are written.

  **Simulation Result**
  
  <img width="1920" height="1080" alt="behavioural_model_simulation" src="https://github.com/user-attachments/assets/b034c85b-f2b0-4f7f-8274-382242efde3a" />

