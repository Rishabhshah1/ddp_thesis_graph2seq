#!/bin/bash
#!/bin/bash
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

MODEL=g2s_series_rel

EXP_NO=2
DATASET=USPTO_480k
CHECKPOINT=./checkpoints/USPTO_480k_g2s_series_rel_smiles_smiles.1/
FIRST_STEP=40000
LAST_STEP=50000

BS=30
T=1.0
NBEST=30
MPN_TYPE=dgat


REPR_START=smiles
REPR_END=smiles

PREFIX=${DATASET}_${MODEL}_${REPR_START}_${REPR_END}

python /scratch/scratch1/rishabh/Graph2SMILES/validate.py \
  --model="$MODEL" \
  --data_name="$DATASET" \
  --valid_bin="./preprocessed/$PREFIX/val_0.npz" \
  --val_tgt="./data/$DATASET/tgt-val.txt" \
  --result_file="./results/$PREFIX.$EXP_NO.result.txt" \
  --log_file="$PREFIX.validate.$EXP_NO.log" \
  --load_from="$CHECKPOINT" \
  --checkpoint_step_start="$FIRST_STEP" \
  --checkpoint_step_end="$LAST_STEP" \
  --mpn_type="$MPN_TYPE" \
  --rel_pos="$REL_POS" \
  --seed=42 \
  --batch_type=tokens \
  --predict_batch_size=4096 \
  --beam_size="$BS" \
  --n_best="$NBEST" \
  --temperature="$T" \
  --predict_min_len=1 \
  --predict_max_len=512 \
  --log_iter=100
