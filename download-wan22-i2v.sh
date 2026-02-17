#!/bin/bash
source "$(dirname "$0")/scripts/common.sh"

download_base_models

# LoRAs
cd /workspace/ComfyUI/models/loras/

download_file_v2 "Wan2.2-Lightning_I2V-A14B-4steps-lora_LOW_fp16.safetensors" "https://huggingface.co/Kijai/WanVideo_comfy/resolve/main/LoRAs/Wan22-Lightning/old/Wan2.2-Lightning_I2V-A14B-4steps-lora_LOW_fp16.safetensors?download=true"
download_file_v2 "Wan2.2-Lightning_I2V-A14B-4steps-lora_HIGH_fp16.safetensors" "https://huggingface.co/Kijai/WanVideo_comfy/resolve/main/LoRAs/Wan22-Lightning/old/Wan2.2-Lightning_I2V-A14B-4steps-lora_HIGH_fp16.safetensors?download=true"

download_file_v2 "wan22-m4crom4sti4-i2v-20epoc-high-k3nk.safetensors" "https://civitai.com/api/download/models/2265575?type=Model&format=SafeTensor&token=${RP_TOKEN}"
download_file_v2 "wan22-m4crom4sti4-i2v-20epoc-low-k3nk.safetensors" "https://civitai.com/api/download/models/2266727?type=Model&format=SafeTensor&token=${RP_TOKEN}"

download_file_v2 "wan22-f4c3spl4sh-100epoc-high-k3nk.safetensors" "https://civitai.com/api/download/models/2176450?type=Model&format=SafeTensor&token=${RP_TOKEN}"
download_file_v2 "wan22-f4c3spl4sh-154epoc-low-k3nk.safetensors" "https://civitai.com/api/download/models/2178869?type=Model&format=SafeTensor&token=${RP_TOKEN}"

download_file_v2 "wan22-DR34MJOB_I2V_14b_LowNoise.safetensors" "https://civitai.com/api/download/models/2235288?type=Model&format=SafeTensor&token=${RP_TOKEN}"
download_file_v2 "wan22-DR34MJOB_I2V_14b_HighNoise.safetensors" "https://civitai.com/api/download/models/2235299?type=Model&format=SafeTensor&token=${RP_TOKEN}"

# Diffusion Models
cd /workspace/ComfyUI/models/diffusion_models/

# fp8 safetensors
#download_file "wan2.2_i2v_high_noise_14B_fp8_scaled.safetensors" "https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged/resolve/main/split_files/diffusion_models/wan2.2_i2v_high_noise_14B_fp8_scaled.safetensors"
#download_file "wan2.2_i2v_low_noise_14B_fp8_scaled.safetensors" "https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged/resolve/main/split_files/diffusion_models/wan2.2_i2v_low_noise_14B_fp8_scaled.safetensors"

# GGUF Q8_0
download_file "Wan2.2-I2V-A14B-HighNoise-Q8_0.gguf" "https://huggingface.co/QuantStack/Wan2.2-I2V-A14B-GGUF/resolve/main/HighNoise/Wan2.2-I2V-A14B-HighNoise-Q8_0.gguf?download=true"
download_file "Wan2.2-I2V-A14B-LowNoise-Q8_0.gguf" "https://huggingface.co/QuantStack/Wan2.2-I2V-A14B-GGUF/resolve/main/LowNoise/Wan2.2-I2V-A14B-LowNoise-Q8_0.gguf?download=true"

echo "All commands executed successfully."
exit 0
