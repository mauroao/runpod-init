#!/bin/bash
set -euo pipefail

trap 'echo "ERROR: Command failed at line $LINENO with exit code $?" >&2; exit 1' ERR

# Check if the RP_TOKEN variable is set and not empty
if [ -z "$RP_TOKEN" ]; then
    echo "Error: RP_TOKEN is not set. Aborting."
    exit 1
fi

download_file() {
    local target_path=$1
    local url=$2

    if [ -f "$target_path" ]; then
        echo "Skipping: $target_path already exists."
        return 0
    fi

    echo "Downloading: $url"
    aria2c -x 16 -s 16 -o "$target_path" "$url"
}

download_file_v2() {
    local target_path=$1
    local url=$2

    if [ -f "$target_path" ]; then
        echo "Skipping: $target_path already exists."
        return 0
    fi

    echo "Downloading: $url"
    wget -O "$target_path" "$url"
}

# Text Encoders
cd /workspace/ComfyUI/models/text_encoders/
download_file "umt5_xxl_fp8_e4m3fn_scaled.safetensors" "https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/text_encoders/umt5_xxl_fp8_e4m3fn_scaled.safetensors?download=true"

# CLIP Vision
cd /workspace/ComfyUI/models/clip_vision/
download_file "clip_vision_h.safetensors" "https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/clip_vision/clip_vision_h.safetensors?download=true"

# VAE
cd /workspace/ComfyUI/models/vae/
download_file "wan_2.1_vae.safetensors" "https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/vae/wan_2.1_vae.safetensors?download=true"

# Diffusion Model
cd /workspace/ComfyUI/models/diffusion_models/
download_file "Wan2_1-I2V-14B-720P_fp8_e4m3fn.safetensors" "https://huggingface.co/Kijai/WanVideo_comfy/resolve/main/Wan2_1-I2V-14B-720P_fp8_e4m3fn.safetensors?download=true"

# LoRAs directory
cd /workspace/ComfyUI/models/loras/
download_file_v2 "wan_bounceV_01.safetensors" "https://civitai.com/api/download/models/1517164?type=Model&format=SafeTensor&token=${RP_TOKEN}"
download_file_v2 "wan_cumshot_i2v.safetensors" "https://civitai.com/api/download/models/1602715?type=Model&format=SafeTensor&token=${RP_TOKEN}"

echo "All downloads completed successfully."
exit 0
