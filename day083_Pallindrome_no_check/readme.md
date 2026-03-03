
**Description**

A Palindrome Sequence Detector is a combinational circuit designed to identify if a binary sequence reads the same forwards and backwards. In this implementation, a 16-bit input (num_in) is analyzed to determine its bitwise symmetry.The logic compares the original input vector against its own reversed bit-order. If the 16-bit string is perfectly symmetrical around its center point (between bit 7 and bit 8), the palindrome output is driven High (1).


**Hardware Architecture**

The design utilizes a Continuous Assignment with the Verilog Concatenation Operator {}. Unlike sequential logic that would require multiple clock cycles to shift and compare bits, this approach creates a parallel comparison tree.The hardware implementation effectively creates a 16-bit wide equality comparator. Each bit $i$ is compared to bit $15-i$. For example:Bit 15 is compared to Bit 0Bit 14 is compared to Bit 1... and so on until Bit 8 is compared to Bit 7.


**Sinmulation Results**

<img width="1123" height="165" alt="palindrome_sequence_check_sim" src="https://github.com/user-attachments/assets/755e4836-d754-41ac-b3dc-d35da8089a6a" />
