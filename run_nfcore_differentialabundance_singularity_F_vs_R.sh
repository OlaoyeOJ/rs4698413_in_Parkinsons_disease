#!/usr/bin/env bash
set -euo pipefail

# run_nfcore_differentialabundance_singularity.sh
# Purpose: Run nf-core/differentialabundance on RNA-seq gene counts (e.g., nf-core/rnaseq STAR+Salmon outputs)
# Requirements: Nextflow + Singularity/Apptainer

# --------------------------
# Singularity cache settings
# --------------------------
export NXF_SINGULARITY_CACHEDIR="/dev/shm/<user>/singularity_cache"
export SINGULARITY_TMPDIR="/dev/shm/<user>/singularity_tmp"

# --------------------------
# User-editable paths
# --------------------------
OUTDIR="/path/to/results/differentialabundance"
SAMPLESHEET="/path/to/samplesheet.csv"
CONTRASTS="/path/to/contrasts.csv"
COUNT_MATRIX="/path/to/star_salmon/salmon.merged.gene_counts.tsv"
LENGTH_MATRIX="/path/to/star_salmon/salmon.merged.gene_lengths.tsv"
GTF="/path/to/reference/Homo_sapiens.GRCh38.111.gtf.gz"
WORKDIR="/path/to/nextflow_workdir"

# --------------------------
# Run nf-core/differentialabundance
# --------------------------
nextflow run nf-core/differentialabundance \
  -profile rnaseq,singularity \
  --outdir "${OUTDIR}" \
  --input "${SAMPLESHEET}" \
  --contrasts "${CONTRASTS}" \
  --matrix "${COUNT_MATRIX}" \
  --transcript_length_matrix "${LENGTH_MATRIX}" \
  --gtf "${GTF}" \
  -w "${WORKDIR}"
