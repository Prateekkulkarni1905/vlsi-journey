# Project 0 — ALU Comparative Analysis: RTL Coding Styles & Bit-Width Scalability

**Authors:**  Prateek Kulkarni | Piyush | 2nd Year ECE | IIIT Nagpur
**Guide:**    Dr. Sushmita Dandeliya | Assistant Professor | ECE Dept | IIIT Nagpur
**Date:**     March 2026
**Tools:**    Verilog · Yosys OSS CAD Suite · OpenSTA · EDA Playground · GitHub

---

## Objective

Comparative analysis of 4 RTL coding styles across 3 bit-widths (4-bit, 8-bit, 12-bit)
for ALU design — evaluating PPA metrics using open-source EDA tools.
Total implementations: 12 (4 styles × 3 bit-widths)

---

## ALU Operations (8 total)

| Opcode | Operation      |
|--------|----------------|
| 000    | Addition       |
| 001    | Subtraction    |
| 010    | Bitwise AND    |
| 011    | Bitwise OR     |
| 100    | Bitwise XOR    |
| 101    | Left Shift     |
| 110    | Right Shift    |
| 111    | Compare (A==B) |

---

## RTL Coding Styles

| Style           | Description                                       |
|-----------------|---------------------------------------------------|
| Behavioural     | case() based opcode selection using always block  |
| Dataflow        | Conditional/ternary operators using assign        |
| Structural      | Gate primitives and module instantiation          |
| Generate+Param  | Parametrized scalable design with generate blocks |

---

## Bit Widths

| Width  | Styles                                            | Status         |
|--------|---------------------------------------------------|----------------|
| 4-bit  | Behavioural, Dataflow, Structural, Generate+Param | ✅ Complete    |
| 8-bit  | Behavioural, Dataflow, Structural, Generate+Param | 🟡 In Progress |
| 12-bit | Behavioural, Dataflow, Structural, Generate+Param | 🔴 Pending     |

---

## Metrics Collected

| #  | Metric                              | Tool                   | Status      |
|----|-------------------------------------|------------------------|-------------|
| 1  | Total Cells (gate count)            | Yosys stat             | ✅ Done     |
| 2  | Gate Breakdown (AND/OR/MUX/XOR/NOT) | Yosys stat             | ✅ Done     |
| 3  | Total Wires + Wire Bits             | Yosys stat             | ✅ Done     |
| 4  | Logic Depth (gate levels)           | Yosys ltp              | ✅ Done     |
| 5  | LUT Count (FPGA target)             | Yosys synth_ice40      | ✅ Done     |
| 6  | Cells Before Optimisation           | Yosys stat (pre-opt)   | ✅ Done     |
| 7  | Synthesis Expansion Factor          | Before/After ratio     | ✅ Done     |
| 8  | Area (µm²)                          | OpenSTA + Liberty file | 🔴          |
| 9  | Critical Path Delay (ns)            | OpenSTA + Liberty file | 🔴          |
| 10 | Power Estimation (mW)               | OpenSTA + Liberty file | 🔴          |

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
| Area (µm²)            | 🔴          | 🔴       | 🔴        | 🔴            |
| Critical Path (ns)    | 🔴          | 🔴       | 🔴        | 🔴            |
| Power (mW)            | 🔴          | 🔴       | 🔴        | 🔴            |

---

## 8-bit ALU — PPA Results (Partial)

| Metric                | Behavioural | Dataflow | Structural | Generate+Param |
|-----------------------|-------------|----------|------------|----------------|
| Total Cells           | 280         | 206      | 256        | 🔴             |
| $_AND_                | 103         | 46       | 63         | 🔴             |
| $_MUX_                | 9           | 58       | 66         | 🔴             |
| $_NOT_                | 23          | 15       | 20         | 🔴             |
| $_OR_                 | 115         | 57       | 59         | 🔴             |
| $_XOR_                | 30          | 30       | 48         | 🔴             |
| Total Wires           | 101         | 84       | 263        | 🔴             |
| Wire Bits             | 356         | 243      | 587        | 🔴             |
| Public Wires          | 6           | 8        | 207        | 🔴             |
| Public Wire Bits      | 29          | 47       | 478        | 🔴             |
| Logic Depth           | 21          | 18       | 11         | 🔴             |
| LUT Count             | 98          | 105      | 88         | 🔴             |
| Cells Before Opt      | 27          | 29       | 189        | 🔴             |
| Synthesis Expansion   | 10.4x       | 7.1x     | 1.4x       | 🔴             |
| Area (µm²)            | 🔴          | 🔴       | 🔴         | 🔴             |
| Critical Path (ns)    | 🔴          | 🔴       | 🔴         | 🔴             |
| Power (mW)            | 🔴          | 🔴       | 🔴         | 🔴             |

