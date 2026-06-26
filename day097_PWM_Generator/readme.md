## **Day 096: Multi-Channel Pulse Width Modulation (PWM) Generator**

### **Description**
This project implements a parameterized, synchronous **Multi-Channel Pulse Width Modulation (PWM) Generator**. PWM is an essential technique used to control analog circuits using digital outputs by varying the duty cycle of a square wave. 

This design features a fixed-width free-running master counter paired with concurrent combinational comparators. It simultaneously synthesizes three independent PWM output streams fixed at standardized structural power delivery weights: **25%**, **50%**, and **75%** duty cycles.

---

### **Hardware Architecture**
The architectural topology achieves a compact footprint by sharing a single master tracking register across multiple parallel comparison networks:

* **Free-Running Master Counter (`counter`):** An 8-bit synchronous register (`BIT_WIDTH = 8`) that counts linearly from `0` to `255` before rolling over naturally. It serves as the shared digital timebase for all channels.
* **Static Threshold Decoders:** Defines fixed comparative thresholds via local constants mapped to exact fractional divisions of the total 256 counter step space:
  * **Threshold (25%):** 64 (`8'd64`)
  * **Threshold (50%):** 128 (`8'd128`)
  * **Threshold (75%):** 192 (`8'd192`)
* **Zero-Lag Combinational Comparators:** Three continuous `assign` networks constantly poll the active counter state. By keeping the output high when the counter is below the threshold and low when it is equal or greater, the design achieves immediate, unclocked output updates.

---

### **Duty Cycle Waveform Mappings**

| Output Channel | Binary Condition Criteria | Active High Clock Steps | Active Low Clock Steps | Exact Duty Cycle |
| :---: | :--- | :---: | :---: | :---: |
| **`pwm_25`** | `counter < 8'd64` | 64 cycles | 192 cycles | **25.00%** |
| **`pwm_50`** | `counter < 8'd128` | 128 cycles | 128 cycles | **50.00%** |
| **`pwm_75`** | `counter < 8'd192` | 192 cycles | 64 cycles | **75.00%** |

---

### **Technical Implementation Details**
* **Combinational Comparator vs. Registered Boundary:** Designing the output logic with continuous assignments (`wire`) rather than within a sequential `always` block eliminates a 1-clock pipeline cycle lag. The output reacts instantly within the same cycle the counter increments.
* **Race-Condition Immune Verification:** The verification architecture checks values on the falling edge (`negedge clk`). Testing state variables *outside* the active tracking edge window guarantees zero setup or hold evaluation violations within the simulation engine.
* **Glitch-Free Overflow Resolution:** Relying entirely on natural register binary wrapping mechanics (`8'hFF` + `1` $\rightarrow$ `8'h00`) avoids conditional math resets, preventing hazardous glitch transitions at boundary rollover margins.

---

### **Applications**
* **Power Electronics Control:** Generating driver triggers for DC-to-DC buck/boost converter topologies and switched-mode power supplies (SMPS).
* **Motor Speed Regulators:** Adjusting active voltage drive feeds for Brushless DC (BLDC) and standard coreless DC motor hardware.
* **Visual Intensity Controllers:** Smoothly adjusting backlight dimming matrices for LED indicators and display array setups.

---

### **Verification & Testbench Summary**
The test fixture environment (`pwm_generator_tb`) implements an automated concurrent verification architecture running on a 100 MHz clock grid ($T = 10\text{ns}$):
1. **Global Settling Verification:** Drives an initial 100ns active-low reset window to let global simulation nets settle cleanly before starting the counter logic.
2. **Automated Verification Engine:** Continuously samples the UUT's internal counter state relative to output lines using explicit dual-branch inequalities (`!==`). Any structural deviations instantly trip a specific console diagnostic notice showing the timestamp and faulty value.
3. **Multi-Cycle Saturation:** Drives the simulation for exactly $7680\text{ns}$, which covers three complete 256-step counter loops. This validates long-term stability and confirms zero drift across rollover boundaries.
