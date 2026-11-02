# Age- and Generation-Based Metastatic Cancer Model — MATLAB Code

MATLAB implementation of the age- and generation-based metastatic cancer model described in:

**Age and generation-based model of metastatic cancer: From micrometastases to macrometastases**  
Panagiotis Gavriliadis, Georgios Lolas and Themis Matsoukas.  
*Journal of Theoretical Biology*, 623 (2026), 112392.  
https://doi.org/10.1016/j.jtbi.2026.112392

## Run

Open this folder in MATLAB and run `MAIN`.

All constants and numerical settings are defined at the beginning of `MAIN.m`.

## Figures

| Paper figure | Script | Output |
|---|---|---|
| 4: Generation size distributions | `Figure4.m` | `results/Figure_4.pdf` |
| 5: Generation and cumulative counts | `Figure5.m` | `results/Figure_5.pdf` |
| 6: Size histograms and detection threshold | `Figure6.m` | `results/Figure_6.pdf` |
| 7: Mean tumor size | `Figure7.m` | `results/Figure_7.pdf` |
| 8a: Recursive and IKS distributions | `Figure8.m` | `results/Figure_8.pdf` |

## Methods

Recursive distributions: Eqs. (13), (19), (20). Counts and mean size: Eqs. (34)–(37). IKS: Appendix C, Algorithm (1)–(6), using Eq. (C.4) for propagation.

## License

Copyright © 2026 inCELLia. All rights reserved.

This software is provided under the **inCELLia Academic and Non-Commercial Research Use Software License and Terms of Use**.

Use is restricted to authorized internal, non-commercial academic research. Redistribution and commercial use require prior written authorization from inCELLia.

See the `LICENSE` file for the complete terms.

**Commercial licensing inquiries:** info@incellia.com
