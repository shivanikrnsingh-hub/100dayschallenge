## **Day 096: Synchronous Digital Time Keeper (Cascaded Counters)**

### **Description**
This project implements a fully synchronous **Digital Time Keeper (Clock/Timer)** consisting of dual cascaded modulo counters. The architecture continuously updates real-time tracking across seconds (`sec_count`) and minutes (`min_count`) registers. 

By employing a precise look-ahead status flag (`minute_tick`), the design coordinates the roll-over conditions between distinct time units on a single clock domain. Both counters operate in the range of $0$ to $59$, utilizing a 6-bit register width to natively map the system variables without clipping.

---

### **Hardware Architecture**
The design avoids asynchronous or divided clock sub-domains by using a single main system clock (`clk`) paired with synchronous clock enables:

* **Look-Ahead Tick Generation:** The `minute_tick` signal acts as an internal conditional flag. It continuously evaluates if `sec_count` has hit its maximum threshold of decimal 59 (`6'd59`).
* **Seconds Counter Loop:** Increments synchronously on every positive edge of the system clock. Once the look-ahead enable `minute_tick` evaluates to high, the register wraps back to `0` on the subsequent active clock transition.
* **Cascaded Minutes Counter Loop:** Operates as a gated sequential process. It evaluates inputs *only* during the active high phase of `minute_tick`. When this condition matches, it increments `min_count` or wraps it back to `0` if the minutes register has reached `6'd59`.

---

### **State & Cascade Modulo Flow Table**

| Cycle Condition | `sec_count` | `min_count` | `minute_tick` Status | Next State (`sec_count`, `min_count`) |
| :--- | :---: | :---: | :---: | :---: |
| **Standard Counting** | `6'd45` | `6'd12` | `0` | `6'd46`, `6'd12` |
| **Look-Ahead Minute Threshold** | `6'd58` | `6'd12` | `0` | `6'd59`, `6'd12` |
| **Minute Boundary Rollover** | **`6'd59`** | `6'd12` | **`1`** | **`6'd00`**, **`6'd13`** |
| **Hour Boundary Rollover** | **`6'd59`** | **`6'd59`** | **`1`** | **`6'd00`**, **`6'd00`** |

---

### **Technical Implementation Details**
* **Strict Synchronous Cascading:** Unlike a "Ripple Counter" where the output of the first register acts as a raw clock for the next (introducing structural clock skew and glitching vulnerability), this design ties all registers to the same `clk`. Signals propagate predictably within a single static timing analysis window.
* **Bit Width Optimization:** Values $0$ to $59$ require a minimum of 6 bits ($2^6 = 64$). Allocating `reg [5:0]` provides a tight area footprint without leaving excess unutilized binary combinations that could compromise synthesis routing.
* **Active-Low Asynchronous Reset:** Controlled via the `rst_n` pin, ensuring that upon a system clear event, all tracking registers are forced immediately back to absolute zero time.

---

### **Applications**
* **Real-Time Clocks (RTC):** Base infrastructure nodes for tracking elapsed system durations inside wearable gadgets and embedded devices.
* **Hardware Execution Timers:** Implementing Watchdog timer structures and standard diagnostic system delays inside System-on-Chip (SoC) microcontrollers.
* **Automated Scheduler Nodes:** Providing time-stamp generation arrays for sensory network nodes and flight telemetry recorders.

---

### **Verification & Testbench Summary**
The high-speed test fixture (`Time_Keeper_tb`) verifies the cascading overflow logic using an optimized execution pattern:
1. **Reset Release Verification:** Holds the system clear lines low for `50ns` to ensure zero state stabilization, then drives `rst_n` high to commence timing runs.
2. **Rollover Transition Analysis:** Executes the reference clock simulation for a total duration of `2000ns`. Since each incremental cycle consumes $10\text{ns}$, this setup runs through $200$ clock cycles—allowing the engineer to track multiple minute-boundary overflows and confirm zero-skew register alignment.
