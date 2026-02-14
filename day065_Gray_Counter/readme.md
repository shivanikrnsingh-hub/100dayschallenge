
**Description**

The Gray Code Counter is one of the most critical sequential circuits in high-speed digital design. Unlike a standard binary counter where multiple bits can flip simultaneously (e.g., 0111 to 1000 involves 4-bit changes), a Gray counter ensures that only one bit changes at any given transition.This property is vital for preventing glitches and data corruption in Asynchronous FIFOs and Clock Domain Crossing (CDC) logic. If multiple bits change across different clock domains, the receiving side might sample an intermediate, incorrect value; Gray code eliminates this risk.

**Hardware Architecture**

This module uses a Binary-to-Gray Conversion approach:Binary Shadow Register (count): An internal 4-bit register increments normally as a binary counter ($0, 1, 2, 3 \dots$).Conversion Logic: On every clock cycle, the binary value is converted to Gray code using XOR gates and assigned to the output counter.

The Formula: To convert a Binary number ($B$) to Gray ($G$):The Most Significant Bit (MSB) remains the same ($G_3 = B_3$).Every other bit is the XOR of the corresponding binary bit and the bit to its left ($G_i = B_i \oplus B_{i+1}$).

**Key Verilog Concepts**

XOR-Based Transformation: The line counter <= {count[3], count[3]^count[2], count[2]^count[1], count[1]^count[0]}; perfectly implements the mathematical conversion in hardware.

Synchronous Reset: Ensures both the internal binary pointer and the external Gray output are cleared to 0 simultaneously.Sequential Latency: Note that in this specific implementation, because count and counter are updated in the same always block, the Gray output reflects the conversion of the previous binary value.

**Simulation Result**

<img width="1602" height="202" alt="gray_counter_sim" src="https://github.com/user-attachments/assets/1d45b959-4adc-4006-abde-a239c3fd7324" />

<img width="857" height="517" alt="gray_counter_console" src="https://github.com/user-attachments/assets/2e20925d-4c0d-4ca5-983b-e4a45f1a127e" />

