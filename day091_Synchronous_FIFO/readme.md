Day 91 Synchronous FIFO Design & Verification

**Description**

This repository contains a parameterizable **Synchronous FIFO (First-In, First-Out)** memory buffer and its corresponding testbench, implemented in Verilog HDL. This design is part of a structural hardware development series, focusing on modularity, clear flag generation, and edge-case validation.

## Architecture Overview

A Synchronous FIFO uses a single clock domain for both read and write operations. It consists of a dual-port internal register array, pointer tracking logic, and continuous status flag generation. 

### Key Design Features
* **Single Clock Domain:** Reading and writing are tightly synchronized to the rising edge of `clk`.
* **Parameterizable Geometry:** Easily adjust `data_width` and `fifo_depth` via top-level parameters.
* **Chip Select (`cs`):** An extra layer of control logic enabling or disabling the entire block.
* **Look-Ahead MSB Pointers:** Pointers are configured with an extra tracking bit (`bits:0`) acting as a lap counter to safely differentiate between completely empty and completely full states.


## Signal Description

| Signal Name | Direction | Width | Description |
| :--- | :---: | :---: | :--- |
| `clk` | Input | 1 bit | Master System Clock |
| `reset` | Input | 1 bit | Asynchronous Active-Low Reset |
| `cs` | Input | 1 bit | Chip Select (Active High enable for read/write) |
| `wr_en` | Input | 1 bit | Write Enable |
| `rd_en` | Input | 1 bit | Read Enable |
| `data_in` | Input | `data_width` | Input Data Bus |
| `data_out` | Output | `data_width` | Output Data Bus (Registered) |
| `empty` | Output | 1 bit | FIFO Empty Flag (Active High) |
| `full` | Output | 1 bit | FIFO Full Flag (Active High) |

## Block Diagram & Pointer Logic

The design avoids complex counter logic by using the binary MSB mechanism for flag comparisons:
* **Empty Flag:** Asserted continuously when the `write_pointer` and `read_pointer` match exactly across all bits, indicating they are in the same lap at the same address.
 

* **Full Flag:** Asserted when the pointers point to the same physical index, but the write pointer has wrapped around exactly one lap ahead of the read pointer (MSB is inverted).
 
## Verification & Testbench Scenarios

The accompanying testbench (`synchronous_fifo_tb.v`) utilizes systematic tasks (`write_data` and `read_data`) to rigorously evaluate the module across two critical functional test suites:

### 1. Interleaved Read/Write (In-Range Test)
* Iteratively writes a deterministic data pattern ($3 \times i$) and immediately reads it back in the subsequent cycle.
* Verifies zero-latency back-to-back operations and pointer alignment stability under alternating throughput.

### 2. Boundary Condition Test (Full & Empty Assertions)
* **Overflow Protection:** Drives writes beyond the maximum capacity (`fifo_depth + 1`) to force a `full` flag condition, proving that internal memory overwrites are blocked.
* **Underflow Protection:** Sequentially drains the FIFO back to zero until the `empty` condition is successfully tripped, showing that invalid read-pointer increments are inhibited.

