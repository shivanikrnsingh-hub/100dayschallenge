**Description**

The Carry Select Adder is a high-speed logic unit that significantly reduces carry propagation delay.
The core philosophy of this design is speculative execution: instead of waiting for the carry bit to ripple through from the previous stage, 
the circuit pre-calculates the results for both possible carry scenarios (Carry = 0 and Carry = 1) simultaneously.

**Hardware Architecture**

The design consists of two parallel chains of Full Adders and a final stage of Multiplexers.
* Design Components:Path 0 (fa1–fa4): A 4-bit Ripple Carry Adder that assumes the incoming carry ($C_{in}$) is 0.
* Path 1 (fa5–fa8): A 4-bit Ripple Carry Adder that assumes the incoming carry ($C_{in}$) is 1.
* Selection Logic (Muxes): Five 2x1 Multiplexers that use the actual $C_{in}$ to select the correct pre-calculated Sum and Carry-out.

**How it works:**

Both Path 0 and Path 1 start calculating as soon as inputs A and B are available.
When the actual $C_{in}$ finally arrives, it doesn't have to ripple through 4 stages of logic. 
It simply acts as a "select" signal for the multiplexers.
The final result is produced almost instantly after $C_{in}$ is stable, making it much faster than a standard Ripple Carry Adder.

**Key Verilog Concepts**

* Structural Modeling: This design heavily relies on module instantiation (full_adder and mux_2x1), demonstrating a clean, hierarchical hardware architecture.
* Parallelism: This is a classic example of spatial redundancy (using more hardware/area) to achieve higher temporal performance (speed).
* Speculative Logic: Pre-calculating results before the final input is known is a key concept in advanced computer architecture.

**Performance Trade-off**

While the Carry Select Adder is significantly faster than the Ripple Carry Adder (Day 007) and the Carry Skip Adder (Day 009),
it requires nearly double the area (twice as many gates) to implement the dual paths.

**Console Result**

<img width="577" height="212" alt="carry_select_console" src="https://github.com/user-attachments/assets/4cce5359-d4ce-43aa-81aa-dde90eaf43d1" />