---

## 12-bit ALU — PPA Results

| Metric                | Behavioural | Dataflow | Structural | Generate+Param |
|-----------------------|-------------|----------|------------|----------------|
| Total Cells           | 🔴          | 🔴       | 🔴         | 🔴             |
| Logic Depth           | 🔴          | 🔴       | 🔴         | 🔴             |
| LUT Count             | 🔴          | 🔴       | 🔴         | 🔴             |
| Area (µm²)            | 🔴          | 🔴       | 🔴         | 🔴             |
| Critical Path (ns)    | 🔴          | 🔴       | 🔴         | 🔴             |
| Power (mW)            | 🔴          | 🔴       | 🔴         | 🔴             |

---

## Key Findings — 4-bit

| #  | Finding                                                                     |
|----|-----------------------------------------------------------------------------|
| 1  | Dataflow most area-efficient — 104 cells, 30.7% less than Behavioural       |
| 2  | Dataflow shortest logic depth — 15 gate levels (fastest path)               |
| 3  | Structural least LUTs — 47 (best for FPGA mapping)                          |
| 4  | Structural wire explosion — 161 wires vs 56 in Dataflow                     |
| 5  | Generate+Param deepest path — 17 (ripple carry chain overhead)               |
| 6  | XOR identical at 14 across 3 styles — confirms functional equivalence        |
| 7  | Dataflow least synthesis expansion — 3.6x vs 5.6x Behavioural               |

---

## Key Findings — 8-bit

| #  | Finding                                                                     |
|----|-----------------------------------------------------------------------------|
| 1  | Structural shortest logic depth — 11 (opposite trend vs 4-bit!)             |
| 2  | Structural least LUTs — 88 (best for FPGA again)                            |
| 3  | Dataflow MUX explosion at 8-bit — 58 MUX vs 9 in Behavioural               |
| 4  | XOR identical at 30 in Behavioural and Dataflow — functional equivalence    |
| 5  | Behavioural synthesis expansion increases — 10.4x vs 5.6x at 4-bit          |

---

## Research Paper

| Field    | Detail                                                                              |
|----------|-------------------------------------------------------------------------------------|
| Title    | Comparative Analysis of RTL Coding Styles and Bit-Width Scalability in ALU Design: A PPA Study Using Open-Source Yosys EDA Tool |
| Target   | IEEE VDAT 2026 — JIIT Noida, Aug 20-22                                              |
| Deadline | April 24, 2026                                                                      |
| Authors  | Prateek Kulkarni, Piyush, Dr. Sushmita Dandeliya                                    |

---

## Repository Structure
```
project0-4bit-alu-research/
├── 4bit/
│   ├── alu_behavioral.v
│   ├── alu_dataflow.v
│   ├── alu_structural.v
│   ├── alu_gen_param.v
│   ├── alu_tb.v
│   ├── BehavioralPPA.png
│   ├── DataflowPPA.png
│   ├── StructuralPPA.png
│   └── Gen_ParamPPA.png
├── 8bit/
│   ├── alu_8bit_behavioral.v
│   ├── alu_8bit_dataflow.v
│   ├── alu_8bit_structural.v
│   ├── alu_8bit_gen_param.v     ← Pending
│   └── PPA screenshots
├── 12bit/                        ← Pending
├── ppa_results.md
└── README.md
```

---

## Yosys Script (run for each file)
```bash
read_verilog <filename>.v
hierarchy -check -top ALU_Xbit
proc
stat
opt
techmap
opt
stat
ltp
synth_ice40 -top ALU_Xbit
stat
```

---

## OpenSTA Script (run during holidays)
```bash
read_liberty sky130_fd_sc_hd__tt_025C_1v80.lib
read_verilog <synthesised_netlist>.v
link_design ALU_Xbit
read_sdc alu.sdc
report_checks
report_power
report_design_area
```

---

*Part of vlsi-journey — VLSI Physical Design roadmap*
*github.com/Prateekkulkarni1905/vlsi-journey*
