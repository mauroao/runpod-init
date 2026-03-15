#!/bin/bash
"$(dirname "$0")/scripts/install-aria-ffmpeg.sh" || exit 1
source "$(dirname "$0")/scripts/common.sh"

COMFY_FOLDER="${COMFY_FOLDER:-/comfy}"

# SDXL checkpoint
cd "$COMFY_FOLDER"/ComfyUI/models/checkpoints/
download_file_v2 "juggernautXL_ragnarokBy.safetensors" "https://civitai.com/api/download/models/1759168?type=Model&format=SafeTensor&size=full&fp=fp16&token=${RP_TOKEN}"

# Private HuggingFace LoRA (requires HF_TOKEN)
cd "$COMFY_FOLDER"/ComfyUI/models/loras/
download_file_hf_private "s3xyv3n3r4_sdxl_v1-000008.safetensors" "https://huggingface.co/mauroao/lora_sdxl_s3xyv3n3r4/resolve/main/s3xyv3n3r4_sdxl_v1-000008.safetensors"

echo -e "${GREEN}All downloads completed successfully.${NC}"
exit 0
