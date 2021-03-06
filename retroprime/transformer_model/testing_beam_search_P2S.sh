#!/usr/bin/env bash

dataset=USPTO-50K_pos_pred
model=${dataset}_model_step_90000.pt
beam_size=10
CUDA_VISIBLE_DEVICES=3 python translate.py -gpu 3 -model experiments/checkpoints/${dataset}/${model} \
                    -src data/${dataset}/src-test_extract_5w.txt \
                    -output experiments/results/${dataset}/predictions_${model}_beam${beam_size}test_extract_5w.txt \
                    -batch_size 64 -replace_unk -max_length 200 -beam_size ${beam_size} -n_best ${beam_size} &
