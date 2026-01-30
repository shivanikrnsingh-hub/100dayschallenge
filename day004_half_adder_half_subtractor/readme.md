 Description
 This project covers the two fundamental building blocks of digital arithmetic:
 the Half Adder and the Half Subtractor. 
 These combinational circuits perform the simplest form of binary math—operating on two single-bit inputs to produce results and status flags (Carry/Borrow).
 
**1. Half Adder**
  
 The Half Adder performs the addition of two bits ($A + B$).
 It is the starting point for complex units like the Ripple Carry Adder.
 
 **Hardware Logic:**
 * Sum ($S$): Calculated using an XOR gate ($A \oplus B$).
 * Carry ($C$): Calculated using an AND gate ($A \cdot B$).
 
 **2. Half Subtractor**
 The Half Subtractor performs the subtraction of two bits ($A - B$). 
 It determines the difference and whether the operation requires a "borrow" from a higher-order bit.
 
 **Hardware Logic:**
 Difference ($Diff$): Calculated using an XOR gate ($A \oplus B$).
 Borrow ($Borr$): Calculated using an AND gate with an inverted input ($\overline{A} \cdot B$).
 
 **Key Verilog Concepts**
 
 Dataflow Modeling: Both circuits are implemented using the assign keyword for continuous assignment.
 Logic Symmetry: Notice that the Sum and Difference use the exact same XOR gate. This symmetry is why modern CPUs can often use similar hardware paths for both addition and subtraction.
 Foundation for Full Units: These "Half" units do not account for inputs from previous stages (Carry-in or Borrow-in). 
 They serve as the primitives for the Full Adder and Full Subtractor.
 
 **Simulation Result**

**half adder**

<img width="1782" height="222" alt="half_adder_sim" src="https://github.com/user-attachments/assets/7710e81d-7e38-4f15-ae4d-68179e2300be" />

 
 **half subtractor**

 <img width="1782" height="256" alt="half_subtractor_sim" src="https://github.com/user-attachments/assets/53724e5f-5009-44be-ae99-d2509df4fe3b" />
