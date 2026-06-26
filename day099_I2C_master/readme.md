## **Day 099: I2C Master Receiver Controller**

### **Description**
This project implements a synchronous **I2C (Inter-Integrated Circuit) Master Receiver Controller** designed to orchestrate read transactions from targeted slave peripherals. I2C is a widely used multi-master, multi-slave, synchronous, bidirectional, two-wire serial communication bus interface. 

The architecture contains a full finite state machine (FSM) that controls the two shared lines: **SCL (Serial Clock)** and **SDA (Serial Data)**. It successfully automates the multi-stage I2C sequence, handling the generation of the start condition, serial transmission of the 7-bit slave address, handling of the external acknowledgment, deserialization of an incoming 8-bit data packet, generation of the mandatory master negative-acknowledgment (NACK), and execution of the final stop condition cleanly.

---

### **Hardware Architecture**
The architecture controls data flow across three core logical mechanisms:

* **Open-Drain Bidirectional Buffer Logic:** The physical I2C bus utilizes open-drain line hardware structures. This controller manages the shared `sda` wire through an output enable driver assignment:
  ```verilog
  assign sda = sda_oe ? sda_out : 1'bz;


When reading data or listening for an external ACK, the Master de-asserts `sda_oe` (`1'b0`), allowing high-impedance floating (`1'bz`) states so that the external slave can safely pull the pulled-up line low.

## **FSM Architecture & Operation**

The core logic uses a **Master Finite State Machine (7 States)** that processes structural phases across an explicitly sequenced case array: `IDLE`, `START`, `ADDR`, `ACK1`, `READ`, `NACK`, and `STOP`. 

A **Bit Counting Shift Matrix (`bit_cnt`)** acts as a down-counting index register initialized to 7. This maps incoming serial data bits smoothly into their targeted locations within the parallel byte register (`data_out`).

### **I2C Master Operational Phase Mapping**

| FSM State Code | Line Manipulation Action | SCL State | SDA State | Next State Loop | Architectural Behavior |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **IDLE** | Resting state | `1'b1` | `1'b1` | `START` (if start=1) | Passive bus holding mode; clears the system busy flag. |
| **START** | Initiate Bus Capture | `1'b1` | `1'b1` $\rightarrow$ `1'b0` | `ADDR` | Toggles SDA low while SCL remains high to signal a Start Condition. |
| **ADDR** | Frame Streaming | Pulsing | Bit Stream | `ACK1` (when index is 0) | Serializes the 7-bit address register out onto the bus wire. |
| **ACK1** | Acknowledgment Check | Pulsing | Floating `1'bz` | `READ` | Relinquishes control of SDA to let the matching Slave pull the line low. |
| **READ** | Byte Capture | Pulsing | Driven by Slave | `NACK` (when index is 0) | Samples the SDA line on SCL rising edges to populate `data_out`. |
| **NACK** | End-of-Read Flag | Pulsing | `1'b1` | `STOP` | Master sends a high NACK bit to notify the Slave that reading is finished. |
| **STOP** | Release Bus | `1'b1` | `1'b0` $\rightarrow$ `1'b1` | `IDLE` | Pulls SDA high while SCL is locked high to execute the Stop Condition. |

---

## **Technical Implementation Details**

* **In-System Simulation Note:** Within the current RTL code, the internal transitions for `scl` and `sda_out` inside states like `ADDR`, `ACK1`, and `READ` are coded sequentially inside a single clock-edge loop. For downstream physical FPGA deployment and synthesis on silicon, splitting your clock framework to use a distinct 4x oversampled clock or a dedicated enable strobe will ensure robust setup and hold margins.
* **Tri-State Conflict Isolation:** Pull-up emulation is handled via the testbench structural line code (`pullup(sda);`). This ensures that whenever the master and slave drivers both drop into high-impedance mode (`1'bz`), the wire naturally returns to a stable, noise-immune high state (`1'b1`).
* **Hardware Underflow Protection:** The tracking vector loops use a decrement configuration interlocked with a rigorous zero-boundary block check (`if(bit_cnt==0)`), which eliminates index wrap-around bugs.

---

## **Applications**

* **EEPROM Configuration Reading:** Extracting non-volatile boot configuration values and calibration tables from external memory chips.
* **Low-Speed Sensor Readout:** Sampling environmental telemetry parameters from devices like digital barometers, ambient light monitors, and multi-axis IMUs.
* **System Health Monitoring:** Reading out data from power rail monitors, fan controllers, and motherboard thermal tracking ICs.

---

## **Verification & Testbench Summary**

The testbench environment (`I2C_master_r_tb`) emulates a complete closed-loop responder system with the following characteristics:

* **Dynamic Slave Simulation Engine:** Monitors the Master's state variables via hierarchical path mapping (`uut.state == uut.READ`). When the state hits the read window, it activates `drive_slave <= 1` to route the data array (`Slave_data = 8'h3C`) directly onto the bi-directional bus line.
* **Signal Stabilization Window:** Drives an active-low reset pulse configuration lasting 20ns before launching a single-cycle high start strobe targeting destination address `7'h42`.
* **Waveform Logging Support:** Integrates structural system variables (`$dumpfile`, `$dumpvars`) to write the complete behavioral tracking database into a Value Change Dump (`i2c_master_r.vcd`) record file for timing inspection.

