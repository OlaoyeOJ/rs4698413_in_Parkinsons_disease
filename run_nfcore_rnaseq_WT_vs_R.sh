#!/usr/bin/env bash
set -euo pipefail

# run_nfcore_rnaseq_singularity.sh
# Purpose: Run nf-core/rnaseq using Singularity with a custom GRCh38 reference (GTF + FASTA)
# Requires: Nextflow + Singularity/Apptainer

# --------------------------
# Singularity cache settings
# --------------------------
export NXF_SINGULARITY_CACHEDIR="/path/to/singularity_cache"
export SINGULARITY_TMPDIR="/path/to/singularity_tmp"

# --------------------------
# User-editable paths
# --------------------------
SAMPLESHEET="/path/to/samplesheet.csv"
OUTDIR="/path/to/results/rnaseq_output"
GTF="/path/to/reference/Homo_sapiens.GRCh38.111.gtf.gz"
FASTA="/path/to/reference/Homo_sapiens.GRCh38.dna_sm.primary_assembly.fa.gz"
WORKDIR="/path/to/nextflow_workdir"

# --------------------------
# Run nf-core/rnaseq
# --------------------------
nextflow run nf-core/rnaseq \
  -profile singularity \
  --input "${SAMPLESHEET}" \
  --outdir "${OUTDIR}" \
  --gtf "${GTF}" \
  --fasta "${FASTA}" \
  --igenomes_ignore \
  --genome null \
  -w "${WORKDIR}"
