# Ripple Carry Adder (RCA)

## Aim
To design and simulate a 4-bit Ripple Carry Adder using Verilog HDL.

## Description
A Ripple Carry Adder is a combinational circuit used to add two binary numbers. It consists of a series of full adders in which the carry output of one stage is connected to the carry input of the next stage. The carry propagates from the least significant bit to the most significant bit, resulting in a ripple effect.

## Files
- `design` – Contains the Verilog design file (`rca.v`).
- `tb` – Contains the testbench file (`rca_tb.v`).
- `screenshot` – Contains the simulation waveform screenshot.

## Output
The simulation verifies the correct addition of two 4-bit binary numbers with carry input and carry output.
