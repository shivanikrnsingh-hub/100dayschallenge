## **Day 091: Synchronous LIFO (Stack) Buffer**

### **Description**
A **LIFO (Last-In-First-Out)** buffer, commonly referred to as a **Stack**, is a sequential data structure where the most recently written data is the first to be retrieved. This project implements a fully synchronous $16 \times 8$-bit LIFO storage module. 

Unlike a FIFO (First-In-First-Out) buffer that utilizes separate independent read and write pointers to follow data queues, a LIFO design utilizes a single **Stack Pointer (`sp`)** that moves up and down a single memory axis. It increments during a `push` command and decrements during a `pop` command.

---

### **Hardware Architecture**
The module integrates a dedicated internal storage matrix with tracking control logic:

* **Memory Array:** A $16 \times 8$-bit register matrix (`stack`) acting as the physical storage registers.
* **Stack Pointer (`sp`):** A 5-bit register tracking the top boundary position of the data block.
  * **Push Logic:** When `push` is high and the buffer is not `full`, data enters at `stack[sp]` and `sp` increments.
  * **Pop Logic:** When `pop` is high and the buffer is not `empty`, `sp` decrements and data is retrieved from `stack[sp-1]`.
* **Status Flags:** * `full`: Asserted when `sp` matches `5'h10` (decimal 16), indicating maximum storage capacity.
  * `empty`: Asserted when `sp` returns to `0`, signaling no elements remain.

---

### **Pointer Mapping & Boundary Conditions**

| Stack Pointer (`sp`) | Target Memory Location | Flag Status | Valid Operations |
| :---: | :--- | :---: | :--- |
| **`5'h00`** | Base Index (Empty) | `empty = 1`, `full = 0` | `push` only |
| **`5'h01` to `5'h0F`** | Active Stack Registers | `empty = 0`, `full = 0` | Both `push` and `pop` |
| **`5'h10`** | Maximum Limit (Boundary) | `empty = 0`, `full = 1` | `pop` only |

---

### **Technical Implementation Details**
* **Look-Back Read Mechanics:** Because the Stack Pointer increments *after* a valid write sequence, it naturally points to the next available *empty* slot. To pop the correct element out without losing a clock cycle, the design reads from the relative offset `stack[sp-1]`.
* **Overflow & Underflow Protection:** Hardwired gating loops (`push && !full` and `pop && !empty`) prevent out-of-bounds pointer states. Invalid external strobe commands are ignored, preserving data integrity.
* **Synchronous Control:** Regulated by an active-low asynchronous reset (`reset_n`), initializing the tracking pointer and the output lines cleanly on a system clear.

---

### **Applications**
* **Processor Architecture:** Storing return addresses for nested function subroutines, interrupt vectors, and local compiler variables.
* **Arithmetic Evaluation:** Hardware implementation of reverse-polish notation (RPN) calculators and expression parsers.
* **Backtracking Units:** Graph search accelerators (Depth-First Search) and physical undo/redo operation buffers.

---

### **Verification & Testbench Summary**
The self-checking testbench (`synchronous_lifo_tb`) validates the design through three target scenarios:
1. **Interleaved Push-Pop Cycles:** Simulates rapid turnarounds to ensure read-to-write switching delay matches expected timing parameters.
2. **Saturation Handling (Full Check):** Drives 16 sequential push cycles to confirm the `full` flag activates precisely at the limit boundary and blocks the 17th write.
3. **Depletion Handling (Empty Check):** Executes 16 sequential pop cycles to verify the structure drains gracefully, asserts the `empty` flag, and halts data readout safely.
