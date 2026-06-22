# Face Scan System using Verilog

## Overview

This project implements a simple Face Scan Data Processing System in Verilog. The system captures incoming face scan data, stores it in a FIFO buffer, and outputs the stored data through a controlled read mechanism using a Finite State Machine (FSM).

The design demonstrates:
- Data acquisition
- FIFO buffering
- FSM-based output control
- Synchronous data transfer

---

## System Architecture

```text
        +-----------+
        | Face Scan |
        |  Module   |
        +-----------+
              |
              v
        +-----------+
        |   FIFO    |
        |  Buffer   |
        +-----------+
              |
              v
        +-----------+
        | Output    |
        | Controller|
        |   (FSM)   |
        +-----------+
              |
              v
          Output
```

---

## Modules Description

### 1. Top Module



The top-level module integrates all submodules:

- Face Scan Module
- FIFO Buffer
- Output Controller (FSM)

#### Inputs

| Signal | Width | Description |
|----------|--------|-------------|
| clk | 1 | System Clock |
| rst | 1 | System Reset |
| wren | 1 | FIFO Write Enable |
| start_read | 1 | Start Reading Data |
| sin | 8 | Face Scan Input Data |

#### Outputs

| Signal | Width | Description |
|----------|--------|-------------|
| dout | 8 | Output Data |
| rden | 1 | FIFO Read Enable |
| full | 1 | FIFO Full Flag |
| empty | 1 | FIFO Empty Flag |

---

### 2. Face Scan Module



This module represents the face scanning unit.

#### Function

- Receives incoming scan data (`sin`)
- Registers the data on each clock cycle
- Sends processed data to FIFO

#### Operation

```verilog
always @(posedge clk)
    sout <= sin;
```

Currently acts as a pass-through module.

---

### 3. FIFO Buffer



The FIFO temporarily stores scanned face data before processing.

#### Features

- First-In First-Out storage
- Supports simultaneous write and read operations
- Provides status signals:
  - Full
  - Empty

#### Inputs

- clk
- rst
- wren
- rden
- data_in

#### Outputs

- data_out
- full
- empty

---

### 4. Output Controller (FSM)



Controls reading data from FIFO.

#### FSM States

### IDLE

System waits for:

```text
start_read = 1
```

Read operation disabled.

---

### DELAY_CYCLES

Introduces a delay before reading data.

Purpose:
- Synchronization
- Stable FIFO access

Delay Counter:

```verilog
delay_count
```

---

### READ_DATA

Reads data from FIFO.

Operation:

```verilog
rden = !empty;
```

Data is transferred to output.

---

## FSM State Diagram

```text
           start_read
      +------------------+
      |                  |
      v                  |
   +------+         +---------+
   | IDLE | ------> | DELAY   |
   +------+         +---------+
                       |
                       |
                       v
                 +-----------+
                 | READ_DATA |
                 +-----------+
                       |
                 FIFO Empty
                       |
                       v
                    IDLE
```

---

## Data Flow

1. Face scan data enters through `sin`.
2. Face module registers the data.
3. Data is written into FIFO when `wren = 1`.
4. FIFO stores incoming scan data.
5. When `start_read = 1`, FSM begins read sequence.
6. After delay cycles, data is read from FIFO.
7. Output appears on `dout`.

---

## Simulation Flow

### Write Operation

```text
sin = Face Data
wren = 1

Face Module
    ↓
FIFO Write
```

### Read Operation

```text
start_read = 1
      ↓
FSM Delay
      ↓
FIFO Read
      ↓
dout Updated
```

---

## Project Structure

```text
FACE_SCAN_SYSTEM/
│
├── top_system.v
├── face.v
├── fifo.v
├── out_mod.v
├── tb_top_system.v
└── README.md
```

---

## Applications

- Face Recognition Systems
- Smart Attendance Systems
- Access Control Systems
- Security Monitoring Systems
- Image Processing Pipelines

---

## Future Enhancements

- Real Face Detection Algorithm
- Feature Extraction Engine
- Face Matching Database
- UART/SPI Interface Support
- FPGA Hardware Implementation
- Machine Learning Integration

---

## Tools Used

- Verilog HDL
- Vivado Simulator


---

