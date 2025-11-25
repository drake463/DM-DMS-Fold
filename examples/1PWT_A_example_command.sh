#!/bin/bash
#SBATCH --job-name=dmsfold_test_1pwt_A
#SBATCH --time=00:30:00
#SBATCH --nodes=1 --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --gpus-per-node=1
#SBATCH --error=1PWT_A_error.txt
#SBATCH --output=1PWT_A_log.txt

set -vx
module load miniconda3
conda activate openfold

repo_location = '/users/drake463/DMS-Fold/'
cd $repo_location

python3 predict_with_dmsfold.py ./examples/fasta_dir/ ./examples/dms_dir/ /data/openproteinset/mmcif_files/ --openfold_checkpoint_path ./openfold/resources/dmsfold_weights.pt --use_precomputed_alignments ./examples/ --output_dir ./examples/output/ --model_device "cuda:0" --config_preset model_5_ptm