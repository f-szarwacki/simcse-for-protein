#!/bin/bash
#SBATCH --job-name=prot_simcse_lpiekarski-nlp
#SBATCH --partition=nlp
#SBATCH --qos=1gpu1d
#SBATCH --nodes=1
#SBATCH --gres=gpu:1
#SBATCH --output=output_prot_bert.log
#SBATCH --error=error_prot_bert.log
#SBATCH --time=0-3:00:00

./venv/bin/python train.py \
        --model_name_or_path Rostlab/prot_bert \
        --train_file data/uniprot_for_simcse.txt \
        --output_dir trained_models/simcse_prot_bert \
        --num_train_epochs 1 \
        --do_mlm \
        --mlm_probability 0.15 \
        --learning_rate 1e-5 \
        --per_device_train_batch_size 16 \
        --pooler_type cls \
        --overwrite_output_dir \
        --temp 0.05 \
        --do_train \
        --fp16 \
        --gradient_accumulation_steps 1
