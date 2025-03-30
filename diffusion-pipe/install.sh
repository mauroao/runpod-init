#!/bin/bash

cd /workspace/diffusion-pipe/
python3 -m pip install --upgrade pip
python3 -m pip install --upgrade wheel
python3 -m pip install --upgrade setuptools
pip install -r requirements.txt

pip install -U "huggingface_hub[cli]"
