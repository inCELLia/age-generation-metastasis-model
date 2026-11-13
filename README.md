# Age- and Generation-Based Metastatic Cancer Model — MATLAB Code

MATLAB implementation accompanying:

**Age and generation-based model of metastatic cancer: From micrometastases to macrometastases**  
Panagiotis Gavriliadis, Georgios Lolas, and Themis Matsoukas.  
*Journal of Theoretical Biology* **623** (2026), 112392. [https://doi.org/10.1016/j.jtbi.2026.112392](https://doi.org/10.1016/j.jtbi.2026.112392).

## Run

Open the repository folder in MATLAB and run `MAIN`


All model constants and numerical settings are defined at the beginning of `MAIN.m`. The script computes the distributions and moments, generates the figures listed below, and saves PDF output in the `results/` directory (created automatically if needed).



## Figures

| Paper figure | Script | Output |
|---|---|---|
| 4: generation size distributions | `Figure4.m` | `results/Figure_4.pdf` |
| 5: generation and cumulative counts | `Figure5.m` | `results/Figure_5.pdf` |
| 6: size histograms and detection threshold | `Figure6.m` | `results/Figure_6.pdf` |
| 7: mean tumor size | `Figure7.m` | `results/Figure_7.pdf` |
| 8a: recursive and IKS distributions | `Figure8.m` | `results/Figure_8.pdf` |

## Methods

Recursive distributions: Eqs. (13), (19), (20). Counts and mean size: Eqs. (34)–(37). IKS: Appendix C, Algorithm (1)–(6), using Eq. (C.4) for propagation. Refer to the paper for the mathematical formulation and assumptions.

## Citation

If you use this software in academic work, please cite the publication above.

## License

Copyright © 2026 inCELLia.

This software is licensed under the **GNU General Public License, version 3 or (at your option) any later version** (**GPL-3.0-or-later**). You may use, modify, and redistribute it, including for commercial purposes, subject to the GPL's terms and conditions.

See the [`LICENSE`](LICENSE) file for the complete licence text.

**SPDX-License-Identifier:** `GPL-3.0-or-later`

