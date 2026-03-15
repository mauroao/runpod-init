#!/bin/bash
"$(dirname "$0")/scripts/install-aria-ffmpeg.sh" || exit 1
source "$(dirname "$0")/scripts/common.sh"

COMFY_FOLDER="${COMFY_FOLDER:-/comfy}"

download_base_models

# LoRAs
cd "$COMFY_FOLDER"/ComfyUI/models/loras/

download_file_v2 "wan22-m4crom4sti4-i2v-20epoc-high-k3nk.safetensors" "https://civitai.com/api/download/models/2265575?type=Model&format=SafeTensor&token=${RP_TOKEN}"
download_file_v2 "wan22-m4crom4sti4-i2v-20epoc-low-k3nk.safetensors" "https://civitai.com/api/download/models/2266727?type=Model&format=SafeTensor&token=${RP_TOKEN}"

download_file_v2 "wan22-f4c3spl4sh-100epoc-high-k3nk.safetensors" "https://civitai.com/api/download/models/2176450?type=Model&format=SafeTensor&token=${RP_TOKEN}"
download_file_v2 "wan22-f4c3spl4sh-154epoc-low-k3nk.safetensors" "https://civitai.com/api/download/models/2178869?type=Model&format=SafeTensor&token=${RP_TOKEN}"

download_file_v2 "wan22-DR34MJOB_I2V_14b_LowNoise.safetensors" "https://civitai.com/api/download/models/2235288?type=Model&format=SafeTensor&token=${RP_TOKEN}"
download_file_v2 "wan22-DR34MJOB_I2V_14b_HighNoise.safetensors" "https://civitai.com/api/download/models/2235299?type=Model&format=SafeTensor&token=${RP_TOKEN}"

download_file_v2 "wan22_23high20noiseCumshot.oFnW.safetensors" "https://civitai.com/api/download/models/2116008?type=Model&format=SafeTensor&token=${RP_TOKEN}"
download_file_v2 "wan22_56low20noiseCumshot.xb7F.safetensors" "https://civitai.com/api/download/models/2116027?type=Model&format=SafeTensor&token=${RP_TOKEN}"

download_file "wan2.2_i2v_lightx2v_4steps_lora_v1_low_noise.safetensors" "https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged/resolve/main/split_files/loras/wan2.2_i2v_lightx2v_4steps_lora_v1_low_noise.safetensors"
download_file "wan2.2_i2v_lightx2v_4steps_lora_v1_high_noise.safetensors" "https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged/resolve/main/split_files/loras/wan2.2_i2v_lightx2v_4steps_lora_v1_high_noise.safetensors"

# SVI (Stable Video Infinity) v2 PRO LoRAs
mkdir -p WanVideo/SVI
download_file "WanVideo/SVI/SVI_v2_PRO_Wan2.2-I2V-A14B_HIGH_lora_rank_128_fp16.safetensors" "https://huggingface.co/Kijai/WanVideo_comfy/resolve/main/LoRAs/Stable-Video-Infinity/v2.0/SVI_v2_PRO_Wan2.2-I2V-A14B_HIGH_lora_rank_128_fp16.safetensors"
download_file "WanVideo/SVI/SVI_v2_PRO_Wan2.2-I2V-A14B_LOW_lora_rank_128_fp16.safetensors" "https://huggingface.co/Kijai/WanVideo_comfy/resolve/main/LoRAs/Stable-Video-Infinity/v2.0/SVI_v2_PRO_Wan2.2-I2V-A14B_LOW_lora_rank_128_fp16.safetensors"

# Diffusion Models
cd "$COMFY_FOLDER"/ComfyUI/models/diffusion_models/

download_file "wan2.2_i2v_high_noise_14B_fp8_scaled.safetensors" "https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged/resolve/main/split_files/diffusion_models/wan2.2_i2v_high_noise_14B_fp8_scaled.safetensors"
download_file "wan2.2_i2v_low_noise_14B_fp8_scaled.safetensors" "https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged/resolve/main/split_files/diffusion_models/wan2.2_i2v_low_noise_14B_fp8_scaled.safetensors"

echo -e "${GREEN}All commands executed successfully.${NC}"
exit 0
