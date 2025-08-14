#!/bin/bash

apt update && apt install aria2 -y

# Check if the RP_TOKEN variable is set and not empty
if [ -z "$RP_TOKEN" ]; then
    echo "Error: RP_TOKEN is not set. Aborting."
    exit 1
fi

download_file() {
    local target_path=$1
    local url=$2

    if [ -f "$target_path" ]; then
        echo "Removing existing file: $target_path"
        rm "$target_path"
    fi

    echo "Downloading: $url"
    aria2c -x 16 -s 16 -o "$target_path" "$url"
}

download_file_v2() {
    local target_path=$1
    local url=$2

    if [ -f "$target_path" ]; then
        echo "Removing existing file: $target_path"
        rm "$target_path"
    fi

    echo "Downloading: $url"
    wget -O "$target_path" "$url"
}

# LoRAs directory
cd /workspace/ComfyUI/models/loras/
download_file_v2 "wan_bounceV_01.safetensors" "https://civitai.com/api/download/models/1517164?type=Model&format=SafeTensor&token=${RP_TOKEN}"
download_file_v2 "wan_big_breasts_v2_epoch_30.safetensors" "https://civitai.com/api/download/models/1776890?type=Model&format=SafeTensor&token=${RP_TOKEN}"
download_file_v2 "wan_cumshot_i2v.safetensors" "https://civitai.com/api/download/models/1602715?type=Model&format=SafeTensor&token=${RP_TOKEN}"
download_file_v2 "wan_BouncyWalkV01.safetensors" "https://civitai.com/api/download/models/1537915?type=Model&format=SafeTensor&token=${RP_TOKEN}"
download_file_v2 "wan_m4crom4sti4-i2v-106epo-k3nk.safetensors" "https://civitai.com/api/download/models/2022744?type=Model&format=SafeTensor&token=${RP_TOKEN}"
download_file_v2 "wan_cumshot-I2V-22epo-k3nk.safetensors" "https://civitai.com/api/download/models/1952633?type=Model&format=SafeTensor&token=${RP_TOKEN}"
download_file_v2 "wan_SECRET_SAUCE_WAN2.1_14B_fp8.safetensors" "https://civitai.com/api/download/models/1959008?type=Model&format=SafeTensor&size=full&fp=fp8&token=${RP_TOKEN}"

# Text Encoders directory
cd /workspace/ComfyUI/models/text_encoders/
download_file "umt5-xxl-enc-fp8_e4m3fn.safetensors" "https://huggingface.co/Kijai/WanVideo_comfy/resolve/main/umt5-xxl-enc-fp8_e4m3fn.safetensors?download=true"

# VAE directory
cd /workspace/ComfyUI/models/vae/
download_file "Wan2_1_VAE_bf16.safetensors" "https://huggingface.co/Kijai/WanVideo_comfy/resolve/main/Wan2_1_VAE_bf16.safetensors?download=true"

# CLIP Vision directory
cd /workspace/ComfyUI/models/clip_vision/
download_file "clip_vision_h.safetensors" "https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/clip_vision/clip_vision_h.safetensors?download=true"

# Diffusion Models directory
cd /workspace/ComfyUI/models/diffusion_models/
download_file "Wan2_1-I2V-14B-720P_fp8_e4m3fn.safetensors" "https://huggingface.co/Kijai/WanVideo_comfy/resolve/main/Wan2_1-I2V-14B-720P_fp8_e4m3fn.safetensors?download=true"
download_file "wan21NSFWClipVisionH_v10_fp8_e4m3fn.safetensors" "https://huggingface.co/qpqpqpqpqpqp/basedbase_clip_h_wan_fp8/resolve/main/wan21NSFWClipVisionH_v10_fp8_e4m3fn.safetensors?download=true"


# Upscaler Models directory
cd /workspace/ComfyUI/models/upscale_models/
download_file "RealESRGAN_x2.pth" "https://huggingface.co/ai-forever/Real-ESRGAN/resolve/main/RealESRGAN_x2.pth?download=true"

echo "Download completed."
