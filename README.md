# Snakemake workflow: SF_IsoSeq

[![Snakemake](https://img.shields.io/badge/snakemake-≥8-brightgreen.svg)](https://snakemake.bitbucket.io)
[![Build Status](https://travis-ci.org/snakemake-workflows/SF_IsoSeq.svg?branch=master)](https://travis-ci.org/snakemake-workflows/SF_IsoSeq)

PacBio IsoSeq, often referred to as "bulk IsoSeq," is a sequencing approach by Pacific Biosciences (PacBio) that focuses on full-length transcript sequencing using single-molecule, real-time (SMRT) sequencing technology. IsoSeq captures the entire length of RNA molecules without fragmentation, which is particularly valuable for analyzing complex transcriptomes, including splicing events, alternative isoforms, and rare transcripts.


## Authors

* Sulbha Choudhari (@choudharis2)


### Step 1: Obtain a copy of this workflow

1. Create a new github repository using this workflow [as a template](https://help.github.com/en/articles/creating-a-repository-from-a-template).
2. [Clone](https://help.github.com/en/articles/cloning-a-repository) the newly created repository to your local system, into the place where you want to perform the data analysis.

### Step 2: Configure workflow

Configure the workflow according to your needs via editing the files in the config/ folder. Adjust config.yaml to configure the workflow execution.

### Step 3: Install Snakemake

Install Snakemake using [conda](https://conda.io/projects/conda/en/latest/user-guide/install/index.html):

	conda create -c bioconda -c conda-forge -n $NAME snakemake

For installation details, see the [instructions in the Snakemake documentation](https://snakemake.readthedocs.io/en/stable/getting_started/installation.html).

### Step 4: Execute workflow

Activate the conda environment:

    conda activate snakemake

Test your configuration by performing a dry-run via

    snakemake --use-conda -n

Execute the workflow locally via

    snakemake --use-conda --cores $N


### Step 5: Investigate results

After successful execution, you can create a self-contained interactive HTML report with all results via:

    snakemake --report report.html

To access the results, including files, plots and tables, navigate to the results folder.

### References
1:	https://isoseq.how/

2:	https://www.pacb.com/products-and-services/applications/rna-sequencing/


