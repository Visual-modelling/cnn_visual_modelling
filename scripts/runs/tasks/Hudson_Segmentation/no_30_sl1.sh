#!/bin/bash
#SBATCH --qos short
#SBATCH -N 1
#SBATCH -c 4
#SBATCH -t 2-00:00
#SBATCH -x gpu[0-3]
#SBATCH --mem 12G
#SBATCH -p res-gpu-small
#SBATCH --job-name no_30_hseg_sl1 
#SBATCH --gres gpu:1
#SBATCH -o ../../../../.results/no_30_hseg_sl1.out
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd ../../../..
source python_venvs/vm/bin/activate

# Segmentation task
python VM_train.py \
    --dataset from_raw \
    --segmentation \
    --dataset_path data/hudson_true_3d_default \
    --bsz 16 \
    --val_bsz 100 \
    --in_no 1 \
    --model_in_no 5 \
    --out_no 1 \
    --depth 3 \
    --split_condition tv_ratio:4-1 \
    --device 0 \
    --epoch 30 \
    --early_stopping 100 \
    --jobname no_30_hseg_sl1 \
    --loss smooth_l1 \
    --reduction mean \
    --img_type greyscale \
    --model UpDown2D \
    --reduce \
    --shuffle \
    --visdom \
    --save
