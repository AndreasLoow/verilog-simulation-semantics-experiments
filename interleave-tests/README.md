This directory contains a small-scale systematic experiment on how much current Verilog simulators interleave procedural blocks with other procedural blocks and continuous assignments.

We have tested the following simulators (from [EDA playground](https://www.edaplayground.com) and local installation):

- Aldec Riviera Pro 2023.04
- Cadence Xcelium 23.09
- Mentor Questa 2023.3
- Synopsys VCS 2023.03
- Icarus Verilog 12.0

Additionally, we have used the following older versions of the same simulators and confirmed that they give the same results as the above versions (with one exception, documented in `interleave1_initial.sv`):

- Aldec Riviera Pro 2022.04
- Cadence Xcelium 20.09
- Mentor Questa 2021.3
- Synopsys VCS 2021.09

The key takeaways are as follows -- for more details, see the comments in the Verilog files in this directory:

- In general, the execution of procedural blocks is not interleaved with other procedural blocks or continuous assignments. However, some edge cases exist. E.g., procedural block are sometimes interleaved with simple assignments, both procedural and continuous, by some simulators.

- VCS breaks the above general pattern and seems to sometimes interleave execution of `initial` blocks with continuous assignments. However, other interleavings of VCS seem to follow the general pattern: i.e., `initial` blocks are not interleaved with other procedural blocks (except for edge cases) and the execution of `always`/`always_comb` blocks are not interleaved (except for edge cases).

With that said, it is important to remember that the above takeaways are based only on the tested Verilog modules, and the observations might not hold for other modules. In other words, the observations are the result of reverse-engineering; the only way to know how the simulators work in the general case is to inspect their source code.
