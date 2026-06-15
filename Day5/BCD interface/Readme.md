BCD Adder Verification using SystemVerilog


Overview

This project verifies the functionality of a BCD (Binary Coded Decimal) Adder using SystemVerilog. The verification environment applies various test cases to ensure that the BCD adder correctly performs decimal addition and generates valid BCD outputs.


Objective

The objective of this project is to:
Verify the correctness of BCD addition.
Check carry generation and propagation.
Validate output BCD digits for different input combinations.
Demonstrate SystemVerilog-based testbench development.


Design Description

A BCD adder adds two BCD digits along with an optional carry input. If the binary sum exceeds 9, a correction value of 6 (0110) is added to obtain a valid BCD result.

Verification Methodology

The SystemVerilog testbench includes:
DUT instantiation
Stimulus generation
Directed test cases
Output monitoring
Automatic result checking
Simulation Flow
Compile the RTL design and testbench.
Run the simulation.
Observe waveform results.
Compare DUT outputs with expected values.
Verify pass/fail status.


Tools Used

SystemVerilog
Xilinx Vivado Simulator
