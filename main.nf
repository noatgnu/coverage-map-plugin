#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

include { COVERAGE_MAP } from './modules/local/coverage-map/main'

workflow PIPELINE {
    main:
    COVERAGE_MAP (
        params.input_file ? Channel.fromPath(params.input_file).collect() : Channel.of([]),
        Channel.value(params.sequence_column ?: ''),
        Channel.value(params.index_column ?: ''),
        Channel.value(params.uniprot_acc_column ?: ''),
        Channel.value(params.value_columns ?: ''),
        params.fasta_file ? Channel.fromPath(params.fasta_file).collect() : Channel.of([]),
    )
}

workflow {
    PIPELINE ()
}
