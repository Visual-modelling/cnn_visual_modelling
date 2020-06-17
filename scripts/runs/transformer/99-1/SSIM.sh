#!/bin/bash
#SBATCH --partition=part0
#SBATCH --job-name=transformer_SSIM-mean
#SBATCH --ntasks=6
#SBATCH --gres=gpu:1
#SBATCH -o /home/jumperkables/kable_management/projects/Visual-modelling/cnn_visual_modelling/.results/transformer_SSIM-mean.out

source /home/jumperkables/kable_management/python_venvs/vm/bin/activate
python ../../../../main.py \
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
    --jobname poc_99-1_transformer_SSIM_mean \
    --loss SSIM \
    --reduction mean \
    --img_type greyscale \
    --model transformer \
    --self_output \
    --save \
    --shuffle \
    --visdom \
    --reduce 