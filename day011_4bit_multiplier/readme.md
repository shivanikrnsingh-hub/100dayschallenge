**Description**

This project implements a 4-Bit Binary Multiplier. 
It mimics the manual long-multiplication process used in mathematics, 
where each bit of the multiplier determines whether a shifted version of the multiplicand is added to the final result.

**Hardware Architecture**
The design calculates the product of two 4-bit numbers (A and B) to produce an 8-bit output. 
It operates on the principle of Partial Product Generation.

**How the Logic Works:**

**Partial Product Generation:** For each bit of multiplier B, the circuit checks if the bit is 1.If B[i] is 1,
the multiplicand A is shifted left by i positions.If B[i] is 0, the partial product for that stage is zero.

**Shifting:** The << operator is used to align the partial products according to their binary weight (position).

**Summation:** All four partial products (t1, t2, t3, t4) are summed together to form the final 8-bit product.

**Key Verilog Concepts**

* Ternary Operator (? :): Used as a clean, hardware-efficient way to implement a 2-to-1 Multiplexer for each partial product stage.
* Shift Operator (<<): Represents the positional weight of binary multiplication.

 In hardware, this doesn't require actual gates—it is simply done through wiring (routing).

 Width Expansion: Notice that while the inputs are 4-bit, the partial products and the final output are 8-bit. This is because the product of two $N$-bit numbers can result in a number up to $2N$ bits wide.
 
 **Console Result**

 <img width="606" height="235" alt="4bit_multiplier_console" src="https://github.com/user-attachments/assets/ea34d864-d0db-459a-9c0e-9caeb14bc185" />
