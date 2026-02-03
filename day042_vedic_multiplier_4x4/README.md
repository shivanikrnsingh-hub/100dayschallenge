![WhatsApp Image 2026-01-29 at 22 46 48](https://github.com/user-attachments/assets/7304006f-bebf-4ffc-aadd-8f9ca474f9ed)
📝 **Overview**
This project implements a high-speed 4x4 Vedic Multiplier based on the Urdhva-Tiryagbhyam sutra.
By breaking a 4x4 multiplication into four parallel 2x2 operations, we significantly reduce the propagation delay compared to standard array multipliers.

**Design Hierarchy**
The design follows a structural modeling approach. 
The 4-bit inputs A and B are partitioned into 2-bit chunks:
* **1. m1:** $a_{low} \times b_{low}$
* **2. m2:** $a_{high} \times b_{low}$
* **3. m3:** $a_{low} \times b_{high}$
* **4. m4:** $a_{high} \times b_{high}$

 
* **Addition Stage**
   The partial products are aggregated using three 4-bit Ripple Carry Adders (RCA).
   This staggered addition correctly handles the bit-shifting (positional weight) of the 2x2 blocks to produce the final 8-bit result ($S_7 \dots S_0$).
  

* **Key Advantages**
*Parallelism: Multiplier blocks operate simultaneously, reducing latency.
*Modularity: Uses the 2x2 Vedic module from Day 41 as a primitive.
