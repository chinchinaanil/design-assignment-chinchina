FIFO Transaction Class using SystemVerilog

Overview

This project demonstrates the implementation of a FIFO Transaction Class in SystemVerilog. The transaction class is used in verification environments to represent FIFO input and output transactions.

The class includes randomized write/read control signals, input data, output data, and FIFO status signals. It serves as the basic building block for creating generators, drivers, monitors, and scoreboards in a FIFO verification environment.

---

Features

- SystemVerilog Class-Based Verification
- Randomized FIFO Inputs
- Constraint-Based Randomization
- FIFO Control Signals
- FIFO Data Signals
- Transaction Display Method

---

FIFO Signals

Control Signals

- "wr_en" : Write Enable
- "rd_en" : Read Enable

Data Signals

- "din" : Data Input
- "dout" : Data Output

Status Signals

- "full" : FIFO Full Indicator
- "empty" : FIFO Empty Indicator

---

Transaction Class

The transaction class contains:

- Randomized write enable signal
- Randomized read enable signal
- Randomized input data
- Output data storage
- FIFO status indicators
- Constraint to avoid simultaneous read and write operations
- Display method for transaction information

---

Verification Concepts Used

- Class
- Object Creation
- Randomization
- Constraints
- Functions
- Transaction-Based Verification

---

Applications

- FIFO Verification
- SystemVerilog Testbench Development
- UVM Sequence Item Foundation
- ASIC/SoC Verification Learning

---

Tools Used

- Vivado Simulator

---

