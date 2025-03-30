#!/bin/bash

cd /workspace/diffusion-pipe/
NCCL_P2P_DISABLE="1" NCCL_IB_DISABLE="1" deepspeed --num_gpus=1 train.py --deepspeed --config /workspace/runpod-init/diffusion-pipe/wan.toml






