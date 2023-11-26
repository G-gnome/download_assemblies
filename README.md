# NCBI Assembly Downloader and Renamer

## Overview

This script facilitates the download of NCBI assemblies based on a metadata file obtained from [NCBI Datasets](https://www.ncbi.nlm.nih.gov/datasets/genome/?taxon=1851509). The metadata file in lib is for Naganishia specifically, but you can use any you choose. The downloaded files are then renamed using the assembly and species names, and a `.fasta` extension is appended.

## Dependencies
1. **NCBI Datasets**

## Usage

1. **Metadata File:**
   - Ensure you have the metadata file downloaded from [NCBI Datasets](https://www.ncbi.nlm.nih.gov/datasets/genome/?taxon=1851509) and stored in lib.

2. **Run the Script:**
   - Execute the script 01_genome_dowload.sh to download and rename the assemblies. The output will be stored in download as FASTA files. You may want to use 02_cleanup.sh to cleanup afterwards.

## Acknowlodegements

Thank you to [Jason Stajich](https://github.com/hyphaltip) for the template for this code. Thank you to OpenAI chatGPT for helping refine the code. 
