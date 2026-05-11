# Variant Calling Pipeline

Bioinformatics variant calling workflow built with Nextflow and Docker.

## Features

- FASTQ quality control
- FastQC analysis
- Dockerized execution
- Reproducible bioinformatics workflow
- Linux/WSL2 integration

## Technologies

- Nextflow
- Docker
- FastQC
- Linux
- WSL2
- Bioinformatics

## Pipeline

FASTQ → FastQC → Alignment → Variant Calling → VCF

## Run pipeline

```bash
nextflow run main.nf --with-docker


```md id="o4y7r7"
## Future improvements

- BWA alignment
- samtools processing
- bcftools variant calling
- automated reports

## Author

Agata Gabara
