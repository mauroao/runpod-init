#!/bin/bash

cd /workspace/ComfyUI
apt update -y
apt install -y ffmpeg
pip install -r requirements.txt
pip install opencv-python





