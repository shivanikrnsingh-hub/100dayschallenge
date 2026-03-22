**Description**

As memory arrays in modern SoCs grow larger and more dense, they become increasingly susceptible to manufacturing defects. Memory Built-In Self-Test (MBIST) is a Design-for-Test (DFT) technique where logic is added to the chip to test the memory internally.

This project implements a complete MBIST environment consisting of a Top-level module, an MBIST Controller, and a Target RAM. The system automates the process of writing test patterns to the memory and reading them back to verify data integrity without requiring external Automated Test Equipment (ATE).

**Hardware Architecture**

1. MBIST Controller (The Engine)The controller is a Finite State Machine (FSM) that takes over the memory interface during test mode. It operates in three states:IDLE: Waits for the start_test signal.WRITE_ADDR: Sequentially writes a test pattern (8'hAA) to every address in the RAM.READ_RAM: Reads back each location and compares it against the expected pattern. If a mismatch is detected, the test_fail flag is latched.

2. MBIST RAM (Target Memory)A $16 \times 8$-bit memory array. It includes a specialized force_error input for verification purposes. When force_error is active, the RAM intentionally corrupts the data output at a specific address, allowing the user to verify that the MBIST controller can actually detect a fault.

3. MBIST TOP (Integration)The top-level module encapsulates the controller and the RAM, providing a clean interface for the system to trigger a self-test and observe the test_done and test_fail status.

**Technical Implementation Details**

Pattern Generation: The controller uses a fixed checkerboard-style pattern (8'hAA or 10101010). This helps detect stuck-at faults and certain coupling faults in the memory cells.

Error Injection: The force_error logic:
assign data_out = (force_error && addr == 4'h10) ? (ram[addr] & 8'hFE) : ram[addr];
Note: In the code, addr == 4'h10 (decimal 16) is outside the range of a 4-bit address (0-15). For the test to pass in simulation, this should typically be within the 0-F range.

Handshaking: The test_done signal ensures the system knows exactly when the diagnostic results are valid.

**Simulation Result**

<img width="1607" height="231" alt="MBIST_test_sim" src="https://github.com/user-attachments/assets/77837426-39ce-408e-aa7a-d8bc3a46d47d" />

<img width="780" height="202" alt="MBIST_console" src="https://github.com/user-attachments/assets/15a73d3c-e65a-4453-a174-8f063ffe0e57" />

