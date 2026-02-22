#!/bin/bash

# Pre-warm Triton: forces compilation of cuda_utils.c BEFORE ComfyUI
# starts. This way any failure appears at boot, not in the middle of a workflow.
echo "[startup] Pre-warming Triton CUDA utils..."
/workspace/ComfyUI/.venv/bin/python -c "
from triton.backends.nvidia.driver import CudaUtils
CudaUtils()
print('[startup] Triton pre-warm OK')
" || echo "[startup] WARNING: Triton pre-warm failed. SageAttention may not work."

cd /workspace/ComfyUI/
export AIOHTTP_NO_SENDFILE=1
python main.py --listen --use-sage-attention
