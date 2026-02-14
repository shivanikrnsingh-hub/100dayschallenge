**Description**

This module implements a classic RTL technique to achieve a near-50% duty cycle by leveraging both the positive and negative edges of the clock. It combines a Mod-7 counter with a falling-edge triggered D-Flip-Flop to "stretch" the output pulse by half a clock cycle.

**Hardware Architecture**

The design consists of three primary stages:Mod-7 Counter (m7): A synchronous counter that cycles from 0 to 6. The internal bit q[1] is used as the primary timing reference.

Negative-Edge D-Flip-Flop (d): By sampling q[1] on the falling edge (~clk), we create a version of the signal that is phase-shifted by 180°.

Combinational OR Gate: The final output clk_by7 is the logical OR of the original q[1] and its half-cycle delayed version (temp). This "stretches" the High period from 3 cycles to 3.5 cycles.

**Key Verilog Concepts**

Inter-module Instantiation: This module demonstrates structural Verilog by connecting a Mod_7_counter and a D_flipflop.

Half-Cycle Timing: Using ~clk is a standard way to access the falling edge of the system clock, allowing the logic to perceive time at half-step intervals.

Duty Cycle Correction: * Without the OR gate trick: Duty cycle = $3/7 \approx 42.8\%$.With the OR gate trick: Duty cycle = $3.5/7 = 50\%$.

**Simulation result**

<img width="1485" height="240" alt="frequency_divider_odd_sim" src="https://github.com/user-attachments/assets/ca5fd40c-d84f-4a12-aad5-9c0ee675d533" />
