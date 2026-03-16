# 4-bit ALU — Yosys PPA Results

**Tool:** Yosys OSS CAD Suite
**Design:** 4-bit ALU — 8 operations
**Author:** Prateek Kulkarni | IIIT Nagpur | March 2026

---

## Raw PPA Data

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

## Area Comparison

| Comparison                      | Cell Difference | Reduction |
|---------------------------------|-----------------|-----------|
| Dataflow vs Behavioural         | 150 → 104       | 30.7%     |
| Dataflow vs Structural          | 130 → 104       | 13.3%     |
| Structural vs Behavioural       | 150 → 130       | 13.3%     |

---

## Wire Complexity Comparison

| Comparison                      | Wire Difference | Change     |
|---------------------------------|-----------------|------------|
| Dataflow vs Behavioural         | 65 → 56         | 13.8% less |
| Structural vs Dataflow          | 56 → 161        | 187% more  |
| Structural vs Behavioural       | 65 → 161        | 147% more  |

---

## Gate-Level Observations

### Behavioural (case() style)
- Heavy AND-OR tree — 47 AND + 65 OR gates
- Synthesiser expands case() into large combinational logic
- 5 MUX cells only — minimal multiplexer mapping

### Dataflow (conditional operators)
- Most efficient — 104 total cells
- Synthesiser maps conditional operators directly to MUX structures (30 MUX)
- Lowest wire count — 56 wires, 129 wire bits
- AND reduced to 18, OR reduced to 31

### Structural (gate primitives)
- Wire explosion — 161 wires, 305 wire bits, 127 public wires
- Structural flattening causes massive interconnect overhead
- Cell count 130 — between Behavioural and Dataflow
- 30 MUX cells — same as Dataflow despite gate-level description

---

## Functional Equivalence Proof

| Check                        | Result |
|------------------------------|--------|
| XOR count across all 3       | 14 — identical ✓ |
| All 8 operations verified    | Pass on EDA Playground ✓ |
| Testbench simulation         | All outputs match ✓ |

---

## Conclusion

Dataflow RTL style is optimal for this ALU design —
30.7% area reduction over Behavioural with identical
functional output. Structural style should be avoided
for complex combinational designs due to wire explosion.

---

*github.com/Prateekkulkarni1905/vlsi-journey/tree/main/project0-4bit-alu-research*
