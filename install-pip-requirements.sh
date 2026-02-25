#!/bin/bash
set -euo pipefail

trap 'echo "ERROR: Command failed at line $LINENO with exit code $?" >&2; exit 1' ERR

cd /comfy/ComfyUI

pip install -r requirements.txt
pip install opencv-python

pip install -r /comfy/ComfyUI/custom_nodes/comfyui-manager/requirements.txt
pip install -r /comfy/ComfyUI/custom_nodes/comfyui-frame-interpolation/requirements-no-cupy.txt
pip install -r /comfy/ComfyUI/custom_nodes/comfyui-wanvideowrapper/requirements.txt
pip install -r /comfy/ComfyUI/custom_nodes/comfyui-videohelpersuite/requirements.txt
pip install -r /comfy/ComfyUI/custom_nodes/comfyui-kjnodes/requirements.txt
pip install -r /comfy/ComfyUI/custom_nodes/comfyui-mediamixer/requirements.txt
pip install -r /comfy/ComfyUI/custom_nodes/ComfyUI-GGUF/requirements.txt
pip install -r /comfy/ComfyUI/custom_nodes/ComfyUI-TeaCache/requirements.txt
pip install -r /comfy/ComfyUI/custom_nodes/ComfyUI-Easy-Use/requirements.txt
#pip install -r /comfy/ComfyUI/custom_nodes/wlsh_nodes/requirements.txt

pip install triton
pip install ninja packaging
# pip install sageattention==1.0.6
# pip install "https://huggingface.co/Kijai/PrecompiledWheels/resolve/main/sageattention-2.2.0-cp312-cp312-linux_x86_64.whl"

echo "All commands executed successfully."
exit 0
