**Description**

This module implements an SR (Set-Reset) Latch with an active-high Enable (en) and a Reset (rst) signal. Unlike a Flip-Flop, a latch is level-sensitive, meaning the output can change as long as the Enable signal is high. This design demonstrates the fundamental way to store a single bit of state using combinational feedback logic.

**Hardware Architecture**

The design uses a behavioral always@(*) block, which correctly models the level-sensitive nature of a latch.

* Reset Logic: The rst signal has the highest priority. If rst is high, the output Q is forced to 0.

* Enable Logic: The latch only responds to the S and R inputs when en is high.

**The "Invalid" State:**

When both S and R are high (2'b11), the latch enters an unstable or forbidden state. In this Verilog model, this is explicitly handled by assigning 1'bx (unknown), which helps during simulation to identify logic errors.
