**Description**
Excess-3 (also known as XS-3) is a non-weighted code used in older computer systems and decimal arithmetic units. To convert a Binary Coded Decimal (BCD) digit to Excess-3, you simply add 3 (binary 0011) to the BCD value. This code is particularly useful because it is self-complementing, meaning the 1's complement of an Excess-3 number is the Excess-3 representation of its 9's complement.

**Hardware Architecture**
The module uses a behavioral case statement to map the 10 valid BCD digits (0–9) to their corresponding Excess-3 values.

**The Conversion Logic:**

Input 4'b0000 (0): Output becomes 0 + 3 = 3 (4'b0011).

Input 4'b1001 (9): Output becomes 9 + 3 = 12 (4'b1100).

* Invalid States: Since BCD only uses values 0–9, any input from 10–15 is invalid. Your use of default: excess3_out = 4'bxxxx; is excellent for synthesis, as it tells the tool it can optimize those states however it wants (Don't Cares).

**Why Use Excess-3?**

Arithmetic Ease: It simplifies the "carry" logic in decimal addition.

Biased Representation: Since the value 0000 and 1111 are not used for valid digits, it helps in distinguishing between "zero" and a "broken" or "disconnected" line.

**Key Verilog Concepts**

Combinational always block: Using always@(bcd_in) ensures that the output updates immediately whenever the input changes.

Don't Cares (4'bxxxx): Using x in the default case allows the logic synthesizer to reduce the gate count by ignoring those specific input combinations during minimization (K-Maps).

Behavioral Mapping: This style is often preferred over structural logic (AND/OR gates) for converters because the Verilog compiler can optimize the truth table better than a human can by hand.

**Applications**

Decimal Subtraction: Used in ALU designs to perform 9's complement subtraction more easily.

Communication Systems: Used in some legacy data transmission formats to avoid long strings of zeros.

Historical Computing: Used in systems like the UNIVAC I to simplify hardware arithmetic.

**Console Result**

<img width="938" height="391" alt="bcd_to_excess3_console" src="https://github.com/user-attachments/assets/023a40f2-aaf9-460b-8321-0167733674dd" />

