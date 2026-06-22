# APB Slave Verification using SystemVerilog

## Overview

This project verifies the functionality of an APB (Advanced Peripheral Bus) Slave using a SystemVerilog testbench environment.

The verification environment generates APB read and write transactions, drives them to the DUT, monitors the interface signals, and checks correctness using a scoreboard.

---

## Verification Objectives

- Verify APB Read Transactions
- Verify APB Write Transactions
- Verify Reset Functionality
- Verify Data Integrity
- Verify Address Access
- Check Protocol Compliance

---

## DUT



The DUT (Device Under Test) is an APB Slave with:
- 32-bit Address Bus
- 32-bit Data Bus
- Internal Memory
- Read/Write Support

---

## Verification Components

### 1. Transaction Class



Represents an APB transaction.

Fields:
- Address
- Write Data
- Read Data
- Read/Write Control

---

### 2. Generator



Generates random APB transactions and sends them to the driver through a mailbox.

Responsibilities:
- Create random transactions
- Randomize address and data
- Generate read/write operations

---

### 3. Driver



Drives APB signals to the DUT.

Responsibilities:
- Receive transactions from generator
- Perform APB setup phase
- Perform APB access phase
- Drive read/write operations

---

### 4. Monitor



Observes APB interface signals.

Responsibilities:
- Capture transactions
- Collect DUT outputs
- Send information to scoreboard

---

### 5. Scoreboard


Checks correctness of DUT behavior.

Responsibilities:
- Compare expected data with actual data
- Verify read/write operations
- Report PASS/FAIL

---

### 6. Environment


Connects:
- Generator
- Driver
- Monitor
- Scoreboard

Manages communication using mailboxes.

---
### 7.Interface



The interface groups all APB signals and provides a connection between the DUT and verification environment.

Signals:
- PADDR
- PSEL
- PENABLE
- PWRITE
- PWDATA
- PRDATA
- PREADY
- CLK
- RESET

Benefits:
- Simplifies signal connections
- Improves code readability
- Reduces wiring complexity



- ### 8. Transaction Class



The transaction class represents a single APB transaction.




Responsibilities:
- Stores transaction information
- Supports randomization
- Transfers data between verification components


### 8. Testbench



Top-level verification module.

Responsibilities:
- Instantiate DUT
- Generate clock
- Apply reset
- Start verification environment

---

## Verification Architecture

Generator → Driver → DUT

DUT → Monitor → Scoreboard

---

## APB Transaction Flow

### Write Transaction

1. Generator creates WRITE transaction.
2. Driver drives:
   - PSEL = 1
   - PENABLE = 0
3. Driver asserts PENABLE.
4. DUT stores data.
5. Monitor captures transaction.
6. Scoreboard verifies result.

---

### Read Transaction

1. Generator creates READ transaction.
2. Driver drives APB signals.
3. DUT returns data.
4. Monitor captures PRDATA.
5. Scoreboard compares expected and actual data.

---

## Simulation Flow

1. Reset DUT
2. Generate Transactions
3. Drive Transactions
4. Monitor DUT Activity
5. Check Results in Scoreboard
6. Display PASS/FAIL Status

---



## Tools Used

- SystemVerilog
- ModelSim / QuestaSim
- Vivado Simulator

---

## Expected Output

- Successful APB Read Verification
- Successful APB Write Verification
- Correct Data Comparison
- PASS Status from Scoreboard

---

## Future Enhancements

- Functional Coverage
- SystemVerilog Assertions (SVA)
- APB4 Verification
- UVM-Based Verification Environment

---
