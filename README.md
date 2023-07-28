# GENOME-WIDE DNA METHYLATION ANALYSIS IMPLICATES ENRICHMENT OF INTERFERON PATHWAY IN AFRICAN AMERICAN PATIENTS WITH SYSTEMIC LUPUS ERYTHEMATOSUS AND EUROPEAN AMERICANS WITH LUPUS NEPHRITIS

This repository contains scripts for analyzing MethylationEPIC and Global Diversity Array data as performed in our publication (2023) (DOI: 10.1016/j.jaut.2023.103089). The scripts are written in bash and R.

## Overview
The repository includes the following scripts:

`Methylation_Analysis.qmd`: This script performs preprocessing steps on the raw MethylationEPIC data, including quality control, normalization, and batch correction. Differential methylation analysis was performed using linear regression models to identify the top SLE-associated CpGs while adjusting for covariates such as age, genetic principal components, and cellular heterogeneity. An interferon methylation score was calculated using CpGs that were significantly associated with SLE and are differentially methylated ≥ 10% between cases and controls. Methylation-specific qPCR data was generated to validate the methylation status at MX1, USP18, and IFITM1 found in the methylationEPIC data. Local ancestry analyses were performed and integrated with the methylation data to identify ancestry-specific methylation differences.

`local_ancestry_analysis.qmd`: This script was used to preprocess genotyping data generated from GDA arrays. Preprocessing was performed using PLINK. After preprocessing, local ancestry was estimated for each individual using RFMix with the reference being 1000 Genomes Phase 3. Global ancestry was calculated using ADMIXTURE. The outputs from this script were used in `Methylation_Analysis.qmd`.

## Requirements
For all the dependencies necessary to reproduce our results, see `uab_sle_methylation.yml`.

## Contact
If you have any questions or suggestions, please contact me through GitHub.

## References

**1000 Genomes Phase 3**: Fairley S, Lowy-Gallego E, Perry E, Flicek P (2020) The International Genome Sample Resource (IGSR) collection of open human genomic variation resources. Nucleic Acids Research 48:D941–D947

**ADMIXTURE**: Alexander DH, Novembre J, Lange K (2009) Fast model-based estimation of ancestry in unrelated individuals. Genome Res 19:1655–1664

**PLINK**: Weeks JP (2010) plink: An R package for linking mixed-format tests using IRT-Based methods. Journal of Statistical Software 35:1–33

**RFMix**: Maples BK, Gravel S, Kenny EE, Bustamante CD (2013) RFMix: A Discriminative Modeling Approach for Rapid and Robust Local-Ancestry Inference. The American Journal of Human Genetics 93:278–288
