#!/bin/bash
source "$(dirname "$0")/scripts/common.sh"

download_base_models

# Diffusion Model
cd /workspace/ComfyUI/models/diffusion_models/
download_file "Wan2_1-I2V-14B-720P_fp8_e4m3fn.safetensors" "https://huggingface.co/Kijai/WanVideo_comfy/resolve/main/Wan2_1-I2V-14B-720P_fp8_e4m3fn.safetensors?download=true"
# download_file "wan2.1-i2v-14b-720p-Q5_K_M.gguf" "https://huggingface.co/city96/Wan2.1-I2V-14B-720P-gguf/resolve/main/wan2.1-i2v-14b-720p-Q5_K_M.gguf?download=true"

# LoRAs
cd /workspace/ComfyUI/models/loras/
download_file_v2 "wan_bounceV_01.safetensors" "https://civitai.com/api/download/models/1517164?type=Model&format=SafeTensor&token=${RP_TOKEN}"
download_file_v2 "wan_cumshot_i2v.safetensors" "https://civitai.com/api/download/models/1602715?type=Model&format=SafeTensor&token=${RP_TOKEN}"

# Upscale models
cd /workspace/ComfyUI/models/upscale_models/
download_file "RealESRGAN_x2.pth" "https://huggingface.co/ai-forever/Real-ESRGAN/resolve/a86fc6182b4650b4459cb1ddcb0a0d1ec86bf3b0/RealESRGAN_x2.pth?download=true"

echo "All downloads completed successfully."
exit 0

#
