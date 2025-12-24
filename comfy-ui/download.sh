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
download_file_v2 "wan22-m4crom4sti4-i2v-20epoc-high-k3nk.safetensors" "https://civitai.com/api/download/models/2265575?type=Model&format=SafeTensor&token=${RP_TOKEN}"
download_file_v2 "wan22-m4crom4sti4-i2v-20epoc-low-k3nk.safetensors" "https://civitai.com/api/download/models/2266727?type=Model&format=SafeTensor&token=${RP_TOKEN}"
download_file_v2 "wan22-f4c3spl4sh-100epoc-high-k3nk.safetensors" "https://civitai.com/api/download/models/2176450?type=Model&format=SafeTensor&token=${RP_TOKEN}"
download_file_v2 "wan22-f4c3spl4sh-154epoc-low-k3nk.safetensors" "https://civitai.com/api/download/models/2178869?type=Model&format=SafeTensor&token=${RP_TOKEN}"

# Text Encoders directory
cd /workspace/ComfyUI/models/text_encoders/
download_file "umt5_xxl_fp8_e4m3fn_scaled.safetensors" "https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/text_encoders/umt5_xxl_fp8_e4m3fn_scaled.safetensors?download=true"

# VAE directory
cd /workspace/ComfyUI/models/vae/
download_file "wan_2.1_vae.safetensors" "https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/vae/wan_2.1_vae.safetensors?download=true"

# CLIP Vision directory
cd /workspace/ComfyUI/models/clip_vision/
download_file "clip_vision_h.safetensors" "https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/clip_vision/clip_vision_h.safetensors?download=true"

# Diffusion Models directory
cd /workspace/ComfyUI/models/diffusion_models/
download_file "Wan2.2-I2V-A14B-LowNoise-Q5_K_M.gguf" "https://huggingface.co/QuantStack/Wan2.2-I2V-A14B-GGUF/resolve/main/LowNoise/Wan2.2-I2V-A14B-LowNoise-Q5_K_M.gguf?download=true"
download_file "Wan2.2-I2V-A14B-HighNoise-Q5_K_M.gguf" "https://huggingface.co/QuantStack/Wan2.2-I2V-A14B-GGUF/resolve/main/HighNoise/Wan2.2-I2V-A14B-HighNoise-Q5_K_M.gguf?download=true"


echo "Download completed."
