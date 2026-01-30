 **Description**
The Multiplexer (or "Data Selector") is a combinational circuit that selects one of several input signals and forwards the selected input to a single output line. A 2x1 MUX uses a single Selection Line ($S$) to determine which of the two inputs ($A$ or $B$) will appear at the output.

**Hardware Architecture**

The design is implemented using a Boolean logic expression within a procedural block. This ensures that the circuit behaves as a purely combinational data path.
* Logic Equation: $Out = (\overline{Sel} \cdot A) + (Sel \cdot B)$

**How it works:**

When $Sel = 0$: The term $(Sel \cdot B)$ becomes 0, and $(\overline{Sel} \cdot A)$ becomes $A$. Thus, $Out = A$.When $Sel = 1$: The term $(\overline{Sel} \cdot A)$ becomes 0, and $(Sel \cdot B)$ becomes $B$. Thus, $Out = B$.

**Key Verilog Concepts**

Boolean Modeling in Always Blocks: You used bitwise operators (~, &, |) inside an always@(*) block. 

This is a hybrid style that combines the readability of behavioral modeling with the precision of dataflow modeling.The "Select" Principle: This module is the building block for larger MUXes (4x1, 8x1) and is the core component inside FPGAs (which use Look-Up Tables or MUXes to implement logic).

**Resource Efficiency:**
This specific logic is highly optimized for CMOS implementation, typically requiring very few transistors.

**Applications**

* Data Routing: Directing different data sources to a single bus.
* Function Generation: MUXes can be used to implement any Boolean function.
* Control Logic: Used in CPUs to select which register value goes to the ALU.

**Synthesis Result**

<img width="1262" height="632" alt="mux2x1_syn" src="https://github.com/user-attachments/assets/440c754e-2505-4e5d-857c-aee531664714" />

