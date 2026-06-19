# RTL Design

## Overview

The RTL (Register Transfer Level) design of the 8-bit RISC Processor was implemented in Verilog HDL.

The processor follows a single-cycle architecture where instruction fetch, decode, execution, and writeback occur within a single clock cycle.

The design is modular and consists of multiple RTL blocks that collectively implement the processor datapath and control path.

---

# RTL Architecture

The processor is composed of the following modules:

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

# Program Counter (PC)

## Purpose

The Program Counter stores the address of the current instruction being executed.

## Functionality

* Reset initializes PC to zero.
* On every clock cycle:

```text
PC ← Next_PC
```

* Supports sequential execution and branch target updates.

## Inputs

* clk
* rst
* next_pc

## Outputs

* pc

---

# Instruction Memory

## Purpose

Stores the program instructions executed by the processor.

## Features

* 16 instruction locations
* 16-bit instruction width
* Read-only memory

## Inputs

* address

## Outputs

* instruction

---

# Decoder

## Purpose

Extracts instruction fields from the 16-bit instruction word.

## Outputs Generated

* Opcode
* Source Register 1 (RS1)
* Source Register 2 (RS2)
* Destination Register
* Immediate Value

## Instruction Field Mapping

```text
[15:12] Opcode
[11:9]  RS1
[8:6]   RS2 / RD
[5:0]   Immediate
```

---

# Control Unit

## Purpose

Generates control signals required by the datapath.

## Generated Signals

* alu_control
* regwrite
* alu_src
* wb_sel
* branch
* rd_src
* mem_read
* mem_write
* mem_to_reg

## Functionality

The opcode determines the control signals required for instruction execution.

---

# Register File

## Purpose

Stores processor operands and computation results.

## Features

* 8 registers
* 8-bit register width
* Dual read ports
* Single write port
* Synchronous write
* Asynchronous read

## Special Register

```text
R0 = Constant Zero Register
```

---

# Arithmetic Logic Unit (ALU)

## Purpose

Performs arithmetic and logical operations.

## Supported Operations

| ALU Control | Operation |
| ----------- | --------- |
| 000         | ADD       |
| 001         | SUB       |
| 010         | AND       |
| 011         | OR        |
| 100         | XOR       |
| 101         | SLL       |
| 110         | SRL       |

## Outputs

* Result
* Zero Flag

---

# Data Memory

## Purpose

Stores application data used by LOAD and STORE instructions.

## Features

* Read operation
* Write operation
* Byte-addressable memory

## Supported Instructions

* LOAD
* STORE

---

# Execute Unit

## Purpose

Acts as the processor datapath.

## Internal Blocks

* Decoder
* Control Unit
* Register File
* ALU
* Data Memory
* Multiplexers

## Responsibilities

* Decode instruction
* Read operands
* Select ALU inputs
* Execute operation
* Generate branch condition
* Write results back to registers

---

# CPU Top Module

## Purpose

Integrates all processor modules into a complete CPU.

## Internal Components

* Program Counter
* Instruction Memory
* Execute Unit

## Responsibilities

* Instruction Fetch
* Branch Handling
* Program Flow Control

## Next PC Logic

Sequential execution:

```text
PC = PC + 1
```

Branch execution:

```text
PC = PC + Immediate
```

when:

```text
Branch = 1
Zero = 1
```

---

# Datapath Flow

The processor executes instructions using the following sequence:

```text
Instruction Memory
        ↓
     Decoder
        ↓
   Control Unit
        ↓
   Register File
        ↓
       ALU
        ↓
   Data Memory
        ↓
    Write Back
```

---

# Design Methodology

The RTL was developed using a bottom-up design approach.

Step 1:

* Individual module development

Step 2:

* Module-level simulation

Step 3:

* Execute Unit integration

Step 4:

* CPU integration

Step 5:

* Full processor simulation

---

# Verification Strategy

Each RTL block was verified independently before integration.

Verified Modules:

* Register File
* Instruction Memory
* Decoder
* Control Unit
* Fetch Unit
* Execute Unit
* CPU

Simulation was performed using Vivado Simulator.

---

# Summary

The RTL implementation successfully realizes an 8-bit RISC Processor capable of executing arithmetic, logical, immediate, memory, branch, and shift instructions.

The modular RTL structure enables straightforward FPGA implementation and ASIC synthesis using Cadence design tools.
