#!/bin/bash
#SBATCH -p part0
#SBATCH --job-name toms_mocap_focal-mean 
#SBATCH --ntasks 6
#SBATCH --gres gpu:1
#SBATCH -o ../../../.results/toms_mocap_focal-mean.out

source ../../../python_venvs/vm/bin/activate
python ../../../VM_train.py \
    --dataset_path data/mocap/grey_128x80_frames/6_dset.pickle \
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
    --jobname toms_mocap_focal-mean \
    --loss focal \
    --reduction mean \
    --img_type greyscale \
    --model UpDown2D \
    --self_output \
    --save \
    --shuffle \
    --visdom \
    --reduce 
