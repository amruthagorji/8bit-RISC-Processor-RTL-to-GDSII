# Processor Architecture

## Overview

This project implements an 8-bit RISC Processor using Verilog HDL. The processor follows a single-cycle architecture and supports arithmetic, logical, immediate, branch, memory, and shift instructions.

The design is intended for RTL-to-GDSII implementation using Cadence Genus and Innovus tools, with FPGA validation planned as a future stage.

---

## Architecture

The processor consists of the following modules:

1. Program Counter (PC)
2. Instruction Memory
3. Decoder
4. Control Unit
5. Register File
6. Arithmetic Logic Unit (ALU)
7. Data Memory
8. Execute Unit
9. CPU Top Module

---

## Datapath Width

- Data Width : 8 bits
- Instruction Width : 16 bits
- Register Count : 8 Registers
- Register Address Width : 3 bits
- Instruction Memory : 16 Locations
- Data Memory : 256 Bytes

---

## Register File

The register file contains 8 general-purpose registers.

| Register | Description |
|-----------|------------|
| R0 | Constant Zero Register |
| R1-R7 | General Purpose Registers |

Features:

- Dual Read Ports
- Single Write Port
- Synchronous Write
- Asynchronous Read

---

## Instruction Format

### R-Type

| Opcode | RS1 | RS2 | RD | Unused |
|----------|------|------|------|----------|
| 4 bits | 3 bits | 3 bits | 3 bits | 3 bits |

---

### I-Type

| Opcode | RS1 | RD | Immediate |
|----------|------|------|-----------|
| 4 bits | 3 bits | 3 bits | 6 bits |

---

## Supported Instructions

### Arithmetic Instructions

- ADD
- SUB

### Logical Instructions

- AND
- OR
- XOR

### Immediate Instructions

- ADDI
- SUBI
- LI

### Shift Instructions

- SLL
- SRL

### Memory Instructions

- LOAD
- STORE

### Branch Instructions

- BEQ

---

## Program Counter Operation

The Program Counter stores the current instruction address.

Normal execution:

PC = PC + 1

Branch execution:

PC = PC + Immediate

---

## ALU Operations

| ALU Control | Operation |
|------------|------------|
| 000 | ADD |
| 001 | SUB |
| 010 | AND |
| 011 | OR |
| 100 | XOR |
| 101 | SLL |
| 110 | SRL |

---

## Branch Operation

The processor supports BEQ (Branch if Equal).

Branch occurs when:

- branch signal = 1
- zero flag = 1

Next PC is updated using the branch target address.

---

## Memory Architecture

Instruction Memory and Data Memory are separated.

This follows a Harvard Architecture style organization.

### Instruction Memory

- Read Only
- Stores program instructions

### Data Memory

- Read and Write
- Used by LOAD and STORE instructions

---

## Verification

Individual simulations were completed for:

- Register File
- Instruction Memory
- Decoder
- Control Unit
- Fetch Unit
- Execute Unit
- CPU Top Module

Simulation was performed using Vivado Simulator.

---

## Future Work

- FPGA Implementation
- Bitstream Generation
- Hardware Validation
- RTL Synthesis using Cadence Genus
- Physical Design using Cadence Innovus
- Timing Analysis
- GDSII Generation
