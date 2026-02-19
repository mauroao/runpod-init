#!/bin/bash

cd /workspace/ComfyUI/
export AIOHTTP_NO_SENDFILE=1
python main.py --listen
