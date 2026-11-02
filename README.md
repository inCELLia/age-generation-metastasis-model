# age-generation-metastasis-model
MATLAB implementation of the age- and generation-based metastatic cancer model in:

**Age and generation-based model of metastatic cancer: From micrometastases to macrometastases**  
Panagiotis Gavriliadis, Georgios Lolas and Themis Matsoukas.  
*Journal of Theoretical Biology* 623 (2026), 112392. [DOI](https://doi.org/10.1016/j.jtbi.2026.112392).


## Run

Open this folder in MATLAB and run `MAIN`. 
All constants and numerical settings are at the beginning of `MAIN.m`. 


## Figures

| Paper figure | Script | Output |
|---|---|---|
| 4: generation size distributions | `Figure4.m` | `results/Figure_4.pdf` |
| 5: generation and cumulative counts | `Figure5.m` | `results/Figure_5.pdf` |
| 6: size histograms and detection threshold | `Figure6.m` | `results/Figure_6.pdf` |
| 7: mean tumor size | `Figure7.m` | `results/Figure_7.pdf` |
| 8a: recursive and IKS distributions | `Figure8.m` | `results/Figure_8.pdf` |


## Methods

Recursive distributions: Eqs. (13), (19), (20). Counts and mean size: Eqs. (34)-(37). IKS: Appendix C, Algorithm (1)-(6), using Eq. (C.4) for propagation.

