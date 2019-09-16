#!/bin/bash

# Create Argument dataset
python main.py trans --data mri-100unlabeled --model flow-fwd
python main.py trans --data mri-100unlabeled --model flow-bck
python main.py trans --data mri-100unlabeled --model color-unet

# Train Segment model
python main.py fss --gpu 0 --data mri-100unlabeled

# Evaluate model
./scripts/evaluate_segmenters.py
