#!/bin/bash -ue
bwa index ref_genome.fa
bwa mem ref_genome.fa sample.fastq.gz > aligned.sam
