#!/bin/bash
set -euo pipefail

trap 'echo "ERROR: Command failed at line $LINENO with exit code $?" >&2; exit 1' ERR

cd /comfy/

if [ -d "ComfyUI" ]; then
    echo "Existing ComfyUI directory found. Removing it."
    rm -rf ComfyUI
fi

git clone https://github.com/comfyanonymous/ComfyUI.git
cd /comfy/ComfyUI/custom_nodes
git clone https://github.com/ltdrdata/ComfyUI-Manager comfyui-manager
git clone https://github.com/Fannovel16/ComfyUI-Frame-Interpolation.git comfyui-frame-interpolation
git clone https://github.com/Kosinkadink/ComfyUI-VideoHelperSuite.git comfyui-videohelpersuite
git clone https://github.com/kijai/ComfyUI-WanVideoWrapper.git comfyui-wanvideowrapper
git clone https://github.com/kijai/ComfyUI-KJNodes.git comfyui-kjnodes
git clone https://github.com/DoctorDiffusion/ComfyUI-MediaMixer.git comfyui-mediamixer
git clone https://github.com/city96/ComfyUI-GGUF ComfyUI-GGUF
git clone https://github.com/welltop-cn/ComfyUI-TeaCache
git clone https://github.com/yolain/ComfyUI-Easy-Use
#git clone https://github.com/wallish77/wlsh_nodes

mkdir -p /comfy/ComfyUI/user/default/workflows
for f in /comfy/runpod-init/workflows/*.json; do
    ln -sf "$f" /comfy/ComfyUI/user/default/workflows/
done

ln -sf /comfy/runpod-init/files/comfy.settings.json /comfy/ComfyUI/user/default/comfy.settings.json

# temporary fix from https://github.com/welltop-cn/ComfyUI-TeaCache/issues/178
ln -sf /comfy/runpod-init/files/nodes.py /comfy/ComfyUI/custom_nodes/ComfyUI-TeaCache/nodes.py

mkdir -p /comfy/ComfyUI/custom_nodes/comfyui-frame-interpolation/ckpts/rife
FILE="/comfy/ComfyUI/custom_nodes/comfyui-frame-interpolation/ckpts/rife/rife47.pth"
if [ ! -f "$FILE" ]; then
    wget -O "$FILE" https://huggingface.co/jasonot/mycomfyui/resolve/main/rife47.pth
fi

echo "All commands executed successfully."
exit 0
