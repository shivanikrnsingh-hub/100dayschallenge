**Description**

This module demonstrates how to implement a D (Data) Flip-Flop behavior using SR, JK, and T Flip-Flops.
The goal of a D-FF is simple: "follow the input." However, achieving this with other flip-flop types requires specific Excitation Logic to ensure the next state ($Q_{next}$) always matches the current input ($D$), regardless of the previous state.

**Hardware Architecture**

The design uses structural modeling to convert different storage elements into a transparent D-type register.

1. D behavior using SR Flip-FlopAn SR flip-flop requires complementary inputs to function like a D-FF. When $D=1$, we must Set ($S=1, R=0$); when $D=0$, we must Reset ($S=0, R=1$).

* Logic: $S = D, R = \overline{D}$
* Implementation: SR_flipflop SR(.S(D), .R(~D), ...)

3. D behavior using JK Flip-FlopSimilar to the SR conversion, the JK flip-flop acts as a D-FF when $J$ and $K$ are fed with complementary data. This avoids the "Hold" and "Toggle" states, forcing the FF to follow $D$.

* Logic: $J = D, K = \overline{D}$
* Implementation: JK_flipflop JK(.J(D), .K(~D), ...)

5. D behavior using T Flip-FlopThis is the most interesting conversion. A T-FF only toggles when $T=1$. To make it behave like a D-FF, it must only toggle if the current state is different from the desired input $D$.

* Logic: $T = D \oplus Q$ (XOR logic)
* Implementation:assign w = D ^ Q_T; T_flipflop T(.T(w), ...)

**Key Verilog Concepts**

* Complementary Logic: Using the bitwise NOT (~) operator to create the $R$ and $K$ signals from $D$.XOR for State Comparison: The XOR gate (^) effectively acts as a "difference detector." If $D$ is different from $Q$, $T$ becomes $1$, causing the T-FF to toggle to the correct state.

* Structural Reusability: Leveraging existing modules to build more complex logical behaviors.

**Simulation results**

<img width="1458" height="328" alt="D_ff_using_D_T_JK_sim" src="https://github.com/user-attachments/assets/875fe7ba-3028-4c88-8123-afe42d5a5b63" />
