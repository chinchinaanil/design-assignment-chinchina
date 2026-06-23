# Portfolio — TKMCE Summer Internship 2026

## Overview
This repository serves as a structured archive of Verilog HDL hardware designs, verification testbenches, and simulation results compiled during the 15-day industrial internship program hosted by TKM College of Engineering.

 **Trainee Profile**
* **Name:** Chinchina Anil
* **Discipline:** Electronics and Communication Engineering
* **Institution:** Government Engineering College Idukki (GECI)
* **Development Environment:** Xilinx Vivado Design Suite
* **Target Language:** Verilog HDL

---

## Program Timeline & Milestones

### Core Details

| Parameter | Description |

| **Program Title** | 15-Day Hardware Description Language Internship |
| **Host Institution** | TKMCE Department of ECE |
| **Commencement Date** | June 08, 2026 |

### Daily Laboratory Logs
#### 📂 Day 1: Combinational Logic Foundations
* **4-Bit Ripple Carry Adder (RCA):** Modular adder logic implementation and structural optimization.
* **Binary Coded Decimal (BCD) Counter:** Synchronous decade counting sequence verification.

#### 📂 Day 2: Sequential Logic & Modern Registers
* **Combinational Encoder & Decoder Subsystems:** Behavioral description modeling.
* **Universal Shift Register (USR):** Multi-mode (SISO, SIPO, PISO, PIPO) shifting and loading array logic.
* **SR Flip-Flop Array:** Standard memory bistable cell simulation.
* **D Flip-Flop Array:** Edge-triggered state element block processing.


#### 📂  Day 3: FIFO Usecase,Sequence detector

FIFO Usecase

*Designed and verified an 8 \times 8 synchronous FIFO buffer in Verilog to manage data transfer rate-matching between a high-speed data source module and a slower processing destination module. 
* Integrated status tracking flags (full and empty) alongside internal pointer controls to secure data integrity and buffer pipeline data bursts without loss over varying execution cycles.
 
Sequence detector

Constructed a finite state machine (FSM) to continuously monitor serial data streams for a targeted bit pattern.
Evaluated overlapping or non-overlapping state sequence transitions to guarantee reliable pattern recognition.


#### 📂  Day 4: Block memory generator


Engineered a synchronous single-port RAM architecture featuring parameterized byte-wide data paths and independent address tracking.
Integrated an asynchronous active-low reset loop to safely initialize the internal memory matrix configurations.


#### 📂  Day 5:FIFO interfacing,BCD interfacing

FIFO Interfacing
Rectified status flag generation logic using a dynamic element counter to unlock 100% buffer capacity, resolving critical boundary alignment bugs between read/write pointer wraparounds.
BCD Interfacing
Engineered and integrated binary-coded decimal communication logic to facilitate synchronized, multi-digit numeric data conversions and stable display-driver interactions.


#### 📂  Day 6:Day 6: FIFO Transaction Class Development
Overview

On Day 6, a transaction class was developed for FIFO verification using SystemVerilog. The transaction class serves as a reusable object for modeling FIFO read and write operations and enables randomized test generation for functional verification.

Features implemented: FIFO Transaction class generation,Read and write transaction modelling,Randomized Data Generation,Constraint based verification etc.

#### 📂   Day 7:APB Protocol Design and Verification
Overview

On Day 7, an APB (Advanced Peripheral Bus) Slave was designed and verified using SystemVerilog. The implementation supports standard APB read and write transactions while adhering to AMBA APB protocol specifications.

Design Features : 32-bit Address Bus,32-bit Data Bus,Internal Memory Array,Active-Low Reset,APB Read Support,APB Write Support,Always-Ready Slave Interface (PREADY = 1)

Verification Features: APB Master Testbench Development,Read Transaction Verification,Write Transaction Verification,Functional Simulation,Waveform Analysis,Protocol Compliance Validation


####  📂 PROJECT : AXI DMA CONTROLLER

           This project focuses on the design and verification of an AXI DMA Controller with Scatter-Gather support using SystemVerilog. The controller            enables efficient high-speed data transfers between memories with minimal CPU intervention by utilizing descriptor-based                                 transfer management.










---

## Directory Infrastructure Layout

```text
TKMCE-internship/
├── README.md
├── day1/
│   ├── Ripple_Carry_Adder/
│   │   ├── Design/
│   │   └── Testbench/
│   └── BCD_Counter/
│       ├── Design/
│       └── Testbench/
└── day2/
    ├── decoder/
    │   ├── design/
    │   └── testbench/
    ├── usr/
    │   ├── design/
    │   └── testbench/
    ├── SR flipflop/
    │   ├── design/
    │   └── testbench/
    └── D flipflop/
        ├── design/
        └── testbench/
```

---

## Skills Developed

Throughout this internship, the following technical skills were strengthened:

- Verilog HDL Coding
- RTL Design Methodology
- Combinational Circuit Design
- Sequential Circuit Design
- Register and Counter Design
- Flip-Flop Modeling
- Testbench Development
- Functional Simulation
- Waveform Analysis
- Hardware Verification Techniques
- Xilinx Vivado Design Flow

## Conclusion

This internship provided valuable hands-on experience in digital design and verification using Verilog HDL. Through the successful implementation and testing of various digital circuits, a strong understanding of Register Transfer Level (RTL) design, simulation processes, and verification methodologies was developed.

The practical exposure to industry-standard tools such as Xilinx Vivado enhanced proficiency in hardware design workflows, debugging, and waveform analysis. Overall, the internship established a solid foundation for advanced studies and future projects in Digital Electronics, FPGA Design, and VLSI Engineering.

## Core Toolchain & Competencies
* **HDL Modeling:** Behavioral, Dataflow, and Structural Verilog descriptions.
* **EDA Simulation:** Vivado Behavioral Simulator waveform validation.
* **Version Control:** Git repository structuring and branch workspace management.

---
*This portfolio is actively curated to track academic laboratory progression,architectural code verification, and design metrices.*
