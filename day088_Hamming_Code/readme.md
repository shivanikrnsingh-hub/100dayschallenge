**Description**

Reliable data transmission is critical in digital systems where electrical noise can flip bits during transit. This project implements a (7, 4) Hamming Code system, which is a specific class of Error-Correcting Code (ECC). It can detect and correct single-bit errors (SEC) and detect double-bit errors.The system is split into two primary modules:Hamming Encoder: Converts a 4-bit data nibble into a 7-bit codeword by adding 3 parity bits.Hamming Error Detector/Decoder: Analyzes the 7-bit codeword, identifies the exact position of a bit flip using syndrome calculation, corrects it, and extracts the original 4-bit data.

**Hardware Architecture**

1. Hamming Encoder

   The encoder uses Even Parity. Each parity bit ($p_1, p_2, p_3$) is responsible for a specific set of data bits, creating an overlapping coverage map:
   * $p_1$ (Position 1): Covers positions 1, 3, 5, 7.
   * $p_2$ (Position 2): Covers positions 2, 3, 6, 7.
   * $p_3$ (Position 4): Covers positions 4, 5, 6, 7.

The 7-bit output is structured as: {D4, D3, D2, P3, D1, P2, P1}.

2. Error Detector & Decoder

   This module calculates the Syndrome Vector ($S_3, S_2, S_1$). The syndrome acts as a binary pointer to the error location:

   * If Syndrome = 000: No error detected.
   * If Syndrome $\neq$ 000: The decimal value of the syndrome indicates exactly which bit (1 through 7) flipped.
   * Correction: The module uses a bitwise NOT operation on the identified error position to flip the bit back to its original state.


**Technical Implementation Details**

Combinational Correction: The detector uses an always@(*) block to perform real-time bit correction based on the error_position.

XOR Logic: Parity and Syndrome calculations are handled entirely with XOR gates, which are highly efficient and provide low-latency error detection.

Bit Mapping: The design uses the standard (7, 4) mapping where parity bits occupy powers of 2 (positions 1, 2, and 4), while data bits fill the remaining slots.

**Simulation Result**

<img width="1292" height="452" alt="hamming_code_error_dectector_sim" src="https://github.com/user-attachments/assets/799b4bce-2c8e-46b5-820a-2c609bed6e4e" />


<img width="736" height="223" alt="hamming_code_error_dectector_console" src="https://github.com/user-attachments/assets/3b129de5-09ff-43ef-9e16-fc8d0f8384c2" />
