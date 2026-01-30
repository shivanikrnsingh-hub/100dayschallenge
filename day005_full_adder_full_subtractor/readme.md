
**Description**

This project focuses on the implementation of Full Adder and Full Subtractor circuits. 
Unlike the half-units, these "Full" circuits include a third input ($Cin$ or $Bin$), allowing them to be cascaded together to perform multi-bit arithmetic operations.

**1. Full Adder**

The Full Adder adds three one-bit numbers: 
$A$, $B$, and an input carry $Cin$. 
It is the fundamental building block for Ripple Carry Adders.
**Logic Equations:**
* Sum ($S$): $A \oplus B \oplus Cin$
* Carry-out ($Cout$): $(A \cdot B) + (Cin \cdot (A \oplus B))$
  
**2. Full Subtractor**

The Full Subtractor performs subtraction on three one-bit numbers:
$A$ (minuend), $B$ (subtrahend), and $Bin$ (borrow-in).

It calculates the difference and the new borrow-out.

**Logic Equations:**
* Difference ($Diff$): $A \oplus B \oplus Bin$
* Borrow-out ($Bout$): $(\overline{A} \cdot B) + (Bin \cdot \overline{(A \oplus B)})$

**Key Verilog Concepts**

* Hierarchical Potential:

  While these can be written using single assign statements, It is built by instantiating two Half Adders (or Half Subtractors) and an OR gate.
  * Cascading Logic: The $Cout$ of one Full Adder connects to the $Cin$ of the next, enabling the creation of 4-bit, 8-bit, or N-bit adders.
  **Symmetry in Hardware:**
  *  Notice that the Sum and Difference bits use identical XOR-based logic, which is a key feature in optimizing Arithmetic Logic Units (ALUs).
  
  **Simulation Result**
  **fulladder**
  
  <img width="1782" height="247" alt="full_adder_sim" src="https://github.com/user-attachments/assets/f6825b6a-54e2-424c-9d24-de78c52fa10b" />

  **fullsubtractor**

  <img width="1753" height="363" alt="full_subtractor_sim" src="https://github.com/user-attachments/assets/8a9d436b-f9dc-47c9-aaa7-87c96c00082f" />

  
