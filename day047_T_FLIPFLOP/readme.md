**Description**

The T (Toggle) Flip-Flop is a fundamental sequential element used primarily in counters and frequency dividers. Its behavior is simple yet powerful: if the input T is high, the output state inverts (toggles) on the next clock edge. If T is low, the flip-flop maintains its current state.


**Hardware Architecture**

This implementation uses an edge-triggered always block to model synchronous behavior.
* Synchronous Reset: The reset signal is sampled at the rising edge of the clock. When active, it initializes the output Q to 0.

* Toggle Logic: The core functionality is governed by the state of T:T = 1: The output flips ($Q_{next} = \overline{Q}$).T = 0: The output is latched ($Q_{next} = Q$).

* Clock Edge: By using posedge clk, the circuit ensures that state changes occur predictably, avoiding the instability found in level-sensitive latches.


**Key Verilog Concepts**

* Non-Blocking Assignments (<=): Used to correctly model the "sampling" of the current state before updating it, preventing race conditions.

* Conditional Logic: The nested if-else structure clearly defines the priority of the Reset signal over the Toggle signal.

* Toggle Expression (~Q): A concise way to represent the inversion of the current state bit.

**Applications**

Binary Counters: T Flip-Flops are the building blocks of ripple counters and synchronous up/down counters.

Clock Dividers: By tying the T input high, the output Q will have exactly half the frequency of the input clock.

State Control: Used in FSMs where a simple "on/off" flip-flop behavior is required.
