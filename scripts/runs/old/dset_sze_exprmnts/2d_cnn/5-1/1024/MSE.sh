#!/bin/bash
#SBATCH --qos short
#SBATCH -N 1
#SBATCH -c 4
#SBATCH -t 2-00:00
#SBATCH -x gpu[0-3]
#SBATCH --mem 12G
#SBATCH -p res-gpu-small
#SBATCH --job-name varysize-1024_multi_gmb_2d-d3_MSE-mean
#SBATCH --gres gpu:1
#SBATCH -o /home2/crhf63/kable_management/projects/Visual-modelling/cnn_visual_modelling/.results/varysize-1024_multi_gmb_2d-d3_MSE-mean.out

source /home2/crhf63/kable_management/python_venvs/vm/bin/activate
python ../../../../../../VM_train.py \
    --dataset_path data/hudsons_multi_ygrav/10000_masked_blurred/6_dset.pickle \
    --bsz 16 \
    --val_bsz 100 \
    --in_no 5 \
    --out_no 1 \
    --depth 3 \
    --train_ratio 0.8 \
    --device 0 \
    --epoch 300 \
    --early_stopping 100 \
    --n_gifs 16 \
    --self_output_n 100 \
    --jobname jmprkbls_varysize-1024_5-1_multi_gmb_2d-d3_MSE_mean \
    --loss MSE \
    --reduction mean \
    --img_type greyscale \
    --model UpDown2D \
    --self_output \
    --save \
    --shuffle \
    --visdom \
    --reduce \
    --dset_sze 1024
