#!/bin/bash

# Fix para WSL2: garante que o Triton encontra libcuda diretamente,
# sem depender de ldconfig (que pode ter timing issues no boot do WSL2)
export TRITON_LIBCUDA_PATH=/usr/lib/wsl/lib

# Pre-warm do Triton: força a compilação de cuda_utils.c ANTES do ComfyUI
# iniciar. Assim qualquer falha aparece no boot, não no meio de um workflow.
echo "[startup] Pre-warming Triton CUDA utils..."
/workspace/ComfyUI/.venv/bin/python -c "
from triton.backends.nvidia.driver import CudaUtils
CudaUtils()
print('[startup] Triton pre-warm OK')
" || echo "[startup] AVISO: Triton pre-warm falhou. SageAttention pode nao funcionar."

cd /workspace/ComfyUI
#python main.py --disable-pinned-memory
python main.py
