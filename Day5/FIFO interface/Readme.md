Synchronous FIFO Verification using SystemVerilog


Overview

This project focuses on the verification of a Synchronous First-In-First-Out (FIFO) memory using SystemVerilog. The FIFO operates with a single clock for both read and write operations. The verification environment validates FIFO functionality, including data storage, retrieval, status flags, and boundary conditions.


Objectives

Verify correct FIFO write and read operations.
Check FIFO data integrity.
Validate Full and Empty flag generation.
Test FIFO behavior under overflow and underflow conditions.
Develop a reusable SystemVerilog testbench.


FIFO Description

A Synchronous FIFO stores data sequentially and retrieves it in the same order in which it was written.


Features

Single clock operation
Parameterized FIFO depth and data width
Full flag generation
Empty flag generation
Read and write pointers
Reset functionality

Verification Environment


The SystemVerilog testbench consists of:
DUT Instantiation
Clock Generation
Reset Generation
Stimulus Generation
Monitor
Scoreboard-Based Checking
Functional Coverage


Test Scenarios

1. Reset Verification
Apply reset.
Verify FIFO becomes empty.
Check pointer initialization.
2. Write Operation
Write multiple data values.
Verify data is stored correctly.
3. Read Operation
Read previously written data.
Verify FIFO order is maintained (FIFO property).
4. Full Condition
Fill FIFO completely.
Verify Full flag assertion.
5. Empty Condition
Read all stored data.
Verify Empty flag assertion.
6. Overflow Condition
Attempt writes when FIFO is full.
Verify no invalid data storage occurs.
7. Underflow Condition
Attempt reads when FIFO is empty.
Verify proper FIFO behavior.
8. Simultaneous Read and Write
Perform read and write operations in the same clock cycle.
Verify correct pointer updates.

Tools Used

SystemVerilog
Xilinx Vivado Simulator
