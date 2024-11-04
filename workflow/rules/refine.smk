
rule lima:
    input: "results/" + sample + ".hifi.bam"
    output: "results/" + sample + ".IsoSeq_5p--IsoSeq_3p.bam", "results/" + sample + ".lima.clips"
    params: prefix = "results/" + sample + ".bam"
    conda: "envs/lima.yaml"
    threads: 16
    resources: mem_mb=config['medium']['mem'], runtime=config['medium']['runtime'] #, partition=config['medium']['partition']
    log: "results/logs/" + sample + ".lima.log"
    shell: "lima --per-read --num-threads {threads} --isoseq --log-level INFO --log-file {log} {input} {primers} {params.prefix}"


rule refine:
    input: "results/" + sample + ".IsoSeq_5p--IsoSeq_3p.bam"
    output: "results/" + sample + ".flnc.bam"
    conda: "envs/isoseq3.yaml"
    threads: 16
    resources: mem_mb=config['medium']['mem'], runtime=config['medium']['runtime'] #, partition=config['medium']['partition']
    log: "results/logs/" + sample + ".refine.log"
    shell: "isoseq3 refine --require-polya {input} {primers} {output} -j {threads} 2>{log}"
