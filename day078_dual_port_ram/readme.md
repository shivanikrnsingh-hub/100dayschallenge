**Description**

Today’s project is a True Dual-Port RAM, a versatile memory module that allows two independent ports (Port A and Port B) to perform read or write operations simultaneously. This is a critical component for high-performance systems where multiple hardware units (like a CPU and a DMA controller) need to access the same data store.

A unique feature of this implementation is the Conflict Detection Logic. If both ports attempt to write to the same memory address at the exact same time, the module asserts a busy signal and employs an arbitration rule: Port A takes priority.

**Architecture & Features**

Dual Independent Ports: Each port has its own address, data input, and write-enable lines.

Collision Arbitration: Prevents data corruption by detecting addr_a == addr_b during dual-write cycles.

Synchronous Reset: Resets the output registers (data_a, data_b) and the busy flag to a known state (0) without requiring a resource-heavy clear of the entire memory array.

Read-First Logic: During a write cycle, the memory updates with the new data, while the output port provides the data that was stored prior to the write.

**Simulation Results**

<img width="1673" height="307" alt="dual_port_ram_sim" src="https://github.com/user-attachments/assets/9dec6b30-efaa-4391-a8e7-80e2406d7c95" />
