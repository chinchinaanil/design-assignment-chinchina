# 8x8 Single-Port Block RAM (BRAM) Model

This repository contains a structural/behavioral Verilog implementation of an **8x8 Single-Port Block RAM (BRAM)** along with its testbench. The module is modeled to mimic the behavior of Xilinx Vivado's **Block Memory Generator IP Core**, making it ideal for synthesis, simulation, and integration into larger hardware architectures (such as pipelines, processors, or hardware accelerators).

## Table of Contents
- [Architecture Overview](#architecture-overview)
- [Module Specifications](#module-specifications)
- [Port Descriptions](#port-descriptions)
- [Getting Started in Vivado](#getting-started-in-vivado)
- [Simulation & Verification](#simulation-verification)

---

## Architecture Overview
The design implements a synchronous memory array containing **8 memory locations (depth)**, where each location stores an **8-bit data word (width)**. 

### Key Characteristics:
* **Synchronous Operation:** All read and write operations are synchronized to the rising edge of the clock (`clk`).
* **Array Enable (`ena`):** High-level active enable signal. When disabled (`ena = 0`), the internal memory states and output data remain latched and frozen.
* **Write-Enable (`wea`):** Controls the operational mode (Write when `1`, Read when `0`).
* **Read-First Behavior:** The memory operations execute concurrently, returning the data stored in the memory array at the active address before the write condition updates it.

---

## Module Specifications
* **Memory Depth:** 8 words
* **Memory Width:** 8 bits
* **Address Bus Width:** 3 bits ($2^3 = 8$ distinct addressable registers)

---

## Port Descriptions

| Port Name | Direction | Width | Description |
| :--- | :--- | :--- | :--- |
| `clk` | Input | 1 bit | System clock signal (Active on rising edge). |
| `ena` | Input | 1 bit | Block RAM enable signal (Active High). |
| `wea` | Input | 1 bit | Write Enable (1 = Write Mode, 0 = Read Mode). |
| `addra` | Input | 3 bits | Address bus to access memory locations `000` to `111`. |
| `dina` | Input | 8 bits | Data input bus for write operations. |
| `douta` | Output | 8 bits | Data output bus for read operations. |

---

## Getting Started in Vivado

### 1. Project Setup
1. Launch Xilinx Vivado and create a new project.
2. Select your target FPGA part or development board.
3. Add the `block_ram_8x8.v` source file under **Design Sources**.
4. Add the `tb_block_ram_8x8.v` source file under **Simulation Sources**.

### 2. RTL Synthesis
Run **Run Synthesis** to check the design logic. Vivado will automatically map this behavioral logic array structure to a native hardware Block RAM (BRAM) slice during implementation.

---

## Simulation & Verification

To verify the functional correctness of the block ram, run a behavioral simulation using Vivado's native simulator (XSIM).

### Testbench Sequence:
1. **Initialization:** Clears all control signals and inputs (`ena=0`, `wea=0`).
2. **Write Cycle:** Asserts `ena=1` and `wea=1` to store pattern signatures to distinct memory addresses:
   * Address `0` $\rightarrow$ `8'hAA`
   * Address `1` $\rightarrow$ `8'hBB`
   * Address `5` $\rightarrow$ `8'hCC`
3. **Read Cycle:** Drops `wea=0` to evaluate memory access, ensuring data read from addresses matches the written inputs perfectly.
4. **Disable Check:** Drops `ena=0` to verify that changing address lanes does not ripple or impact the latch state of `douta`.

### Running the Waveform
1. Click **Run Simulation** $\rightarrow$ **Run Behavioral Simulation**.
2. Add the signals `addra`, `dina`, `douta`, `wea`, and `ena` to your waveform visualizer window.
3. Zoom to fit the timeline. You should observe synchronous value transformations on each positive clock margin.
