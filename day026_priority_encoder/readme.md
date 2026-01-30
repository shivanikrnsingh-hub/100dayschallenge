**Description**
A Priority Encoder is a specialized encoder that handles cases where multiple input lines might be active at the same time. Unlike a simple encoder, it assigns a priority to each input. In this design, the higher-order bits have higher priority; for example, if both Bit 7 and Bit 2 are '1', the encoder will ignore Bit 2 and output the binary code for Bit 7 (3'b111).

**Hardware Architecture**
The design utilizes the casex statement, which allows for "Don't Care" conditions during bit matching.

* Priority Logic:
The "Don't Care" bits (x) in the casex block ensure that once a high-priority bit is detected, the state of the lower-priority bits is ignored:

*8'b1xxxxxxx: If the MSB is 1, the output is 111 regardless of the other 7 bits.

*8'b01xxxxxx: If Bit 6 is 1 and Bit 7 is 0, the output is 110.

This continues down to the LSB, which has the lowest priority.

Why casex?
Simplicity: It allows you to write the priority logic concisely without nested if-else blocks.

Synthesis: Synthesizers interpret casex as a priority circuit, mapping it efficiently to a series of look-up tables (LUTs) or multiplexer chains.

**Key Verilog Concepts**
* casex Statement: Special version of the case statement where x and z values in the case items are treated as "don't cares."

* Priority Arbitration: This is a fundamental concept in computing used to decide which device gets access to a resource (like a System Bus) when multiple devices request it simultaneously.

* Input Validation: The default case ensures that if all inputs are 0, the output remains in a safe, defined state.

**Applications**
* Interrupt Controllers: When multiple peripherals (keyboard, mouse, disk) send an interrupt at once, the CPU uses a priority encoder to handle the most critical one first.

* Fixed-Point Arithmetic: Used in finding the "Leading One" for normalization in floating-point units.

* Network Routers: Prioritizing high-bandwidth data packets over background tasks.

**Console Result**

<img width="637" height="185" alt="priority_encoder_console" src="https://github.com/user-attachments/assets/b0e6e0e3-75f1-489b-89cb-15a874e96447" />
