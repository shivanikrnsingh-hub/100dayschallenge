## **Day 094: Finite State Machine (FSM) Vending Machine Controller**

### ** Description**
This project implements a classic synchronous **Mealy/Moore Hybrid Finite State Machine (FSM)** simulating a vending machine controller. The machine is designed to dispense an item priced at **15 cents** ($\text{15¢}$) while accepting two types of coin inputs: **Nickels** ($\text{5¢}$) and **Dimes** ($\text{10¢}$). 

The design efficiently monitors accumulated value across 3 persistent hardware states (`0¢`, `5¢`, and `10¢`). If an excess amount is deposited (e.g., two dimes total $\text{20¢}$), the system dynamically calculates the difference, asserting both the dispensing mechanism and a secondary change-return circuit simultaneously.

---

### ** Hardware Architecture**
The architecture is partitioned into three decoupled procedural blocks:

* **State Register (Sequential Block):** A clocked process managing the state updates under active-low asynchronous reset conditions (`rst_n`).
* **Next State Decoder (Combinational Block):** An `always@(*)` block determining state routing based on input coin tokens (`nickel`, `dime`).
* **Output Decoder (Combinational Block):** Evaluates the active state alongside asynchronous input pulses to toggle the `dispense` and `change` outputs instantly.

---

### ** FSM State & Flow Table**
The machine maps currency milestones directly to specific system states:

| Current State | Deposited Value | Input Coin Condition | Next State | Outputs (`dispense`, `change`) |
| :---: | :---: | :--- | :---: | :---: |
| **`s_0`** | $\text{0¢}$ | `nickel` <br> `dime` | **`s_5`** <br> **`s_10`** | `0, 0` <br> `0, 0` |
| **`s_5`** | $\text{5¢}$ | `nickel` <br> `dime` | **`s_10`** <br> **`s_0`** | `0, 0` <br> `1, 0` (Exactly $\text{15¢}$) |
| **`s_10`** | $\text{10¢}$ | `nickel` <br> `dime` | **`s_0`** <br> **`s_0`** | `1, 0` (Exactly $\text{15¢}$)<br> `1, 1` (Overpaid $\text{20¢}$) |

---

### ** Technical Implementation Details**
* **Mealy Output Characteristics:** The outputs (`dispense` and `change`) rely directly on both the `current_state` and the external inputs inside the combinational logic. This minimizes cycle latency, asserting the release pulse within the same clock cycle the matching coin is registered.
* **State Space Efficiency:** Using a 2-bit state width (`reg [1:0]`) comfortably captures the three states, leaving one unassigned binary permutation code (`2'b11`) safe-shielded via a solid `default` fallback statement.
* **Priority Latching Avoidance:** The next-state block enforces a `next_state = current_state;` default initialization assignment statement, preventing the synthesis of accidental hardware latches.

---

### ** Applications**
* **Automated Retail Handlers:** Point-of-Sale coin and token receptors.
* **Ticketing Terminals:** Parking gate validators, transit fare check gates, and token dispensers.
* **Gaming Hardware:** Arcade system token acceptors and prize redemption logic.

---

### ** Verification & Testbench Summary**
The testbench fixture (`vending_machine_tb`) validates functional operational limits via target sequence paths:
1. **Exact Change Path ($\text{5¢} + \text{10¢}$):** Asserts `nickel`, shifts to `s_5`, then introduces `dime`. Verifies that `dispense` asserts cleanly without returning change.
2. **Overpayment Change Path ($\text{5¢} + \text{5¢} + \text{10¢}$):** Progresses through `s_0` $\rightarrow$ `s_5` $\rightarrow$ `s_10`. While at `s_10`, introducing a `dime` drops the state back to `s_0` while asserting both `dispense = 1` and `change = 1` to compensate for the $\text{5¢}$ excess.
