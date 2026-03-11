# Day 3 Notes — 11 March 2026

## JK Flip-Flop
- case({j,k}) — 4 conditions: hold, reset, set, toggle
- Toggle: q<=~q when j=1,k=1
- q reacts after one clock cycle — edge triggered, not immediate

## T Flip-Flop
- t=1 → toggle, t=0 → hold
- t=1 permanently = divide-by-2 circuit
- q period = 2x clock period when toggling
- Async reset has highest priority — overrides toggle immediately

## 8-bit Register with Load Enable
- load=1 → q captures d on clock edge
- load=0 → q holds regardless of d changing
- Use q<=8'd0 not q<={8{1'b0}}

## mt2015_muxdff Lesson
- Exam problems show full chain but ask for ONE repeating unit only
- Always read port list first — it defines your scope
- Same pattern used in structural ALU — instantiate one unit, chain them

## Key Insight of the Day
- Clock is always the gatekeeper
- Enable/load signals add conditions ON TOP of clock
- Nothing happens between clock edges regardless of input changes
