**Description**

The Johnson Counter, also known as a Twisted Ring Counter or Möbius Counter, is a variation of the standard Ring Counter. By feeding the complement (inverse) of the last flip-flop's output back into the first flip-flop, the number of unique states is doubled.For an $N$-bit register, a Johnson Counter provides $2N$ states (compared to only $N$ states in a standard Ring Counter). This makes it more area-efficient while maintaining the advantage of having a very simple feedback path.

**Hardware Architecture**

The design utilizes a Circular Shift with Inversion:Initialization: On reset, the counter is set to 0 (e.g., 0000).The "Twist" Feedback: On every clock edge, the inverse of the Least Significant Bit (~counter[0]) is shifted into the Most Significant Bit (MSB) position.

Logic: counter <= {~counter[0], counter[N-1:1]}

State Characteristics: The counter cycles through a pattern where it fills up with 1s and then fills up with 0s.

**Key Verilog Concepts**

Inverted Concatenation: The use of ~counter[0] in the concatenation {...} is what distinguishes this from a standard Ring Counter.

State Efficiency: A 4-bit Johnson counter provides 8 states. It uses more states than a Ring Counter but fewer than a Binary Counter ($2^N$).

Glitch-Free Transitions: One of the most important properties of a Johnson counter is that only one bit changes at a time (similar to Gray Code). This prevents logic glitches that can occur when decoding binary counts.

**Simulation Result**

<img width="1597" height="286" alt="johnson_counter_sim" src="https://github.com/user-attachments/assets/df12c37c-9860-493a-aa09-0e17abcdcf52" />

<img width="871" height="507" alt="johnson_counter_console" src="https://github.com/user-attachments/assets/9be7c707-666b-47d5-af98-1e3446f7b941" />

