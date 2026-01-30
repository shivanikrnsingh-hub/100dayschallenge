**Description**

This module converts a 4-bit Binary Coded Decimal (BCD) input into the signals required to drive a 7-segment display. Each output (a through g) controls one LED segment of the display to visualize the digits 0–9. Unlike a behavioral lookup table, this design uses optimized Boolean expressions derived from Karnaugh Maps (K-Maps).

**Hardware Architecture**
The design maps the 4-bit input to 7 individual combinational logic circuits.

* Segment Mapping:
The segments are typically labeled a (top) clockwise to f (top-left), with g as the middle bar.

* Logic Style: This implementation is Active-High (Common Cathode), meaning a 1 turns the segment ON.

**Equation Examples:**

assign a = BCD[3]|BCD[1]|(BCD[2]~^BCD[0]); — This handles the top segment, ensuring it lights up for digits like 0, 2, 3, 5, 7, 8, and 9.

The use of XNOR (~^) is a clever way to check for equality between bits, which is a common pattern in segment optimization.

**Key Verilog Concepts**

Dataflow Modeling: Using assign statements for each segment allows the synthesizer to create a very flat, high-speed gate structure.

Vector Concatenation: assign segment7 = {a,b,c,d,e,f,g}; gathers the individual wires into a single 7-bit bus. This makes it much easier to connect the module to a top-level physical pinout.

K-Map Optimization: These equations are the result of logic minimization. By identifying "Don't Cares" for inputs 10–15 (since BCD only goes to 9), the logic is kept as lean as possible.

**Applications**

Digital Clocks: Displaying hours, minutes, and seconds.

Calculators: Providing a low-power, high-visibility numeric interface.

Embedded Systems: Used for debugging or displaying sensor values (temperature, voltage, etc.).

**Console Result**

<img width="935" height="388" alt="BCD_to_7_segment_console" src="https://github.com/user-attachments/assets/52856560-cc0e-4342-84bc-4e8f7faf1d44" />


📈 Simulation Result
When you input 4'b0101 (Decimal 5), the segments a, c, d, f, g will go high, forming the character '5' on the physical display.
