 **Description**
 
 A Decoder is a combinational logic circuit that converts a $n$-bit binary input into a maximum of $2^n$ unique output lines.
 In this 2-to-4 Decoder, a 2-bit input signal is decoded into 4 separate output lines. 
 Only the output line corresponding to the binary value of the input will be Active-High.
 
 **Hardware Architecture**
 
 The design uses Behavioral Modeling with a case statement to map binary combinations to a "One-Hot" output format.
 
 * Logic Mapping:Input 2'b00 (Decimal 0) $\rightarrow$ out[0] is High.
   * Input 2'b01 (Decimal 1) $\rightarrow$ out[1] is High.
   * Input 2'b10 (Decimal 2) $\rightarrow$ out[2] is High.
   * Input 2'b11 (Decimal 3) $\rightarrow$ out[3] is High.
   
**Key Verilog Concepts**

* Pre-assignment: By setting out = 4'b0000; at the start of the always block, you simplify your case logic. Instead of writing out = 4'b0010, you only have to specify which single bit becomes 1.
This makes the code cleaner and less prone to errors.

* One-Hot Encoding: The decoder effectively translates a binary number into a one-hot representation, where exactly one bit is "hot" (high) at any given time.
* Combinational Sensitivity: Using always@(*) ensures that the output responds instantly to any change in the 2-bit input bus.


**Applications**

* Memory Addressing: Selecting a specific row or bank in a memory array based on an address.
* Instruction Decoding: In a CPU, decoders determine which operation (ADD, SUB, MOV) to perform based on the opcode.
* Demultiplexing: Decoders form the control logic for directing data in a demultiplexer.

**Simulation Result**

<img width="1233" height="268" alt="decoder_2x4_sim" src="https://github.com/user-attachments/assets/c2ba0682-0960-4d9f-8260-80104397238b" />

