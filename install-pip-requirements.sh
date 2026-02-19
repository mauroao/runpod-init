#!/bin/bash
set -euo pipefail

trap 'echo "ERROR: Command failed at line $LINENO with exit code $?" >&2; exit 1' ERR

cd /workspace/ComfyUI

pip install -r requirements.txt
pip install opencv-python

pip install -r /workspace/ComfyUI/custom_nodes/comfyui-manager/requirements.txt
pip install -r /workspace/ComfyUI/custom_nodes/comfyui-frame-interpolation/requirements-no-cupy.txt
pip install -r /workspace/ComfyUI/custom_nodes/comfyui-wanvideowrapper/requirements.txt
pip install -r /workspace/ComfyUI/custom_nodes/comfyui-videohelpersuite/requirements.txt
pip install -r /workspace/ComfyUI/custom_nodes/comfyui-kjnodes/requirements.txt
pip install -r /workspace/ComfyUI/custom_nodes/comfyui-mediamixer/requirements.txt
pip install -r /workspace/ComfyUI/custom_nodes/ComfyUI-GGUF/requirements.txt
pip install -r /workspace/ComfyUI/custom_nodes/ComfyUI-TeaCache/requirements.txt

pip install triton
pip install sageattention==1.0.6

echo "All commands executed successfully."
exit 0
