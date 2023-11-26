#!/usr/bin/bash -l
#SBATCH -p short -c 48 --mem 64gb --out logs/01_genome_download.log

module load ncbi_datasets
module load workspace/scratch

FOLDER=download
METADATA_FILE=lib/metadata.tsv

CPU=8
if [ $SLURM_CPUS_ON_NODE ]; then
  CPU=$SLURM_CPUS_ON_NODE
fi

mkdir -p $FOLDER

IFS=$'\t'
tail -n +2 $METADATA_FILE | while read ASSEMBLY ACCESSION ORGANISM_NAME _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
do
  # Replace spaces with underscores in variables
  SANITIZED_ASSEMBLY=$(echo "$ASSEMBLY" | tr ' ' '_')
  SANITIZED_ORGANISM_NAME=$(echo "$ORGANISM_NAME" | tr ' ' '_')

  # Construct sanitized file paths
  GENOMIC_FILE="ncbi_dataset/ncbi_dataset/data/$SANITIZED_ASSEMBLY/${SANITIZED_ASSEMBLY}_${ACCESSION}_genomic.fna"
  TARGET_FILE="$FOLDER/${SANITIZED_ORGANISM_NAME}_${SANITIZED_ASSEMBLY}.fasta"

  if [ ! -s "$TARGET_FILE" ]; then
    datasets download genome accession $ASSEMBLY --include genome
    unzip -o -d ncbi_dataset ncbi_dataset.zip
    # Move the file without quotes
    mv "$GENOMIC_FILE" "$TARGET_FILE"
  fi
done
