# 8-Bit RISC Processor | RTL-to-ASIC Implementation

## Overview

This project presents the design, verification, and ASIC implementation of a custom **8-Bit RISC Processor** developed using **Verilog HDL** and implemented through an industry-standard digital VLSI design flow.

Unlike a conventional academic RTL project, this processor was taken beyond functional simulation and successfully implemented through **logic synthesis, floorplanning, power planning, placement, clock tree synthesis, routing, timing verification, and physical verification** using **Cadence Genus** and **Cadence Innovus**.

The project demonstrates the complete journey from processor architecture design to a physically realizable chip layout while maintaining timing, area, and power constraints.

---

## Project Highlights

### Processor Specifications

| Parameter              | Value           |
| ---------------------- | --------------- |
| Architecture           | Custom RISC     |
| Datapath Width         | 8-bit           |
| Instruction Width      | 16-bit          |
| Register Count         | 8 Registers     |
| Register Address Width | 3-bit           |
| Instruction Memory     | 16 Instructions |
| Data Memory            | 256 Bytes       |
| RTL Language           | Verilog HDL     |

---

## Key Features

* Custom 8-Bit RISC Architecture
* Harvard-Style Memory Organization
* Single-Cycle Processor Design
* Arithmetic and Logical Operations
* Immediate Instructions
* Branch Instructions
* Shift Operations
* Data Memory Access
* Modular RTL Design
* Complete Functional Verification
* ASIC Physical Design Implementation

---

## Supported Instructions

### Arithmetic Operations

* ADD
* SUB

### Logical Operations

* AND
* OR
* XOR

### Immediate Operations

* ADDI
* SUBI
* LI

### Shift Operations

* SLL
* SRL

### Memory Operations

* LOAD
* STORE

### Branch Operations

* BEQ

---

## Processor Datapath

The processor is composed of the following major modules:

* Program Counter (PC)
* Instruction Memory
* Decoder
* Control Unit
* Register File
* Arithmetic Logic Unit (ALU)
* Data Memory
* Execute Unit
* CPU Top Module

---

## Verification Flow

The processor was verified at both module and system levels.

### Module Verification

* ALU
* Register File
* Instruction Memory
* Decoder
* Control Unit
* Fetch Unit
* Execute Unit

### System Verification

* CPU Integration Testing
* Instruction Execution Verification
* Branch Verification
* Memory Access Verification

### Tools Used

* Vivado Simulator
* XSim
* Cadence Xcelium

---

## ASIC Implementation Flow

The verified RTL was taken through a complete digital ASIC implementation flow.

### Logic Synthesis

Tool Used:

* Cadence Genus

Generated Reports:

* Timing Report
* Area Report
* Power Report

### Physical Design

Tool Used:

* Cadence Innovus

Implementation Stages:

* Floorplanning
* Power Planning
* Placement
* Clock Tree Synthesis (CTS)
* Routing
* Timing Verification
* Connectivity Verification
* DRC Verification
* Geometry Verification

---

## Physical Design Results

### Synthesis Results

| Metric            | Value        |
| ----------------- | ------------ |
| Cell Area         | 3775.560 µm² |
| Timing Violations | 0            |
| Timing Status     | Passed       |

### Power Results

| Metric      | Value            |
| ----------- | ---------------- |
| Total Power | 3.85389 × 10⁻⁴ W |

### Physical Verification

* DRC Violations : 0
* Geometry Violations : 0
* Connectivity Verification : Passed
* Timing Verification : Passed

---

## Repository Structure

```text
8-Bit-RISC-Processor/
│
├── RTL/
│   ├── alu.v
│   ├── register_file.v
│   ├── decoder.v
│   ├── control_unit.v
│   ├── fetch.v
│   ├── execute.v
│   ├── cpu.v
│   └── ...
│
├── Testbench/
│
├── Simulation/
│
├── ASIC_Flow/
│
├── Documentation/
│   ├── ISA.md
│   ├── RTL_Design.md
│   ├── Simulation_Results.md
│   └── ASIC_Flow.md
│
└── README.md
```

---

## Skills Demonstrated

### Digital Design

* Verilog HDL
* RTL Design
* Processor Architecture
* Datapath Design
* Control Unit Design
* FSM Design

### Verification

* Functional Verification
* Testbench Development
* Simulation Debugging
* Gate-Level Validation

### Physical Design

* Logic Synthesis
* Floorplanning
* Power Planning
* Placement
* Routing
* Static Timing Analysis
* Physical Verification

### EDA Tools

* Vivado
* Cadence Genus
* Cadence Innovus
* Cadence Xcelium

---

## Future Work

* Calibre DRC
* LVS Verification
* Parasitic Extraction (PEX)
* Signoff Static Timing Analysis
* Final GDSII Generation

---

## Author

**Amrutha Gorji**

B.Tech Electronics and Communication Engineering

SASTRA Deemed University

Research Intern – NIT Warangal

Digital VLSI | RTL Design | ASIC Design | Computer Architecture

