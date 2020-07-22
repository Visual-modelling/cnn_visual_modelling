#!/bin/bash
#SBATCH -p part0
#SBATCH --job-name multi_gmb_2d-d3_focal-mean
#SBATCH --ntasks 6
#SBATCH --gres gpu:1
#SBATCH -o /home/jumperkables/kable_management/projects/Visual-modelling/cnn_visual_modelling/.results/multi_gmb_2d-d3_focal-mean.out

source /home/jumperkables/kable_management/python_venvs/vm/bin/activate
python ../../../../../main.py \
    --dataset_path data/hudsons_multi_ygrav/10000_masked_blurred/6_dset.pickle \
    --bsz 16 \
    --val_bsz 100 \
    --in_no 5 \
    --out_no 1 \
    --depth 3 \
    --train_ratio 0.8 \
    --device 0 \
    --epoch 300 \
    --early_stopping 3 \
    --n_gifs 20 \
    --self_output_n 100 \
    --jobname 2poc_5-1_multi_gmb_2d-d3_focal_mean \
    --loss focal \
    --reduction mean \
    --img_type greyscale \
    --model UpDown2D \
    --self_output \
    --save \
    --shuffle \
    --visdom \
    --reduce 
