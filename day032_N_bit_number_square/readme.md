**Description**

This project implements a Square Unit ($Result = Num^2$) using a parameterized approach. In digital signal processing (DSP) and graphics acceleration, squaring is a frequent operation.
This module allows the user to define the input bit-width ($N$), automatically scaling the output width to $2N$ to prevent overflow.

**Hardware Architecture**

The module utilizes the Verilog multiplication operator (*) within a combinational always block.Bit-Width Math:
When you square an $N$-bit number, the maximum possible result requires $2N$ bits.For $N=8$ (default): $255^2 = 65,025$ (Fits in 16 bits).For $N=4$: $15^2 = 225$ (Fits in 8 bits).

Hardware Mapping:

While the code looks like a simple software multiplication, the synthesizer maps this to specialized hardware:DSP Slices: On FPGAs (like Xilinx or Altera), this will often be mapped to dedicated silicon multipliers/DSP slices for maximum speed.


**Console Result**

<img width="610" height="241" alt="n_bit_square_console" src="https://github.com/user-attachments/assets/28d735da-261e-4104-99af-a92bfe654168" />

