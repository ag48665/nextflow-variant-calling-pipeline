nextflow.enable.dsl=2

params.reads = "data/*.fastq.gz"
params.reference = "reference/ref_genome.fa"

process FASTQC {

    container 'biocontainers/fastqc:v0.11.9_cv8'

    input:
    path reads

    output:
    path "*.html"

    script:
    """
    fastqc $reads
    """
}

process ALIGN {

    container 'biocontainers/bwa:v0.7.17_cv1'

    input:
    path reads
    path reference

    output:
    path "aligned.sam"

    script:
    """
    bwa index $reference
    bwa mem $reference $reads > aligned.sam
    """
}

process SORT_BAM {

    container 'quay.io/biocontainers/samtools:1.20--h50ea8bc_1'

    input:
    path sam

    output:
    path "sorted.bam"

    script:
    """
    samtools view -Sb $sam | samtools sort -o sorted.bam
    """
}

workflow {

    Channel
        .fromPath(params.reads)
        .set { reads_ch }

    Channel
        .fromPath(params.reference)
        .set { ref_ch }

    FASTQC(reads_ch)

    ALIGN(reads_ch, ref_ch)

    SORT_BAM(ALIGN.out)
}

