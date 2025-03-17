cd /workspace/ComfyUI/models/loras/
wget "civitai.com/api/download/models/1517164?type=Model&format=SafeTensor&token=fc8fa1dca114e0ec7ec3f71d0cc931a0" --content-disposition
wget "civitai.com/api/download/models/1525363?type=Model&format=SafeTensor&token=fc8fa1dca114e0ec7ec3f71d0cc931a0" --content-disposition

cd /workspace/ComfyUI/models/text_encoders/
wget -O umt5_xxl_fp8_e4m3fn_scaled.safetensors https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/text_encoders/umt5_xxl_fp8_e4m3fn_scaled.safetensors?download=true

cd /workspace/ComfyUI/models/vae/
wget -O wan_2.1_vae.safetensors https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/vae/wan_2.1_vae.safetensors?download=true

cd /workspace/ComfyUI/models/clip_vision/
wget -O clip_vision_h.safetensors https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/clip_vision/clip_vision_h.safetensors?download=true

cd /workspace/ComfyUI/models/diffusion_models/
wget -O wan2.1_i2v_480p_14B_fp8_e4m3fn.safetensors https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/diffusion_models/wan2.1_i2v_480p_14B_fp8_e4m3fn.safetensors?download=true
wget -O wan2.1_i2v_720p_14B_fp16.safetensors "https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/diffusion_models/wan2.1_i2v_720p_14B_fp16.safetensors?download=true"