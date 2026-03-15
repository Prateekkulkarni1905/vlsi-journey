# Day 6 Notes — March 14, 2026

## Topics Covered
- 4-bit ALU — 3 implementations
- Behavioural, Dataflow, Structural styles
- Carry flag, Zero flag design

## ALU Specifications
- Inputs: A[3:0], B[3:0], opcode[2:0]
- Outputs: result[3:0], carry, zero
- 8 operations: ADD, SUB, AND, OR, XOR, SLL, SRL, CMP

## Opcode Table
| Opcode | Operation | Notes |
|--------|-----------|-------|
| 3'b000 | ADD | {carry,result} = A+B |
| 3'b001 | SUB | {carry,result} = A-B |
| 3'b010 | AND | bitwise |
| 3'b011 | OR  | bitwise |
| 3'b100 | XOR | bitwise |
| 3'b101 | SLL | A<<1 |
| 3'b110 | SRL | A>>1 |
| 3'b111 | CMP | A==B ? 1 : 0 |

## Implementation Comparison
All 3 implementations produce identical results — verified.

### Behavioural
- always @(*) with case(opcode)
- reg outputs
- Easiest to write and read
- carry=0, zero=0 defaults prevent latch

### Dataflow
- Pure assign statements, ternary chain
- wire outputs — cannot use reg
- 5-bit temp wires capture carry: wire [4:0] temp_add = A+B
- Always evaluating — no clock needed

### Structural
- Gate primitives: and, or, xor, not, xnor
- Submodules: full_adder → ripple_carry_adder → logic functions → mux → ALU
- Subtraction via 2's complement: invert B + cin=1
- Shift = wire routing only — zero gates, zero area
- Compare = XNOR each bit pair + AND all results

## Key Findings for Paper
- Structural shows ripple carry propagation delay in waveform
- Behavioural and dataflow show no delay — abstract operators
- Shift operations cost zero gates — best PPA
- Structural code is 5x longer than behavioural — same function

## Carry and Zero Flags
- carry = separate output, acts as status flag
- zero = 1 when result == 0
- Mirrors real processor status register: [C|Z|N|V]

## Interview Notes
- Ripple carry delay increases with bit width — 32-bit problematic
- Solution: Carry Lookahead Adder (CLA) — precomputes all carries
- Structural style = gate level netlist — what synthesis tool produces

## Personal Note
Writing structural code felt like "welcome to the world of hell" —
scrolling back and forth, placing each gate manually.
But this pain gave permanent understanding of why abstraction exists,
why synthesis tools are valuable, and what really happens at gate level.
More the hard work, better the results.

## Files Committed
- alu_behavioral.v + tb
- alu_dataflow.v + tb  
- alu_structural.v + tb
- day6_notes.md

# 4-bit ALU PPA Results — Yosys Synthesis
Date: March 15, 2026

| Style       | Cell Count | Notes              |
|-------------|------------|--------------------|
| Behavioural | 150        | case(opcode) style |
| Dataflow    | 104        | Lowest — best PPA  |
| Structural  | 130        | Post-flatten       |

Conclusion: Dataflow achieves 30.7% fewer cells than behavioural.
