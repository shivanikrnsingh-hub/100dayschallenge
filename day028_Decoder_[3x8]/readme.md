**Description**
The 3-to-8 Binary Decoder takes a 3-bit binary input and activates one of eight unique output lines. This module is a core component in computer architecture, specifically used for address decoding and memory mapping where a 3-bit address needs to select one of eight memory locations or peripherals.

**Hardware Architecture**
This design utilizes Behavioral Modeling with a case statement. It follows the "One-Hot" output principle, where the decimal value of the input binary string corresponds to the index of the high output bit.

**Logic Mapping:**

Input 3'b000 (0): out[0] is active.

Input 3'b100 (4): out[4] is active.

Input 3'b111 (7): out[7] is active.

**Design Efficiency:**
By setting out = 8'b00000000; before the case statement, you ensure that as soon as the input changes, all bits are "reset" to zero before the new active bit is selected. This effectively creates a "clean" combinational sweep every time the input sensitivity list is triggered.

**Key Verilog Concepts**

Scalability: You have successfully scaled the 2x4 decoder logic to 3x8. This demonstrates your ability to expand bit-widths while maintaining code structure.

Pre-assignment Technique: This remains the most robust way to handle "Don't Care" or unmapped states in a case block without needing a default line for every bit.

One-Hot Vector: The output is an 8-bit vector where only a single bit is "1" at any time, a format heavily used in State Machine (FSM) encoding.

**Applications**

CPU Instruction Decoding: Identifying one of 8 specific instructions in a 3-bit opcode field.

Memory Bank Selection: In a system with 8 RAM chips, this decoder uses the 3 highest bits of the address bus to "enable" the correct chip.

Seven-Segment Display Multiplexing: Selecting which of 8 digits should be active in a scanned display system.

**Synthesis Result**

<img width="391" height="282" alt="decoder_3x8_syn" src="https://github.com/user-attachments/assets/689c59d1-9f31-40d9-8fa8-d05f952e748b" />

