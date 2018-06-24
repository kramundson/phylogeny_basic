shell.executable("/bin/bash")

IDS, = glob_wildcards("seqs/{id}.fasta")

rule all:
    input: "RAxML_info.tree.nwk", "RAxML_bootstrap.tree.nwk"
    
rule muscle:
    input: expand("seqs/{sample}.fasta", sample=IDS)
    output: "seqs.afa"
    threads: 12
    params: "-maxiters 1 -diags1"
    conda: "envs/pliny"
    log: "log/muscle.log"
    shell: """
        cat {input} > tmp_all.fasta ;
        muscle -in tmp_all.fasta -out {output} {params} ;
        rm tmp_all.fasta
    """

rule raxml:
    input: "seqs.afa"
    output: "RAxML_info.tree.nwk", "RAxML_bootstrap.tree.nwk"
    threads: 12
    params: 
        line="-m PROTGAMMAWAG -p 155 -b 155 -# 10",
        suffix="tree.nwk"
    conda: "envs/pliny"
    log: "log/raxml.log"
    shell: "raxmlHPC -s {input} -n {params.suffix} {params.line} -T {threads}"
    
