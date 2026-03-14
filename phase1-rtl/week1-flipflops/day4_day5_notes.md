# Day 4+5 Notes — March 13, 2026

## Topics Covered
- SIPO Shift Register
- 4-bit Up Counter
- 4-bit Up-Down Counter
- Mod-6 Counter
- Moore FSM — 1011 Sequence Detector

## Key Lessons

### Testbench Timing
- Clock period = 10ps (#5 toggle)
- #10 = exactly 1 clock cycle
- Shift register needs #10 per bit — same bit sent twice if #20
- Counter needs minimum #160 to see full 0→15→0 rollover
- Rule: simulation time must cover all possible states

### Counters
- Ripple counter uses T flip-flops — each FF clocked by previous output
- Synchronous counter uses D flip-flops — all share same clock
- Ripple has propagation delay — timing violations at high frequency
- Industry always uses synchronous counters
- Mod-N counter needs ⌈log₂(N)⌉ bits only — bit width optimisation

### Verilog Rules
- `or` is gate primitive — use `||` for logical OR in if conditions
- Default values at top of always block prevent latch inference

### Moore FSM
- Two always blocks mandatory — sequential + combinational
- Sequential block: state register only, uses <=
- Combinational block: next_state + output, uses =
- Output in sequential block = 1 cycle delay — WRONG
- Output in combinational block = same cycle as state — CORRECT
- S1+input=1 → stay S1 (overlap handling)
- S3+input=0 → go S2 (partial overlap — do not waste progress)

## Files Committed
- sipo_shiftreg.v + tb
- up_counter_4bit.v + tb
- updown_counter.v + tb
- mod6_counter.v + tb
- moore_1011.v + tb
