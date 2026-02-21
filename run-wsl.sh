#!/bin/bash

# Fix for WSL2: ensures Triton finds libcuda directly,
# without depending on ldconfig (which can have timing issues on WSL2 boot)
export TRITON_LIBCUDA_PATH=/usr/lib/wsl/lib

# Pre-warm Triton: forces compilation of cuda_utils.c BEFORE ComfyUI
# starts. This way any failure appears at boot, not in the middle of a workflow.
echo "[startup] Pre-warming Triton CUDA utils..."
/workspace/ComfyUI/.venv/bin/python -c "
from triton.backends.nvidia.driver import CudaUtils
CudaUtils()
print('[startup] Triton pre-warm OK')
" || echo "[startup] WARNING: Triton pre-warm failed. SageAttention may not work."

cd /workspace/ComfyUI
python main.py --disable-pinned-memory --use-sage-attention
