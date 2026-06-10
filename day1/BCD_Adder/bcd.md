# BCD Adder

## Objective
To design and simulate a BCD (Binary Coded Decimal) Adder using Verilog HDL.

## Description
A BCD adder adds two BCD digits along with an optional carry input. If the binary sum is greater than 9 (1001) or if a carry is generated, a correction of 0110 is added to obtain the correct BCD result.

## Folder Structure

- `design/top.v` : Verilog design code for the BCD Adder.
- `tb/tb_top.v` : Testbench used for simulation.
- `bcd.md` : Documentation of the project.
- `waveform.png` : Simulation output screenshot.

## Design Files
The design file contains the Verilog implementation of the BCD Adder.

## Testbench
The testbench applies different input combinations and verifies the functionality of the BCD Adder.

## Simulation Output

![Simulation Output](waveform.png)

## Observations
- The BCD Adder correctly performs decimal addition.
- Whenever the sum exceeds 9, the correction factor (0110) is added.
- The simulation results matched the expected outputs.

## Conclusion
The BCD Adder was successfully designed, simulated, and verified using Verilog HDL.
