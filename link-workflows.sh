#!/bin/bash
set -euo pipefail

trap 'echo "ERROR: Command failed at line $LINENO with exit code $?" >&2; exit 1' ERR

GREEN='\033[0;32m'
NC='\033[0m'

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
COMFY_FOLDER="${COMFY_FOLDER:-/comfy}"

mkdir -p "$COMFY_FOLDER"/ComfyUI/user/default/workflows
for f in "$SCRIPT_DIR"/workflows/*.json; do
    ln -sf "$f" "$COMFY_FOLDER"/ComfyUI/user/default/workflows/
done

echo -e "${GREEN}All commands executed successfully.${NC}"
exit 0
