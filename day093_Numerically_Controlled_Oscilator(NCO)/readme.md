## **Day 093: Numerically Controlled Oscillator (NCO)**

### ** Description**
A **Numerically Controlled Oscillator (NCO)** is a fundamental building block in Digital Signal Processing (DSP) and Software Defined Radio (SDR) subsystems. It acts as a digital clock synthesizer, creating a synchronous output signal whose frequency is directly governed by a digital input value known as the **Frequency Tuning Word (FTW)** or **Control Word**.

This design implements a 32-bit phase accumulator. By continuously adding the control word to the current phase value on every active clock edge, the accumulator overflows at a rate proportional to the control word. Extracting the MSB of this phase register generates a precise, programmable square-wave clock output (`clk_out`).

---

### ** Hardware Architecture**
The architecture functions entirely on synchronous accumulation and output mapping:

* **Phase Accumulator Register (`phase_clk`):** A 32-bit internal tracking register that acts as a digital integrator, linearly stepping through a phase wheel ($0$ to $2^{32}-1$).
* **Phase Increment:** On every clock cycle, the module adds `controll_word` to `phase_clk`. The size of this step determines how quickly the register wraps around from maximum value back to zero.
* **MSB Extraction Output:** The design maps the Most Significant Bit (`phase_clk[31]`) directly to `clk_out`. Because this bit is high for the upper half of the accumulator's range ($180^\circ$ to $360^\circ$) and low for the lower half ($0^\circ$ to $180^\circ$), it naturally forms a square wave with a 50% duty cycle.

---

### ** Mathematical Foundations**
The output frequency ($f_{out}$) of an NCO is defined by the sampling clock frequency ($f_{clk}$), the phase accumulator word length ($M = 32$), and the input Frequency Tuning Word ($\Delta \theta$):

$$f_{out} = \frac{\Delta \theta \times f_{clk}}{2^M}$$

#### **Tuning Resolution & Limits:**
* **Frequency Resolution ($\Delta f$):** The minimum frequency step achievable when changing the control word by 1 bit:
  $$\Delta f = \frac{f_{clk}}{2^{32}}$$
* **Nyquist Limit:** The maximum theoretical output frequency occurs when $\Delta \theta = 2^{31}$ (`32'h8000_0000`), yielding exactly half the sampling clock frequency ($f_{out} = \frac{f_{clk}}{2}$).

---

### ** Technical Implementation Details**
* **Address Phase Wrapping:** No explicit conditional overflow checking logic is required. The binary rollover properties of fixed-width hardware registers (`32'b111...11` + `1` $\rightarrow$ `32'b000...00`) handle the phase wheel wrapping naturally.
* **Dynamic Range Tuning:** Adjusting the `controll_word` instantly changes the frequency of `clk_out` on the next clock cycle without creating glitching anomalies, which is a major advantage over traditional analog PLLs.
* **Synchronous Active-Low Reset:** Safe asynchronous release synchronization (`!reset_n`) initializes the core phase accumulator cleanly to ground zero.

---

### ** Applications**
* **Direct Digital Synthesis (DDS):** Serving as the phase index generator for Sine/Cosine Lookup Tables (ROM) to construct high-purity analog sine waves.
* **Clock Dividers:** Replacing non-integer clock division logic networks with programmable fractional dividers.
* **Digital Communication Modulators:** Driving carrier generation modules for Frequency Shift Keying (FSK) and Phase Shift Keying (PSK) systems.

---

### **Verification & Testbench Analysis**
The accompanying testbench (`NCO_tb`) utilizes a 100 MHz reference simulation clock ($T = 10\text{ns}$):
1. **System Startup:** Holds `reset_n` active to initialize the internal state variables cleanly.
2. **Maximum Synthesis Run:** Applies a control word of `32'h8000_0000` ($2^{31}$). 
   * Plugging this into our architectural equation: $f_{out} = \frac{2^{31}}{2^{32}} \times f_{clk} = 0.5 \times f_{clk}$.
   * Therefore, the output toggles state exactly every clock edge, reducing the input frequency cleanly by a factor of 2.
