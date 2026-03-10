# Day 2 Notes — 10 March 2026

## Async Reset DFF
- q reset at exact timestamp rst went high — no clock edge needed
- Sync:  always @(posedge clk)
- Async: always @(posedge clk or posedge rst)
- Verified in EPWave waveform — immediate reset confirmed

## Accidental Latch
- Occurs when output is unassigned in some branch of combinational always block
- Fix: assign default values at top of always block before if/case

## HDLBits Problems 29–43 completed
- always_case2 was hardest — casez with ? don't care syntax
- dff8p caught me — active low means if (!rst) not if (rst)
