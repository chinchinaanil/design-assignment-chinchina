# AXI DMA CONTROLLER WITH SCATTER-GATHER ENHANCEMENT

## RTL DESIGN REPORT

---



---

## Team Members

* Prayag V T (Team Lead)
* Lasim
* Chinchina Anil
* Shafin V
* Isac
* Lakshmi

---

### Design Tool

**Xilinx Vivado 2023.2**

### Hardware Description Language

**SystemVerilog / Verilog HDL**

### Project Type

RTL Design

---
# CHAPTER 1

# INTRODUCTION

## 1.1 Background

Modern System-on-Chip (SoC) architectures require high-speed movement of large amounts of data between memory and peripherals. If the processor performs every data transfer, a significant portion of its execution time is spent copying data instead of executing application software. This limits overall system performance and reduces processing efficiency.

A Direct Memory Access (DMA) Controller addresses this problem by transferring data directly between memory locations without continuous processor involvement. The processor only configures the DMA controller by providing the source address, destination address, and transfer size. Once the transfer begins, the DMA controller autonomously performs all memory transactions and notifies the processor after completion.

The AXI Direct Memory Access (AXI DMA) Controller follows the AMBA AXI4 protocol, enabling high-bandwidth communication with memory while supporting burst-based transfers for improved throughput.

---

## 1.2 Motivation

The original AXI DMA controller supports only a single memory transfer for each software configuration.

For every new transfer, the processor must:

* Configure the source address
* Configure the destination address
* Configure the transfer size
* Enable the DMA
* Start the transfer
* Wait until completion
* Repeat the entire process for the next transfer

This repetitive software intervention introduces unnecessary processor overhead and creates idle periods between consecutive DMA operations. As the number of transfers increases, overall system throughput decreases.

Therefore, an enhancement was required to automate multiple DMA transfers while reducing processor involvement.

---

## 1.3 Project Objectives

The primary objective of this project is to enhance the existing AXI DMA Controller by introducing Scatter-Gather functionality.

The specific objectives are:

* Study the architecture of the existing AXI DMA controller.

---

## 6.4 Applications

The proposed Scatter-Gather DMA architecture can be applied in a wide range of embedded and high-performance computing systems.

Typical application areas include:

* Memory-to-memory data transfer
* Embedded Linux systems
* FPGA-based accelerators
* Video and image processing
* Network packet processing
* High-speed storage controllers
* Data acquisition systems
* System-on-Chip (SoC) platforms

These applications require continuous movement of large amounts of data while minimizing processor involvement.

---

## 6.5 Future Scope

Although the proposed architecture significantly improves the existing DMA controller, several enhancements can be considered for future development.

### Multi-Channel DMA

Support multiple DMA channels operating simultaneously for parallel data transfers.

### 64-bit Addressing

Extend the architecture to support larger memory spaces through 64-bit addressing.

### Dynamic Burst Optimization

Implement adaptive burst-size selection based on transfer size and memory alignment.

### Advanced Error Handling

Introduce descriptor validation, timeout detection, and automatic recovery mechanisms for fault-tolerant operation.

### Performance Monitoring

Add hardware performance counters to monitor:

* Number of transfers
* Bytes transferred
* Average transfer latency
* AXI bus utilization

---

## 6.6 Overall Conclusion

The AXI DMA Controller was successfully enhanced with Scatter-Gather functionality through RTL design using Verilog/SystemVerilog. By introducing a Descriptor Fetch Engine and a dedicated Scatter-Gather Controller FSM, the enhanced architecture enables autonomous execution of multiple DMA transfers using linked descriptors stored in memory.

Unlike the original DMA controller, which required repeated processor intervention, the proposed architecture automatically processes descriptor chains, thereby reducing software overhead and improving system efficiency.

The modular implementation preserves the original DMA data path while extending the control logic, making the design scalable, reusable, and suitable for modern high-performance embedded systems.

The proposed architecture provides a strong foundation for future enhancements such as multi-channel DMA, intelligent burst optimization, larger address spaces, and advanced scheduling mechanisms.

---

# APPENDIX A: RTL MODULE LIST

| Module                                   | Description                  |
| ---------------------------------------- | ---------------------------- |
| `dma_axi_simple`                         | Top-level AXI DMA Controller |
| `dma_axi_simple_core`                    | Main DMA Data Path           |
| `dma_axi_simple_core_read`               | AXI Master Read Engine       |
| `dma_axi_simple_core_write`              | AXI Master Write Engine      |
| `dma_axi_simple_fifo_sync_small`         | Internal FIFO Buffer         |
| `dma_axi_simple_csr`                     | Control and Status Registers |
| `dma_axi_simple_csr_axi`                 | AXI Slave CSR Interface      |
| `dma_axi_simple_csr_read`                | CSR Read Logic               |
| `dma_axi_simple_csr_write`               | CSR Write Logic              |
| `dma_axi_simple_defines`                 | Common AXI Definitions       |
| `dma_axi_simple_desc_fetch` *(Proposed)* | Descriptor Fetch Engine      |
| `dma_axi_simple_sg_fsm` *(Proposed)*     | Scatter-Gather Controller    |
| `dma_axi_simple_descriptor` *(Proposed)* | Descriptor Storage Registers |

---

# APPENDIX B: TEAM CONTRIBUTION

| Team Member | Contribution                                           |
| ----------- | ------------------------------------------------------ |
| Prayag V T  | Project planning and architecture design               |
| Lasim       | Descriptor Fetch Engine design                         |
| Chinchina Anil   | Scatter-Gather FSM design                              |
| Shafin V    | RTL integration, architectural analysis, documentation |
| Isac        | AXI interface integration                              |
| Lakshmi     | Documentation and report preparation                   |

---

# APPENDIX C: SOFTWARE TOOLS

| Tool                 | Purpose                           |
| -------------------- | --------------------------------- |
| Xilinx Vivado 2023.2 | RTL design and synthesis          |
| Verilog HDL          | Hardware description language     |
| SystemVerilog        | RTL implementation                |
| GitHub               | Version control and documentation |

---


# END OF REPORT

---

**Project Status:** RTL Design Completed

**Development Tool:** Vivado 2023.2

**Hardware Description Language:** Verilog / SystemVerilog
