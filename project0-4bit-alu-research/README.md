# Project 0 — 4-bit ALU: RTL Style Comparison + Yosys PPA Analysis

**Author:** Prateek Kulkarni | 2nd Year ECE | IIIT Nagpur
**Date:** March 2026
**Tools:** Verilog · Yosys OSS CAD Suite · EDA Playground · GitHub

---

## Objective

Compare three RTL coding styles for a 4-bit ALU design and analyse
the impact on PPA (Power, Performance, Area) metrics using
open-source Yosys synthesis tool.

---

## ALU Operations (8 total)

| Opcode | Operation   |
|--------|-------------|
| 000    | Addition    |
| 001    | Subtraction |
| 010    | AND         |
| 011    | OR          |
| 100    | XOR         |
| 101    | Left Shift  |
| 110    | Right Shift |
| 111    | Compare     |

---

## 3 RTL Implementations

| File                 | Style        | Description                          |
|----------------------|--------------|--------------------------------------|
| `alu_behavioural.v`  | Behavioural  | case() based opcode selection        |
| `alu_dataflow.v`     | Dataflow     | Conditional/ternary operators        |
| `alu_structural.v`   | Structural   | Gate primitives, full adder instances|
| `tb.v`           | Testbench    | Verifies all 3 implementations       |

---

## Yosys PPA Results

| Metric           | Behavioural | Dataflow | Structural |
|------------------|-------------|----------|------------|
| Total Cells      | 150         | 104      | 130        |
| $_AND_           | 47          | 18       | 23         |
| $_MUX_           | 5           | 30       | 30         |
| $_NOT_           | 19          | 11       | 13         |
| $_OR_            | 65          | 31       | 33         |
| $_XOR_           | 14          | 14       | 14         |
| Total Wires      | 65          | 56       | 161        |
| Wire Bits        | 198         | 129      | 305        |
| Public Wires     | 6           | 8        | 127        |
| Public Wire Bits | 17          | 27       | 246        |

---

## Key Findings

- **Dataflow is most area-efficient** — 104 cells, lowest wire count (56)
- **Dataflow vs Behavioural** — 30.7% fewer cells with identical output
- **Dataflow vs Structural** — 13.3% fewer cells
- **Behavioural** generates heavy AND-OR tree — 47 AND + 65 OR gates
- **Structural flattening** explodes wire count to 161 vs 56 (Dataflow)
- **XOR count identical at 14** across all 3 styles — confirms functional equivalence
- **MUX usage** — Dataflow and Structural both use 30 MUX cells showing
  conditional logic maps efficiently to multiplexers

---

## How to Run

### Simulate (EDA Playground)
1. Upload `alu_behavioural.v` + `alu_tb.v`
2. Select Icarus Verilog 0.9.7
3. Run and verify EPWave output

### Synthesise (Yosys)
```bash
yosys synth_behavioural.ys
yosys synth_dataflow.ys
yosys synth_structural.ys
```

---

## Files in this Folder
```
project0-4bit-alu-research/
├── alu_behavioural.v
├── alu_dataflow.v
├── alu_structural.v
├── alu_tb.v
├── synth_behavioural.ys
├── synth_dataflow.ys
├── synth_structural.ys
├── ppa_results.md
└── README.md
```

---

## Research Paper

This project is the basis for a research paper targeting
**IEEE VDAT 2026** — RTL-to-Synthesis analysis of 4-bit ALU
coding styles using open-source Yosys EDA tool.

---

*Part of vlsi-journey — VLSI Physical Design roadmap*
*github.com/Prateekkulkarni1905/vlsi-journey*
