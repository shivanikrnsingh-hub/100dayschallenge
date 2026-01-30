 **Description**
 
 An Encoder is a combinational circuit that performs the inverse operation of a Decoder.
 It compresses $2^n$ input lines into an $n$-bit output code.
 In this 8-to-3 Encoder, when one of the 8 input lines is activated (set to '1'), the circuit produces a 3-bit binary number representing the index of that active line.
 
 **Hardware Architecture**
 
 The module is implemented using Behavioral Modeling with a case statement. 
 This approach is highly intuitive for mapping specific input patterns to defined outputs.
 * Logic Mapping:The encoder expects One-Hot encoded inputs (where only one bit is high at a time):
 * Input 8'b00000001 (Bit 0) $\rightarrow$ Output 3'b000
 * Input 8'b00000100 (Bit 2) $\rightarrow$ Output 3'b010
 * Input 8'b10000000 (Bit 7) $\rightarrow$ Output 3'b111
 * The Default Case:The default: out = 3'b000; statement is crucial.
   It handles cases where no bits are set or where multiple bits are set, preventing the synthesis of unwanted latches and ensuring the output is always in a known state.
 
 **Key Verilog Concepts**
 
 *Case Statements: 
 
 The case block is ideal for complex combinational logic where you need to match specific bit patterns.
 Binary Encoding: This project demonstrates how hardware translates physical "line signals" into digital data that a CPU or microcontroller can process.
 One-Hot Constraint: Standard encoders assume only one input is active. 
 If multiple inputs were high, this specific code would trigger the default case. 
 
 **Applications**
 
 * Keyboard Encoders: Converting a key press (one of many) into a binary code for a processor.
 * Interrupt Controllers: Identifying which peripheral device is requesting attention.
 * Data Compression: Reducing the number of wires needed to transmit status information across a bus.
 
 **Simulation Result**

 <img width="1142" height="165" alt="encoder8x3_sim" src="https://github.com/user-attachments/assets/418bebae-7174-4ff9-84ab-49927d87369b" />
