#!/bin/bash
set -euo pipefail

trap 'echo "ERROR: Command failed at line $LINENO with exit code $?" >&2; exit 1' ERR

# NOTE: To keep the venv active in your current shell after this script,
# run it with: source create_venv.sh

# 1. Deactivate any active venv
if type deactivate &>/dev/null; then
    deactivate
fi

# 2. Remove existing venv if present, then create and activate
if [ -d /comfy/ComfyUI/.venv ]; then
    rm -rf /comfy/ComfyUI/.venv
fi
python3 -m venv /comfy/ComfyUI/.venv
source /comfy/ComfyUI/.venv/bin/activate

# 3. Upgrade pip
python -m pip install --upgrade pip

echo "All commands executed successfully."
echo "venv location: /comfy/ComfyUI/.venv"
exit 0
