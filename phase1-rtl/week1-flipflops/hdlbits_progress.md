# HDLBits Progress — Week 1
Started: 9 March 2026

## Getting Started + Basic Gates ✅
step_one, zero, wire, wire4, notgate, andgate, norgate, xnorgate, wire_decl, 7458

## Vectors ✅
vector0, vector1, vector2, vectorgates, gates4, vector3, vectorr, vector4, vector5

## Modules ✅
module, module_pos, module_name, module_shift, module_shift8
module_add, module_fadd, module_cseladd, module_addsub

## Key Lesson — Day 1
Width mismatch in bitwise ops: always replicate single-bit signals.
Wrong:   b ^ sub
Correct: b ^ {8{sub}}
This same pattern used in 32-bit ALU: b ^ {32{sub}}

## Sequential Logic — Starting Day 2 (March 10)
- Dff          — pending
- Dff8         — pending
- Dff8r        — pending
- Dff8p        — pending
- Dff8ar       — pending
- Dffsr        — pending
