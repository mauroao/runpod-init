#!/bin/bash
source "$(dirname "$0")/scripts/common.sh"

# Text Encoders
cd /workspace/ComfyUI/models/text_encoders/
download_file "nsfw_wan_umt5-xxl_bf16.safetensors" "https://huggingface.co/NSFW-API/NSFW-Wan-UMT5-XXL/resolve/main/nsfw_wan_umt5-xxl_bf16.safetensors?download=true"

echo "All downloads completed successfully."
exit 0
