**Description**

Converting an 8-bit binary number (max value 255) into Binary Coded Decimal (BCD) requires three separate 4-bit nibbles to represent the Hundreds, Tens, and Units places. This module uses the Double Dabble algorithm, which efficiently performs this conversion using only bit-shifts and conditional additions.

**Hardware Architecture**

The logic operates by iterating through each bit of the 8-bit input and "shifting" them into the BCD registers (bit2, bit1, bit0).The Double Dabble Logic:Initialize: Clear the Hundreds (bit2), Tens (bit1), and Units (bit0) registers.Check: In every iteration, if any BCD nibble is greater than 4 ($>4$), add 3 to that nibble.Why 3? In BCD, a nibble cannot exceed 9. When we shift a value $\ge 5$ to the left, it effectively multiplies by 2, creating a value $\ge 10$, which "breaks" the BCD format. Adding 3 before the shift compensates for this "gap" in the hex-to-decimal transition.Shift: Perform a massive concatenation shift, pulling the MSB of the data into the BCD registers.Repeat: Do this exactly 8 times (once for each bit of the input).

**Key Verilog Concepts**
Concatenation { }: used a  {bit2,bit1,bit0} = {bit2,bit1,bit0,data[7-n]};. This treats the three 4-bit registers and the input bit as a single 13-bit shift register.For Loops in Combinational Logic: The for loop is not a "sequential" process like in C++; the synthesizer unrolls this into a deep combinational path of comparators and adders.Multiple Output Formats: Providing both individual nibbles (bit0, bit1, bit2) and a combined 12-bit BCD bus makes this module very easy to integrate into larger systems.

**Simulation Result**
<img width="637" height="427" alt="binary_to_bcd_console" src="https://github.com/user-attachments/assets/2f5552e3-4422-42e4-b892-48ca3363ea41" />

