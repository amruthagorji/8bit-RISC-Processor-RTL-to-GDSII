# Runtime Workload Monitoring and Adaptive Frequency Scaling

## Overview

Traditional educational RISC processors operate at a fixed clock frequency regardless of the workload being executed.

To improve processor adaptability, a Runtime Workload Monitoring subsystem and an Adaptive Frequency Scaling (AFS) mechanism were integrated into the 8-bit RISC Processor.

The enhancement continuously analyzes the executed instruction stream, identifies the dominant workload type, and dynamically adjusts the processor clock frequency using a workload-aware clock divider.

This introduces a simple form of dynamic performance and power management inspired by techniques used in modern processors and System-on-Chips (SoCs).

---

## Architecture

The enhancement consists of two primary components:

1. Runtime Workload Monitor
2. Adaptive Frequency Scaling (AFS) Unit

### Operational Flow

```text
Instruction Stream
        ↓
Workload Monitor
        ↓
Workload Classification
        ↓
Adaptive Frequency Scaling
        ↓
Clock Divider
        ↓
Processor Clock
```

---

## Runtime Workload Monitoring

The workload monitor continuously observes executed instructions and classifies processor activity into three workload categories.

### Instruction Classification

| Category         | Instructions                                     |
| ---------------- | ------------------------------------------------ |
| ALU Intensive    | ADD, SUB, AND, OR, XOR, ADDI, SUBI, LI, SLL, SRL |
| Memory Intensive | LOAD, STORE                                      |
| Branch Intensive | BEQ                                              |

### Hardware Counters

The monitor maintains three independent counters:

* `alu_count`
* `mem_count`
* `branch_count`

Each counter records the occurrence of instructions belonging to its corresponding workload category.

---

## Observation Window Mechanism

Rather than accumulating statistics indefinitely, the workload monitor operates using a fixed observation window.

For every observation window:

1. Instruction counts are collected.
2. ALU, Memory, and Branch counters are compared.
3. Dominant workload type is identified.
4. Workload mode is generated.
5. Counters are reset.
6. Monitoring restarts for the next window.

This allows the processor to continuously adapt to changing workload characteristics.

---

## Workload Modes

The dominant workload is encoded into a workload mode signal.

| Workload Mode | Description  |
| ------------- | ------------ |
| 00            | ALU Heavy    |
| 01            | Memory Heavy |
| 10            | Branch Heavy |

---

## Adaptive Frequency Scaling (AFS)

The Adaptive Frequency Scaling unit receives the workload classification and dynamically selects the operating clock divider.

### Frequency Scaling Policy

| Workload Mode | Operating State   | Divider Value |
| ------------- | ----------------- | ------------- |
| 00            | High Performance  | 10            |
| 01            | Balanced Mode     | 20            |
| 10            | Power Saving Mode | 40            |

The selected divider is applied to the clock divider module, generating the processor clock used during execution.

---

## Adaptive Clock Generation

The generated clock frequency varies according to workload classification.

### ALU Heavy Workloads

* Highest performance requirement
* Smallest divider value
* Highest operating frequency

### Memory Heavy Workloads

* Moderate performance requirement
* Intermediate divider value
* Balanced operation

### Branch Heavy Workloads

* Lower computational intensity
* Largest divider value
* Reduced operating frequency

This demonstrates a simple workload-aware dynamic frequency adaptation mechanism.

---

# Experimental Results

Three benchmark instruction streams were executed to validate the workload monitor and Adaptive Frequency Scaling subsystem.

---

## ALU Heavy Benchmark

Characteristics:

* Dominated by arithmetic and logical instructions
* Minimal memory activity

Expected Result:

* ALU workload counter dominates
* Workload Mode = 00
* Divider Value = 10

### Waveform

![ALU Heavy Workload](../Runtime_workload_monitoring_AFS/ALU_workload_result.jpeg)
Result:

✅ Correctly classified as ALU Heavy workload

✅ Adaptive Frequency Scaling selected High Performance Mode

---

## Memory Heavy Benchmark

Characteristics:

* Dominated by LOAD and STORE instructions

Expected Result:

* Memory workload counter dominates
* Workload Mode = 01
* Divider Value = 20

### Waveform

![Memory Heavy Workload](../Runtime_workload_monitoring_AFS/Memory_workload_result.jpeg)
Result:

✅ Correctly classified as Memory Heavy workload

✅ Adaptive Frequency Scaling selected Balanced Mode

---

## Branch Heavy Benchmark

Characteristics:

* Dominated by BEQ instructions

Expected Result:

* Branch workload counter dominates
* Workload Mode = 10
* Divider Value = 40

### Waveform

![Branch Heavy Workload](../Runtime_workload_monitoring_AFS/Branch_workload_result.jpeg)
Result:

✅ Correctly classified as Branch Heavy workload

✅ Adaptive Frequency Scaling selected Power Saving Mode

---

## Adaptive Frequency Scaling Verification

The workload monitor and Adaptive Frequency Scaling unit were integrated and simulated together to validate runtime workload transitions and dynamic clock adaptation.

Observed Signals:

* workload_mode
* alu_count
* mem_count
* branch_count
* div_value
* slow_clk

### Waveform

![AFS Verification](../Runtime_workload_monitoring_AFS/AFS_result.jpeg)

Results:

✅ Runtime workload classification verified

✅ Divider value updated dynamically according to workload mode

✅ Adaptive clock generation validated

✅ Processor frequency successfully adapted to changing workload characteristics

---

## Key Contributions

This enhancement introduces architectural behavior beyond traditional educational RISC processors.

Implemented Features:

* Runtime workload monitoring
* Window-based workload classification
* Dynamic workload mode generation
* Adaptive frequency scaling
* Workload-aware clock divider selection
* Runtime processor frequency adaptation

---

## Future Work

Potential extensions include:

* Clock Gating Integration
* Dynamic Voltage and Frequency Scaling (DVFS)
* Performance Counter Integration
* Workload Prediction Algorithms
* Multi-Level Workload Classification
* ASIC Power Evaluation
* ASIC Implementation with Adaptive Clock Management
