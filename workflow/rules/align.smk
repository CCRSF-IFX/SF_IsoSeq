rule cluster:
    input:  "results/" + sample + ".flnc.bam"
    output: file1 =  "results/" + sample + ".clustered.hq.fasta.gz", file2 =  "results/" + sample + ".clustered.bam", file3 =  "results/" + sample + ".clustered.cluster_report.csv"
    conda: "envs/isoseq3.yaml" 
    threads: 16
    resources: mem_mb=config['medium']['mem'], runtime=config['medium']['runtime'] #, partition=config['medium']['partition']
    log: "results/logs/" + sample + ".cluster.log"
    shell: "isoseq cluster {input} {output.file2} -j 36 --use-qvs 2>{log}"

rule pbmm2:
    input: "results/" + sample + ".clustered.bam"
    output: "results/" + sample + ".mapped.bam"
    params: config['ref']
    conda: "envs/pbmm2.yaml"
    threads: 16
    resources: mem_mb=config['medium']['mem'], runtime=config['medium']['runtime'] #, partition=config['medium']['partition']
    log: "results/logs/" + sample + ".pbmm2.log"
    shell: "pbmm2 align --preset ISOSEQ --sort -j {threads} {input} {params} > {output} 2>{log}"


rule collapse:
    input: "results/" + sample + ".mapped.bam"
    output: gff = "results/" + sample + ".collapsed.gff" , flnc = "results/" + sample + ".collapsed.flnc_count.txt",  group = "results/" + sample + ".collapsed.group.txt", fasta = "results/" + sample + ".collapsed.fasta"
    conda: "envs/isoseq3.yaml"
    threads: 16
    resources: mem_mb=config['medium']['mem'], runtime=config['medium']['runtime'] #, partition=config['medium']['partition']
    log: "results/logs/"  + sample + ".collapse.log"
    shell:"isoseq collapse --do-not-collapse-extra-5exons -j {threads} {input} {output.gff} 2>{log}"


rule prepare:
    input: "results/" + sample + ".collapsed.gff"
    output: "results/" + sample + ".collapsed.sorted.gff"
    conda: "envs/pigeon.yaml"
    threads: 16
    resources: mem_mb=config['medium']['mem'], runtime=config['medium']['runtime'] #, partition=config['medium']['partition']
    log: "results/logs/"  + sample + ".collapse.log"
    shell: "pigeon prepare {input} 2>{log}"
