#!/bin/bash
# =============================================================================
# Install SageAttention 2.2.0 from source
# Target: WSL Ubuntu 24.04, Python 3.12, ComfyUI venv
# =============================================================================

set -euo pipefail
trap 'echo "ERROR: Command failed at line $LINENO with exit code $?" >&2; exit 1' ERR

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/scripts/sageattention.sh"

VENV_PATH="/workspace/ComfyUI/.venv"

echo ""
echo "============================================="
echo " SageAttention ${SAGE_VERSION} Installer (WSL)"
echo "============================================="
echo ""

# -----------------------------------------------------------------------------
# Step 1: Check / activate .venv
# -----------------------------------------------------------------------------
echo ">>> Checking virtual environment..."

if [[ "${VIRTUAL_ENV:-}" == "${VENV_PATH}" ]]; then
    echo -e "${GREEN}[OK] venv already active: ${VIRTUAL_ENV}${NC}"
else
    if [ -f "${VENV_PATH}/bin/activate" ]; then
        echo -e "${YELLOW}[INFO] Activating venv: ${VENV_PATH}${NC}"
        source "${VENV_PATH}/bin/activate"
        echo -e "${GREEN}[OK] venv activated: ${VIRTUAL_ENV}${NC}"
    else
        echo -e "${RED}[ERROR] venv not found at: ${VENV_PATH}${NC}"
        echo "Please update VENV_PATH in this script to match your environment."
        exit 1
    fi
fi

echo ">>> Python: $(which python3)"
echo ""

# -----------------------------------------------------------------------------
# Steps 2-8: Shared installation routines
# -----------------------------------------------------------------------------
sage_check_installed
sage_check_build_deps
sage_clone
sage_build_install
sage_test
sage_cleanup
sage_print_success
