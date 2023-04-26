#!/bin/bash
#SBATCH --job-name=rfmix
#SBATCH --partition=normal
#SBATCH --mem-per-cpu=50G
#SBATCH -c 10
#SBATCH -t 24:00:00
#SBATCH --array=1-22%10
#SBATCH --output=%A_%a.log
#SBATCH --error=%A_%a.error

rfmix \
-f /cluster/home/pcallen/projects/uab_sle_96/genotyping/local_ancestry_plink/imputed_vcf/chr${SLURM_ARRAY_TASK_ID}_phased_imputed.vcf.gz \
-r /cluster/home/pcallen/projects/uab_sle_96/genotyping/data/vcfs/ancestry_pipeline/beagle_reference/chr${SLURM_ARRAY_TASK_ID}.1kg.phase3.v5a.vcf.gz \
-g /cluster/home/pcallen/projects/uab_sle_96/genotyping/data/vcfs/ancestry_pipeline/rfmix_v2.0/genetic_maps/genetic_map_chr${SLURM_ARRAY_TASK_ID}_combined_b37_formatted.txt \
-m /cluster/home/pcallen/projects/uab_sle_96/genotyping/data/vcfs/ancestry_pipeline/rfmix_v2.0/genetic_maps/1k_samples.map \
-o /cluster/home/pcallen/projects/uab_sle_96/genotyping/local_ancestry_plink/rfmix_output_cluster/chr${SLURM_ARRAY_TASK_ID}.results --chromosome=${SLURM_ARRAY_TASK_ID}
