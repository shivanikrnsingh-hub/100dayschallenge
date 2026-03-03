 **Description**
 
 The Even-Odd Detector is a fundamental digital logic circuit used to determine the parity of a binary number. In binary number systems, the distinction between even and odd integers is determined entirely by the Least Significant Bit (LSB).This module takes a 4-bit input (num) and  produces a single-bit output (even_odd). If the input number is even, the output is driven High (1); if the number is odd, the output is driven Low (0).
 
**Hardware Architecture**

The architecture is implemented using Continuous Assignment, making it a purely combinational circuit. Because the LSB (bit 0) of any binary integer represents the 
$2^0$ ($1$) position:Even numbers always have a 0 at num[0].Odd numbers always have a 1 at num[0].The logic uses a simple bitwise NOT operation on the LSB to align the output with the "Even = 1" requirement.

**Simulation output**

<img width="937" height="202" alt="Even_odd_detector_sim" src="https://github.com/user-attachments/assets/8b5664a6-0e3b-44f9-881c-435d8c54684b" />


**Sample Table**

<img width="497" height="197" alt="image" src="https://github.com/user-attachments/assets/3c99dc42-5b8c-4b98-a6ab-57e503e812be" />

