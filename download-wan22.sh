#!/bin/bash
source "$(dirname "$0")/scripts/common.sh"

download_base_models

# LoRAs
cd /workspace/ComfyUI/models/loras/

download_file "wan22-m4crom4sti4-i2v-20epoc-high-k3nk.safetensors" "https://civitai.com/api/download/models/2265575?type=Model&format=SafeTensor&token=${RP_TOKEN}"
download_file "wan22-m4crom4sti4-i2v-20epoc-low-k3nk.safetensors" "https://civitai.com/api/download/models/2266727?type=Model&format=SafeTensor&token=${RP_TOKEN}"

download_file "wan22-f4c3spl4sh-100epoc-high-k3nk.safetensors" "https://civitai.com/api/download/models/2176450?type=Model&format=SafeTensor&token=${RP_TOKEN}"
download_file "wan22-f4c3spl4sh-154epoc-low-k3nk.safetensors" "https://civitai.com/api/download/models/2178869?type=Model&format=SafeTensor&token=${RP_TOKEN}"

download_file "wan22-DR34MJOB_I2V_14b_LowNoise.safetensors" "https://civitai.com/api/download/models/2235288?type=Model&format=SafeTensor&token=${RP_TOKEN}"
download_file "wan22-DR34MJOB_I2V_14b_HighNoise.safetensors" "https://civitai.com/api/download/models/2235299?type=Model&format=SafeTensor&token=${RP_TOKEN}"

download_file "23high20noiseCumshot.oFnW.safetensors" "https://civitai.com/api/download/models/2116008?type=Model&format=SafeTensor&token=${RP_TOKEN}"
download_file "56low20noiseCumshot.xb7F.safetensors" "https://civitai.com/api/download/models/2116027?type=Model&format=SafeTensor&token=${RP_TOKEN}"

download_file "wan2.2_i2v_lightx2v_4steps_lora_v1_low_noise.safetensors" "https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged/resolve/main/split_files/loras/wan2.2_i2v_lightx2v_4steps_lora_v1_low_noise.safetensors"
download_file "wan2.2_i2v_lightx2v_4steps_lora_v1_high_noise.safetensors" "https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged/resolve/main/split_files/loras/wan2.2_i2v_lightx2v_4steps_lora_v1_high_noise.safetensors"

# Diffusion Models
cd /workspace/ComfyUI/models/diffusion_models/

download_file "wan2.2_i2v_high_noise_14B_fp8_scaled.safetensors" "https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged/resolve/main/split_files/diffusion_models/wan2.2_i2v_high_noise_14B_fp8_scaled.safetensors"
download_file "wan2.2_i2v_low_noise_14B_fp8_scaled.safetensors" "https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged/resolve/main/split_files/diffusion_models/wan2.2_i2v_low_noise_14B_fp8_scaled.safetensors"

echo "All commands executed successfully."
exit 0
