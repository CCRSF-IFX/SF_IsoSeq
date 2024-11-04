from snakemake.utils import validate
import pandas as pd
import os
import glob

# this container defines the underlying OS for each job when using the workflow
# with --use-conda --use-singularity
#singularity: "docker://continuumio/miniconda3"

##### load config and sample sheets #####

configfile: "config/config.yaml"
#validate(config, schema="../schemas/config.schema.yaml")

#validate(samplepd, schema="../schemas/samples.schema.yaml")

analysisdir = config['analysis']
rawdir = config['unaligned']
sample = config['sample']
primers = config['Iso-Seq_cDNA_Primer']

#sample =  [os.path.basename(file).split('.')[0] for file in glob.glob(rawdir + '/*')][0]


os.chdir(analysisdir)
print (os.getcwd())
print (rawdir)
print (sample)

