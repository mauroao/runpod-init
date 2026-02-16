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

# LoRAs directory
cd /workspace/ComfyUI/models/loras/

download_file_v2 "Wan2.2-Lightning_I2V-A14B-4steps-lora_LOW_fp16.safetensors" "https://huggingface.co/Kijai/WanVideo_comfy/resolve/main/LoRAs/Wan22-Lightning/old/Wan2.2-Lightning_I2V-A14B-4steps-lora_LOW_fp16.safetensors?download=true"
download_file_v2 "Wan2.2-Lightning_I2V-A14B-4steps-lora_HIGH_fp16.safetensors" "https://huggingface.co/Kijai/WanVideo_comfy/resolve/main/LoRAs/Wan22-Lightning/old/Wan2.2-Lightning_I2V-A14B-4steps-lora_HIGH_fp16.safetensors?download=true"

download_file_v2 "wan22-m4crom4sti4-i2v-20epoc-high-k3nk.safetensors" "https://civitai.com/api/download/models/2265575?type=Model&format=SafeTensor&token=${RP_TOKEN}"
download_file_v2 "wan22-m4crom4sti4-i2v-20epoc-low-k3nk.safetensors" "https://civitai.com/api/download/models/2266727?type=Model&format=SafeTensor&token=${RP_TOKEN}"
download_file_v2 "wan22-f4c3spl4sh-100epoc-high-k3nk.safetensors" "https://civitai.com/api/download/models/2176450?type=Model&format=SafeTensor&token=${RP_TOKEN}"
download_file_v2 "wan22-f4c3spl4sh-154epoc-low-k3nk.safetensors" "https://civitai.com/api/download/models/2178869?type=Model&format=SafeTensor&token=${RP_TOKEN}"

download_file_v2 "wan_bounceV_01.safetensors" "https://civitai.com/api/download/models/1517164?type=Model&format=SafeTensor&token=${RP_TOKEN}"
download_file_v2 "wan_cumshot_i2v.safetensors" "https://civitai.com/api/download/models/1602715?type=Model&format=SafeTensor&token=${RP_TOKEN}"

# Upscale models
cd /workspace/ComfyUI/models/upscale_models/
download_file "RealESRGAN_x2.pth" "https://huggingface.co/ai-forever/Real-ESRGAN/resolve/a86fc6182b4650b4459cb1ddcb0a0d1ec86bf3b0/RealESRGAN_x2.pth?download=true"

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

# fp8 safetensors
download_file "wan2.2_i2v_high_noise_14B_fp8_scaled.safetensors" "https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged/resolve/main/split_files/diffusion_models/wan2.2_i2v_high_noise_14B_fp8_scaled.safetensors"
download_file "wan2.2_i2v_low_noise_14B_fp8_scaled.safetensors" "https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged/resolve/main/split_files/diffusion_models/wan2.2_i2v_low_noise_14B_fp8_scaled.safetensors"

# GGUF Q8_0
download_file "Wan2.2-I2V-A14B-HighNoise-Q8_0.gguf" "https://huggingface.co/QuantStack/Wan2.2-I2V-A14B-GGUF/resolve/main/HighNoise/Wan2.2-I2V-A14B-HighNoise-Q8_0.gguf?download=true"
download_file "Wan2.2-I2V-A14B-LowNoise-Q8_0.gguf" "https://huggingface.co/QuantStack/Wan2.2-I2V-A14B-GGUF/resolve/main/LowNoise/Wan2.2-I2V-A14B-LowNoise-Q8_0.gguf?download=true"

# wan21
download_file "Wan2_1-I2V-14B-720P_fp8_e4m3fn.safetensors" "https://huggingface.co/Kijai/WanVideo_comfy/resolve/main/Wan2_1-I2V-14B-720P_fp8_e4m3fn.safetensors?download=true"
download_file "wan2.1-i2v-14b-720p-Q6_K.gguf" "https://huggingface.co/city96/Wan2.1-I2V-14B-720P-gguf/resolve/main/wan2.1-i2v-14b-720p-Q6_K.gguf?download=true"

echo "All commands executed successfully."
exit 0
