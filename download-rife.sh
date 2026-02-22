FILE="/workspace/ComfyUI/custom_nodes/comfyui-frame-interpolation/ckpts/rife/rife47.pth"
if [ ! -f "$FILE" ]; then
    wget -O "$FILE" https://huggingface.co/jasonot/mycomfyui/resolve/main/rife47.pth
fi
