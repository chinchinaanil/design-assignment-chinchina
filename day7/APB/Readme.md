# APB Slave Design and Verification using SystemVerilog

## Overview
This project implements an APB (Advanced Peripheral Bus) Slave in SystemVerilog. The slave supports basic APB read and write transactions using an internal memory array.

## Features
- APB Read Transactions
- APB Write Transactions
- 32-bit Address Bus
- 32-bit Data Bus
- Internal Memory Storage
- Active-Low Reset
- Always-Ready Slave (PREADY = 1)

---

## Design Module


The APB slave performs memory read and write operations based on APB control signals.

### APB Interface Signals

| Signal | Direction | Description |
|----------|----------|-------------|
| clk | Input | System Clock |
| rst_n | Input | Active-Low Reset |
| paddr | Input | Address Bus |
| psel | Input | Slave Select |
| penable | Input | Enable Signal |
| pwrite | Input | Read/Write Control |
| pwdata | Input | Write Data |
| prdata | Output | Read Data |
| pready | Output | Ready Signal |

---

## Internal Memory

```systemverilog
logic [31:0] mem [0:256];
```

- 257 memory locations
- Each location stores 32-bit data
- Address indexing uses `paddr[9:2]`

---

## Write Operation

When:

```systemverilog
psel && penable && pwrite
```

Data is written into memory:

```systemverilog
mem[paddr[9:2]] <= pwdata;
```

---

## Read Operation

When:

```systemverilog
psel && penable && !pwrite
```

Data is read from memory:

```systemverilog
prdata <= mem[paddr[9:2]];
```

---

## Reset Operation

```systemverilog
if (!rst_n)
    prdata <= 32'h0;
```

During reset:
- PRDATA is cleared
- Memory retains previous values

---

## APB Transfer Flow

### Setup Phase
- PSEL = 1
- PENABLE = 0
- Address and control signals become valid

### Access Phase
- PENABLE = 1
- Data transfer occurs
- PREADY = 1 indicates completion

---



### Components

#### Interface
The APB interface encapsulates all APB bus signals and provides a common communication channel between the DUT and verification components.
Signals included:
clk
rst_n
paddr
psel
penable
pwrite
pwdata
prdata
pready

Benefits:
Simplifies DUT connections
Reduces signal wiring complexity
Improves testbench readability and reusability

#### Transaction
Stores APB transaction information.

#### Generator
Creates random read and write transactions.

#### Driver
Drives transactions to the DUT.

#### Monitor
Captures DUT activity.

#### Scoreboard
Checks expected and actual results.

---



---

## Simulation

### ModelSim

```bash
vlog *.sv
vsim apb_tb
run -all
```

### Vivado Simulator

```bash
xvlog *.sv
xelab apb_tb
xsim apb_tb
```

---

## Expected Results

- Successful Write Transactions
- Successful Read Transactions
- Correct Data Storage
- Correct Data Retrieval
- No Protocol Errors

---

