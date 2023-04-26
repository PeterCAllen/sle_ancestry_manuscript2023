#!/bin/bash
#SBATCH --job-name=admixture
#SBATCH --partition=normal
#SBATCH --mem-per-cpu=50G
#SBATCH -c 10
#SBATCH -t 24:00:00
#SBATCH --array=1-96%10
#SBATCH --output=admixture_logs/admixture_%A_%a.out

echo "SLURM_JOBID: " $SLURM_JOBID
echo "SLURM_ARRAY_TASK_ID: " $SLURM_ARRAY_TASK_ID
echo "SLURM_ARRAY_JOB_ID: " $SLURM_ARRAY_JOB_ID

readarray -t samples < samples.list
sample=${samples[${SLURM_ARRAY_TASK_ID}]}

echo "\nProcessing sample: " $sample

python /cluster/home/pcallen/software/ancestrypipe/vcf_ancestry.py /cluster/home/pcallen/projects/uab_sle_96/genotyping/local_ancestry_plink/plink_vcf_per_sample/${sample}.vcf.gz /cluster/home/pcallen/projects/uab_sle_96/genotyping/local_ancestry_plink/admixture_output $sample 19
