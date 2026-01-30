**Description**

This project implements a Parameterizable Magnitude Comparator. 
A comparator is a combinational logic circuit that compares two binary numbers ($A$ and $B$) and determines their relative magnitude. 
This design produces three distinct outputs: Greater, Lesser, and Equal.

**Hardware Architecture**

The module uses Behavioral Modeling with a parameterizable bit-width. By default, the circuit is set to 8 bits, but it can be instantiated for any width (4-bit, 16-bit, 32-bit, etc.) at the top level.
* Logic Execution:The circuit evaluates the inputs using a priority-based conditional structure:
* Greater Than ($A > B$): High if the numerical value of $A$ is strictly more than $B$.
* Lesser Than ($A < B$): High if the numerical value of $A$ is strictly less than $B$.
* Equal ($A = B$): High only if every corresponding bit in $A$ and $B$ is identical.

  **Hardware Mapping:**
  When synthesized, this behavioral code is mapped to high-speed hardware comparators:
  The Equal logic is effectively a wide XNOR tree followed by an AND gate.
  The Greater/Lesser logic is typically implemented using a subtraction-based architecture (where the sign bit of $A - B$ determines the result) or a fast-carry lookahead tree.

  **Key Verilog Concepts**

  Parameters (parameter N = 8): This makes the code highly flexible and reusable.
  It allows the designer to change the data width during instantiation without modifying the source code.
 , hard-coding bit-widths is avoided. Using parameters allows this single module to be used in a 32-bit CPU for branch instructions, or in a 4-bit peripheral for address matching, reducing code maintenance and verification time.

**Console Result**

<img width="587" height="228" alt="Nbit_comparator_console" src="https://github.com/user-attachments/assets/c0d4e220-235a-4497-b443-c942c1663137" />
