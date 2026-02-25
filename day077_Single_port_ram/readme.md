**Description**

The Single-Port RAM is a foundational memory component in digital system design. Unlike Dual-Port RAM, this module uses a single shared address bus for both Read and Write operations. This specific implementation follows a Read-First (or Read-Before-Write) logic flow, which is the most common hardware primitive in FPGA Block RAM (BRAM) resources.

**Architecture**

This design is optimized for synthesis and follows standard RTL coding guidelines:

Synchronous Operation: All write and address latching operations occur on the rising edge of the clk.

Address Latching: The address is stored in address_reg during read cycles to ensure the output remains stable until the next clock edge.

Parameterizable Design: The module uses parameters for data_width, depth, and address_width, allowing it to be easily scaled for different applications without modifying the core logic.



<img width="541" height="107" alt="image" src="https://github.com/user-attachments/assets/bd5c880f-9fd4-47aa-97bc-c5edc9b2ff0f" />



**Operational Logic**

The module operates based on the state of the wr_en (Write Enable) signal:

Write Mode (wr_en = 1): The data on the data bus is written into the memory array at the specified address.

Read Mode (wr_en = 0): The current address is latched into address_reg, and the data from that memory location is driven to data_out via an asynchronous fetch from the array.


**Simulation Result**

<img width="1202" height="298" alt="Single_port_ram_sim" src="https://github.com/user-attachments/assets/211e1c22-5050-459a-9b64-a2ff831bb4ae" />
