## **Day 095: FSM Intelligent Car Parking Management System**

### **Description**
This project implements an intelligent, secure **Car Parking Management System** controlled by a Finite State Machine (FSM). Designed for a facility with a configurable maximum capacity (`parameter max_count = 15`), the system monitors entry sensors, exit sensors, and a security password terminal before operating access control gates.

The tracking mechanics are handled via a hybrid state framework. It calculates occupancy metrics, updates structural visual indicators (`green_led` for access granted, `red_led` for access denied/facility full), and actively broadcasts the exact number of remaining slots (`vacant_spaces`) over a 4-bit bus interface.

---

### **Hardware Architecture**
The architecture maps its logic across distinct functional domains:

* **FSM Controller (3 States):** * `idle`: Default resting state. Monitors `car_entering` while validating that total occupancy is below the structural parameter limit.
  * `wait_pass`: Holds the vehicle at the gate and samples the `passward` bus input.
  * `open_gate`: Asserts entry access authorization (`green_led`), advances internal vehicle counters, and cleanly cycles back to check the queue.
* **Tracking Register Array (`car_count`):** A synchronous counter block that tracks real-time occupancy by checking valid password approvals against exit pulses (`car_exiting`).
* **Combinational Space Evaluator:** Dynamically subtracts the active allocation count from the static limit boundary (`max_count - car_count`) to track vacancy variations without adding clock-latency delays.

---

### **FSM State Transition & Output Mapping**

| Current State | Input Conditions | Next State | Green LED | Red LED | System Operational Status |
| :---: | :--- | :---: | :---: | :---: | :--- |
| **`idle`** | `car_entering && (car_count < 15)` <br> `Otherwise` | **`wait_pass`** <br> **`idle`** | `0` <br> `0` | `0` <br> `car_count == max_count` | Resting cycle. Activates the Full boundary warning flag if the facility matches maximum density limits. |
| **`wait_pass`** | `passward == 2'b10` <br> `Otherwise (Wrong Pass)` | **`open_gate`** <br> **`idle`** | `0` <br> `0` | `1` <br> `1` | Security check active. Holds access barrier down until authentication token maps to matching code. |
| **`open_gate`** | Unconditional Roll | **`idle`** | `1` | `0` | Access granted. Pulse trips open barrier system, increments internal count register, and re-arms. |

---

### **Technical Implementation Details**
* **Double-Hedged Safe Guarding:** The increment control includes boundary verification loops (`car_count < max_count`). This structure blocks count overrun anomalies even if unauthorized input tokens bypass security hardware nodes.
* **Underflow Counter Shielding:** The decrement branch is interlocked with a safety clamp (`car_count > 0`), ensuring spurious sensor triggers on empty lanes will not wrap the register backwards to maximum value.
* **Clean State Transitions:** The next-state assignment utilizes pre-configured fallback lines (`next_state = current_state;`), eliminating risks of unwanted combinational latch inferencing during hardware synthesis.

---

### **Applications**
* **Automated Parking Facilities:** Commercial parking garage structures and multi-level automated lot systems.
* **Secure Access Points:** Gated residential communities, corporate campus turnstiles, and private facility perimeter controls.
* **Industrial Asset Tracking:** Warehousing intake lanes and fleet distribution facility yards.

---

### **Verification & Testbench Summary**
The testbench (`car_parking_tb`) confirms functional operational limits across a complete behavioral lifestyle test routine:
1. **Case 1 (Authenticated Path):** Generates a `car_entering` strobe, feeds the `2'b10` golden key code inside the `wait_pass` state window, and verifies `green_led` asserts while `vacant_spaces` counts down cleanly.
2. **Case 2 (Intrusion Rejection):** Simulates a vehicle arrival using an invalid code input (`2'b01`). Checks that the controller safely dumps back to `idle`, leaving the gate locked down (`red_led = 1`).
3. **Case 3 (Saturation Bounds):** Loops 14 successive entry passes to saturate the memory counter registers. Confirms that once `vacant_spaces` zeroes out, the `red_led` latches on as a full indicator, blocking downstream gate operations.
4. **Case 4 (Departure Recovery):** Fires a standalone `car_exiting` signal, verifying the internal space evaluation nodes immediately increment the available vacancy slots back to the system pool.
