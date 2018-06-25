Quick Snakemake pipeline for multiple alignment with tree.

I. Installation

1. Download and install miniconda

```
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh

# install
sh Miniconda3-latest-Linux-x86_64.sh

# review license
# accept license
# accept or change home location
# yes to placing it in your path

source  $HOME/.bashrc
```

2. Clone this repo

```
git clone https://github.com/kramundson/phylogeny_basic
cd phylogeny_basic
```

3. Create environment

```
conda env create -f environment.yaml --name pliny

# activate env
source activate pliny
```

II. Running the workflow

Put all of your FASTA-formatted sequences into the seqs folder, one file per sequence with
a .fasta file extension. There are currently 7 UGT-ish protein sequences in seqs to run
as a test.

To test which commands will be run:

```
snakemake -np
```

To run in on a single node using 12 CPUs:

```
snakemake --cores 12
```

Output multiple alignment, tree info and tree will be in current working directory.
