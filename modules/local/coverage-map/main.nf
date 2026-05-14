process COVERAGE_MAP {
    label 'process_medium'

    container "${ workflow.containerEngine == 'singularity' ?
        'docker://cauldron/coverage-map:1.0.0' :
        'cauldron/coverage-map:1.0.0' }"

    input:
    path input_file
    val sequence_column
    val index_column
    val uniprot_acc_column
    val value_columns
    path fasta_file

    output:
    
    path "coverage.txt", emit: coverage_txt, optional: true
    path "uniprot_data.txt", emit: uniprot_data_txt, optional: true
    path "versions.yml", emit: versions

    script:
    def args = task.ext.args ?: ''
    """
    # Build arguments dynamically to match CauldronGO PluginExecutor logic
    ARG_LIST=()

    
    # Mapping for input_file
    VAL="$input_file"
    if [ -n "\$VAL" ] && [ "\$VAL" != "null" ] && [ "\$VAL" != "[]" ]; then
        ARG_LIST+=("--input_file" "\$VAL")
    fi
    
    # Mapping for sequence_column
    VAL="$sequence_column"
    if [ -n "\$VAL" ] && [ "\$VAL" != "null" ] && [ "\$VAL" != "[]" ]; then
        ARG_LIST+=("--sequence_column" "\$VAL")
    fi
    
    # Mapping for index_column
    VAL="$index_column"
    if [ -n "\$VAL" ] && [ "\$VAL" != "null" ] && [ "\$VAL" != "[]" ]; then
        ARG_LIST+=("--index_column" "\$VAL")
    fi
    
    # Mapping for uniprot_acc_column
    VAL="$uniprot_acc_column"
    if [ -n "\$VAL" ] && [ "\$VAL" != "null" ] && [ "\$VAL" != "[]" ]; then
        ARG_LIST+=("--uniprot_acc_column" "\$VAL")
    fi
    
    # Mapping for value_columns
    VAL="$value_columns"
    if [ -n "\$VAL" ] && [ "\$VAL" != "null" ] && [ "\$VAL" != "[]" ]; then
        ARG_LIST+=("--value_columns" "\$VAL")
    fi
    
    # Mapping for fasta_file
    VAL="$fasta_file"
    if [ -n "\$VAL" ] && [ "\$VAL" != "null" ] && [ "\$VAL" != "[]" ]; then
        ARG_LIST+=("--fasta_file" "\$VAL")
    fi
    
    python /app/get_coverage.py \
        "\${ARG_LIST[@]}" \
        --output_folder . \
        \${args:-}

    cat <<-END_VERSIONS > versions.yml
    "${task.process}":
        Protein Coverage Map: 1.0.0
    END_VERSIONS
    """
}
