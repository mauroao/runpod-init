#!/bin/bash

cd /workspace/
rm -rf diffusion-pipe
git clone --recurse-submodules https://github.com/tdrussell/diffusion-pipe

mkdir /workspace/diffusion-pipe/dataset
mkdir /workspace/diffusion-pipe/output
mkdir /workspace/diffusion-pipe/checkpoints

mv /workspace/diffusion-pipe/examples/dataset.toml /workspace/diffusion-pipe/examples/dataset.toml.old
cp /workspace/runpod-init/diffusion-pipe/dataset.toml /workspace/diffusion-pipe/examples/dataset.toml
