 **Description**
 
 This project implements a 4-Bit Combinational Divider.
 The circuit takes a Dividend and a Divisor as inputs and calculates the Quotient ($Q$) and Remainder ($R$).
 The logic is based on the repeated subtraction algorithm, which is a fundamental way to implement division in digital systems.
 
 **Hardware Architecture**
 
 The divider uses a behavioral modeling style with an always@(*) block.
 It follows a subtractive approach to determine how many times the divisor can "fit" into the dividend.Logic Execution:
 **Initialization:**
 * The Remainder ($r$) is initially set to the value of the Dividend, and the Quotient ($q$) is set to zero.
 * Safety Check: The code includes an else block to handle standard division, ensuring that if a "Divide by Zero" scenario is attempted, the system maintains defined outputs.
 * The Subtraction Loop: The for loop iterates to check if the current remainder is greater than or equal to the divisor.If r >= divisor, the divisor is subtracted from r, and the quotient q is incremented by 1.
 * Final Result: Once the remainder is smaller than the divisor, the loop finishing its iterations leaves the final quotient and the leftover remainder at the output.
 *
 **Key Verilog Concepts**
 * Behavioral Loops: While for loops in Verilog are often used in testbenches, here it is used to describe combinational hardware.
 * The synthesizer unrolls this loop into a series of cascaded subtractors and comparators.
 * Integer Iteration: Using integer i for the loop control is a standard practice for defining the range of operations within a procedural block.
 * Blocking Assignments (=): Crucial for this algorithm, as each step of the subtraction depends on the result of the previous step within the same "execution" of the block.

 
**Simulation Result**

<img width="557" height="210" alt="divide_console" src="https://github.com/user-attachments/assets/aafd6244-8e68-4054-9ae2-77253f2b0fd5" />
