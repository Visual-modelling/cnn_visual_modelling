#!/bin/bash
#SBATCH --mem=12G
#SBATCH --qos short
#SBATCH -t 2-00:00
#SBATCH -N 1
#SBATCH --partition=res-gpu-small
#SBATCH --job-name=transformer_sl1-mean
#SBATCH -c 4
#SBATCH --gres=gpu:1
#SBATCH -o /home2/crhf63/kable_management/projects/Visual-modelling/cnn_visual_modelling/.results/transformer_sl1-mean.out

source /home2/crhf63/kable_management/python_venvs/vm/bin/activate
python ../../../../../VM_train.py \
    --dataset_path data/hudsons_og/2000/100_dset.pickle \
    --bsz 16 \
    --val_bsz 100 \
    --in_no 99 \
    --out_no 1 \
    --depth 3 \
    --train_ratio 0.8 \
    --device 0 \
    --epoch 300 \
    --early_stopping 3 \
    --n_gifs 5 \
    --self_output_n 30 \
    --jobname poc_99-1_transformer_sl1_mean \
    --loss smooth_l1 \
    --reduction mean \
    --img_type greyscale \
    --model transformer \
    --self_output \
    --save \
    --shuffle \
    --visdom \
    --reduce 
