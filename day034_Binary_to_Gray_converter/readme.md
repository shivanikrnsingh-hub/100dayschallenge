**Description**

This project implements a Binary to Gray Code Converter. Unlike standard binary, where multiple bits can change simultaneously (e.g., 0111 to 1000 involves 4 bit-flips), Gray Code ensures that only a single bit changes between consecutive values. This property is crucial for preventing "glitches" in high-speed digital systems and mechanical encoders.

**Hardware Architecture**

The design follows the standard algorithmic approach for binary-to-gray conversion using gate-level primitives:

The Most Significant Bit (MSB): The MSB of the Gray code is always identical to the MSB of the Binary code. You've implemented this using a buf (buffer).

Subsequent Bits: Each following Gray bit is the result of an XOR operation between the current binary bit and the binary bit to its left.
​

**Key Verilog Concepts**

Gate-Level Primitives: Using buf and xor directly tells the tool exactly how to map the logic. It’s the most "low-level" way to write Verilog, giving you maximum control over the hardware structure.

Error Prevention: In asynchronous systems, if you used binary to count, a transition from 011→100 might be read as 111 momentarily due to gate delays. Gray code (010→110) prevents this because only one bit is ever "in transition."

**Applications**

Asynchronous FIFOs: Used to pass pointers between different clock domains safely.

Rotary Encoders: Used in volume knobs or industrial motors to track position without reading errors.

Error Correction: Minimizing the probability of errors in digital communications.

**Console Result**

<img width="630" height="253" alt="binary_to_gray_console" src="https://github.com/user-attachments/assets/1c5fe349-18c6-4fae-b01d-aebad73988c6" />

