# Protein Coverage Map


## Installation

**[⬇️ Click here to install in Cauldron](http://localhost:50060/install?repo=https%3A%2F%2Fgithub.com%2Fnoatgnu%2Fcoverage-map-plugin)** _(requires Cauldron to be running)_

> **Repository**: `https://github.com/noatgnu/coverage-map-plugin`

**Manual installation:**

1. Open Cauldron
2. Go to **Plugins** → **Install from Repository**
3. Paste: `https://github.com/noatgnu/coverage-map-plugin`
4. Click **Install**

**ID**: `coverage-map`  
**Version**: 1.0.0  
**Category**: utilities  
**Author**: CauldronGO Team

## Description

Generate protein coverage maps from peptide data with intensity values

## Runtime

- **Environments**: `python`

- **Entrypoint**: `get_coverage.py`

## Inputs

| Name | Label | Type | Required | Default | Visibility |
|------|-------|------|----------|---------|------------|
| `input_file` | Input File | file | Yes | - | Always visible |
| `sequence_column` | Peptide Sequence Column | column-selector (single) | Yes | - | Always visible |
| `index_column` | Index Column | column-selector (single) | Yes | - | Always visible |
| `uniprot_acc_column` | UniProt Accession Column | column-selector (single) | Yes | - | Always visible |
| `value_columns` | Intensity/Value Columns | column-selector (multiple) | Yes | - | Always visible |
| `fasta_file` | FASTA File (Optional) | file | No | - | Always visible |

### Input Details

#### Input File (`input_file`)

Tab-separated or CSV file containing peptide data with intensity values


#### Peptide Sequence Column (`sequence_column`)

Column containing peptide sequences

- **Column Source**: `input_file`

#### Index Column (`index_column`)

Column to use as peptide identifier/index

- **Column Source**: `input_file`

#### UniProt Accession Column (`uniprot_acc_column`)

Column containing UniProt accession IDs

- **Column Source**: `input_file`

#### Intensity/Value Columns (`value_columns`)

Columns containing intensity or abundance values

- **Column Source**: `input_file`

#### FASTA File (Optional) (`fasta_file`)

Optional FASTA file with protein sequences. If not provided, sequences will be fetched from UniProt.


## Outputs

| Name | File | Type | Format | Description |
|------|------|------|--------|-------------|
| `coverage.txt` | `coverage.txt` | data | tsv | Tab-separated file with coverage map data |
| `uniprot_data.txt` | `uniprot_data.txt` | data | tsv | UniProt sequence data used for mapping |

## Requirements

- **Python Version**: >=3.10

### Python Dependencies (External File)

Dependencies are defined in: `requirements.txt`

- `pandas>=2.0.0`
- `click>=8.0.0`
- `uniprotparser>=1.0.0`
- `numpy>=1.24.0`

> **Note**: When you create a custom environment for this plugin, these dependencies will be automatically installed.

## Usage

### Via UI

1. Navigate to **utilities** → **Protein Coverage Map**
2. Fill in the required inputs
3. Click **Run Analysis**

### Via Plugin System

```typescript
const jobId = await pluginService.executePlugin('coverage-map', {
  // Add parameters here
});
```
