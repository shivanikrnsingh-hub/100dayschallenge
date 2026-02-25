**Description**

Today's project focuses on a Synchronous ROM module. While RAM is used for temporary data that changes, a ROM is used to store "fixed" data such as look-up tables (LUTs), coefficients for digital filters, or bootloader instructions.

Even though  named it ROM_15x15, your address bus is 4-bit ([3:0]), which actually gives you 16 memory locations (0 to 15). The data bus is 16-bit ([15:0]). Thus, this is technically a 16x16 ROM.

**Hardware Architecture**
* Memory Array: The memory register array serves as the storage. In a true ROM, this would be initialized once and never written to by the hardware during execution.

* Synchronous Read: The data is only fetched on the rising edge of the clock. This is essential for high-speed designs as it allows the synthesis tool to utilize dedicated Block RAM (BRAM) resources.

* Tri-state Output: When rd_en is low, the output enters a high-impedance state (16'hz).

**Simulation Result**

<img width="1470" height="223" alt="ROM_Simulation" src="https://github.com/user-attachments/assets/a430ed40-928d-4944-89e0-46facfd10cdd" />
