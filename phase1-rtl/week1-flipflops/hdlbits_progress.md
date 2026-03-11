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

## Procedures (Day 2 — March 10)
- alwaysblock1 ✅, alwaysblock2 ✅
- always_if ✅, always_if2 ✅
- always_case ✅, always_case2 ✅ (5 attempts — casez ? syntax)
- always_casez ✅, always_nolatches ✅
- conditional ✅

## Flip-Flops on HDLBits (Day 2 — March 10)
- dff ✅, dff8 ✅
- dff8r ✅ (synchronous reset)
- dff8p ✅ (active low — if (!rst))
- dff8ar ✅ (async — posedge rst in sensitivity list)
- dff16e ✅ (byte enable)

## Total problems completed: 43

## Key Lessons — Day 2

1. Async vs Sync reset — one line difference changes everything
   Sync:  always @(posedge clk)
   Async: always @(posedge clk or posedge rst)

2. Active-low reset — if (!rst) not if (rst)
   Caught me on dff8p — read problem carefully before coding

3. Accidental latch inference
   Happens when output unassigned in some branch of combinational always block
   Fix: assign default value at TOP of always block before if/case begins
   always_nolatches taught this clearly

4. casez don't care syntax
   4'b1??? — ? means don't care, matches any value in that bit position
   Used in priority encoders — highest priority case listed first

5. Byte enable register (dff16e)
   Only updates specific bytes when enable signal is high
   Direct connection to AXI4-Lite write strobes in Project 2


   ## Exam Style + Shift Registers (Day 3 — March 11)
- exams/m2014_q4a ✅ (4 attempts — exam style)
- exams/m2014_q4d ✅ (100% first try)
- mt2015_muxdff ✅ (17% — misread scope, wrote full chain instead of one unit)
- exams/2014_q4a ✅ (100% first try)
- shift4 ✅ (compile errors on shift syntax)
- rotate100 ✅ (rotation logic)

## Total problems completed: 49 — 100% solved
