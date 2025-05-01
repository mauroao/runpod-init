#!/bin/bash

cd /workspace/ComfyUI
apt update -y
apt install -y ffmpeg
pip install -r requirements.txt
pip install opencv-python

pip install -r /workspace/ComfyUI/custom_nodes/comfyui-wanvideowrapper/requirements.txt
pip install -r /workspace/ComfyUI/custom_nodes/comfyui-videohelpersuite/requirements.txt
pip install -r /workspace/ComfyUI/custom_nodes/comfyui-kjnodes/requirements.txt

pip install triton
pip install sageattention==1.0.6


