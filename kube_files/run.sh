### Note: all paths referenced here are relative to the Docker container.
#
# Add the Nvidia drivers to the path
export PATH="/usr/local/nvidia/bin:$PATH"
export LD_LIBRARY_PATH="/usr/local/nvidia/lib:$LD_LIBRARY_PATH"
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/tools/cuda/lib64
export TRANSFORMERS_CACHE="/scratch/scratch1/rishabh/graph2smiles/cache"
# Tools config for CUDA, Anaconda installed in the common /tools directory
source /tools/config.sh
# Activate your environment
source activate /scratch/scratch1/rishabh/envs/graph2smiles
# Change to the directory in which your code is present
cd /scratch/scratch1/rishabh/Graph2SMILES
# Run the code. The -u option is used here to use unbuffered writes
# so that output is piped to the file as and when it is produced.
# Here, the code is a simple Pytorch script to check if we are using the GPU.
# ls /scratch/scratch4
# df -h
# python -u t5_implementation.py &> /scratch/scratch1/rishabh/T5/out
# t5chem train --data_dir data/USPTO_MIT/MIT_mixed/ --output_dir model_mit_complete/ --task_type product --pretrain models/pretrain/simple/ --num_epoch 30