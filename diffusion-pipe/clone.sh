#!/bin/bash

cd /workspace/
rm -rf diffusion-pipe
git clone --recurse-submodules https://github.com/tdrussell/diffusion-pipe
mv /workspace/diffusion-pipe/examples/dataset.toml /workspace/diffusion-pipe/examples/dataset.toml.old
mkdir /workspace/diffusion-pipe/dataset
cp /workspace/runpod-init/diffusion-pipe/dataset.toml /workspace/diffusion-pipe/examples/dataset.toml
