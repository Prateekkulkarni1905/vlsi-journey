# Project 0 — ALU Comparative Analysis: RTL Coding Styles & Bit-Width Scalability

**Authors:** Prateek Kulkarni | Piyush | 2nd Year ECE | IIIT Nagpur
**Guide:**   Dr. Sushmita Dandeliya | Assistant Professor | ECE Dept | IIIT Nagpur
**Date:**    March 2026
**Tools:**   Verilog · Yosys OSS CAD Suite · OpenSTA · EDA Playground · GitHub

---

## Objective

Comparative analysis of 4 RTL coding styles across 3 bit-widths (4-bit, 8-bit, 12-bit)
for ALU design — evaluating PPA metrics using open-source EDA tools.

---

## ALU Operations (8 total)

| Opcode | Operation       |
|--------|-----------------|
| 000    | Addition        |
| 001    | Subtraction     |
| 010    | Bitwise AND     |
| 011    | Bitwise OR      |
| 100    | Bitwise XOR     |
| 101    | Left Shift      |
| 110    | Right Shift     |
| 111    | Compare (A==B)  |

---

## RTL Coding Styles

| Style              | Description                                        |
|--------------------|----------------------------------------------------|
| Behavioural        | case() based opcode selection using always block   |
| Dataflow           | Conditional/ternary operators using assign         |
| Structural         | Gate primitives and module instantiation           |
| Generate+Param     | Parametrized scalable design with generate blocks  |

---

## Bit Widths

| Width   | Styles                                              | Status        |
|---------|-----------------------------------------------------|---------------|
| 4-bit   | Behavioural, Dataflow, Structural, Generate+Param   | ✅ Complete   |
| 8-bit   | Behavioural, Dataflow, Structural, Generate+Param   | 🔴 In Progress|
| 12-bit  | Behavioural, Dataflow, Structural, Generate+Param   | 🔴 In Progress|

---

## Metrics Collected

| #  | Metric                            | Tool               |
|----|-----------------------------------|--------------------|
| 1  | Total Cells                       | Yosys stat         |
| 2  | Gate Breakdown (AND/OR/MUX/XOR/NOT)| Yosys stat        |
| 3  | Total Wires + Wire Bits           | Yosys stat         |
| 4  | Logic Depth                       | Yosys ltp          |
| 5  | LUT Count (FPGA)                  | Yosys synth_ice40  |
| 6  | Synthesis Optimisation            | Yosys before/after |
| 7  | Critical Path Delay               | OpenSTA            |
| 8  | Power Estimation                  | OpenSTA            |

---

## 4-bit ALU — Complete PPA Results

| Metric                | Behavioural | Dataflow | Structural | Generate+Param |
|-----------------------|-------------|----------|------------|----------------|
| Total Cells           | 150         | 104      | 130        | 149            |
| $_AND_                | 47          | 18       | 23         | 49             |
| $_MUX_                | 5           | 30       | 30         | 5              |
| $_NOT_                | 19          | 11       | 13         | 17             |
| $_OR_                 | 65          | 31       | 33         | 68             |
| $_XOR_                | 14          | 14       | 14         | 10             |
| Total Wires           | 65          | 56       | 161        | 79             |
| Wire Bits             | 198         | 129      | 305        | 213            |
| Public Wires          | 6           | 8        | 127        | 13             |
| Public Wire Bits      | 17          | 27       | 246        | 47             |
| Logic Depth           | 16          | 15       | 16         | 17             |
| LUT Count             | 50          | 49       | 47         | 50             |
| Cells Before Opt      | 27          | 29       | 107        | 88             |
| Synthesis Expansion   | 5.6x        | 3.6x     | 1.2x       | 1.7x           |
| Critical Path Delay   | 🔴          | 🔴       | 🔴         | 🔴             |
| Power Estimation      | 🔴          | 🔴       | 🔴         | 🔴             |

---

## Key Findings — 4-bit

| #  | Finding                                                                          |
|----|----------------------------------------------------------------------------------|
| 1  | Dataflow is most area-efficient — 104 cells, 30.7% less than Behavioural         |
| 2  | Dataflow has shortest logic depth — 15 gate levels                               |
| 3  | Structural has least LUTs — 47 (best for FPGA mapping)                           |
| 4  | Structural causes wire explosion — 161 wires vs 56 in Dataflow                   |
| 5  | Generate+Param has deepest logic path — 17 (ripple carry chain overhead)         |
| 6  | XOR count identical at 14 across 3 styles — confirms functional equivalence      |
| 7  | Dataflow has least synthesis expansion — 3.6x vs 5.6x Behavioural               |

---

## Research Paper

| Field    | Detail                                                                 |
|----------|------------------------------------------------------------------------|
| Title    | Comparative Analysis of RTL Coding Styles and Bit-Width Scalability in ALU Design: A PPA Study Using Open-Source Yosys EDA Tool |
| Target   | IEEE VDAT 2026 — JIIT Noida, Aug 20-22                                 |
| Deadline | April 24, 2026                                                         |
| Authors  | Prateek Kulkarni, Piyush, Dr. Sushmita Dandeliya                       |

---

## Repository Structure

| Folder           | Contents                                      | Status         |
|------------------|-----------------------------------------------|----------------|
| 4bit/            | All 4 styles + testbench + PPA screenshots    | ✅ Complete    |
| 8bit/            | All 4 styles + testbench + PPA screenshots    | 🔴 In Progress |
| 12bit/           | All 4 styles + testbench + PPA screenshots    | 🔴 In Progress |
| ppa_results.md   | Complete PPA table all bit widths all styles  | 🔴 In Progress |
| README.md        | Project overview and findings                 | ✅ Updated     |

---

## How to Run Yosys
```bash
read_verilog alu_behavioral.v
hierarchy -check -top ALU_4bit
proc
stat
opt
techmap
opt
stat
ltp
synth_ice40 -top ALU_4bit
stat
```

---

*Part of vlsi-journey — VLSI Physical Design roadmap*
*github.com/Prateekkulkarni1905/vlsi-journey*
