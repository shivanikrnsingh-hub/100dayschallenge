**Description**

Checking if a number is prime in hardware is significantly more complex than in software, as hardware lacks a native "modulo" (%) operator.


This module implements a 4-bit Sequential Prime Number Checker using a Finite State Machine (FSM) and iterative subtraction to calculate remainders.

The design follows a mathematical optimization:

* Numbers less than 2 are not prime.2 is prime.
* Even numbers greater than 2 are not prime.
* For odd numbers, the FSM checks odd divisors starting from 3 up to $\sqrt{num}$.

**Hardware Architecture** 

The FSM consists of five distinct states:
 *  IDLE: Waits for the start signal to begin the computation.
 *  EVEN_CHECK: Handles edge cases (0, 1, 2) and performs an immediate parity check (LSB check) to eliminate even numbers.
 *  EVALUATE: Implements the loop condition ($i \times i > num$). If the condition is met and no divisors were found, the number is confirmed as prime.
 *  MODULO_SUB: Since the module cannot use the % operator, it performs iterative subtraction ($num - i$) until the result is less than $i$. This result is the remainder.
 *  DONE: Asserts the Done flag to signal the completion of the check and provides the prime result.


**Simulation Output**

<img width="1547" height="242" alt="prime_no_check_sim" src="https://github.com/user-attachments/assets/c7857165-451b-4f8d-9d44-61f126b09c6c" />
