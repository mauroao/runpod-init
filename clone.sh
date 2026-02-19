#!/bin/bash
set -euo pipefail

trap 'echo "ERROR: Command failed at line $LINENO with exit code $?" >&2; exit 1' ERR

cd /workspace/

if [ -d "ComfyUI" ]; then
    echo "Existing ComfyUI directory found. Removing it."
    rm -rf ComfyUI
fi

git clone https://github.com/comfyanonymous/ComfyUI.git
cd /workspace/ComfyUI/custom_nodes
git clone https://github.com/ltdrdata/ComfyUI-Manager comfyui-manager
git clone https://github.com/Fannovel16/ComfyUI-Frame-Interpolation.git comfyui-frame-interpolation
git clone https://github.com/Kosinkadink/ComfyUI-VideoHelperSuite.git comfyui-videohelpersuite
git clone https://github.com/kijai/ComfyUI-WanVideoWrapper.git comfyui-wanvideowrapper
git clone https://github.com/kijai/ComfyUI-KJNodes.git comfyui-kjnodes
git clone https://github.com/DoctorDiffusion/ComfyUI-MediaMixer.git comfyui-mediamixer
git clone https://github.com/city96/ComfyUI-GGUF ComfyUI-GGUF
git clone https://github.com/welltop-cn/ComfyUI-TeaCache
#git clone https://github.com/wallish77/wlsh_nodes

mkdir -p /workspace/ComfyUI/user/default/workflows
for f in /workspace/runpod-init/workflows/*.json; do
    ln -sf "$f" /workspace/ComfyUI/user/default/workflows/
done

ln -sf /workspace/runpod-init/comfy.settings.json /workspace/ComfyUI/user/default/comfy.settings.json

# temporary fix from https://github.com/welltop-cn/ComfyUI-TeaCache/issues/178
ln -sf /workspace/runpod-init/nodes.py /workspace/ComfyUI/custom_nodes/ComfyUI-TeaCache/nodes.py

echo "All commands executed successfully."
exit 0
