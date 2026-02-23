#!/bin/bash
# =============================================================================
# Install SageAttention 2.2.0 from source
# Detects environment (WSL vs RunPod) via WSL_DISTRO_NAME
# =============================================================================

set -euo pipefail
trap 'echo "ERROR: Command failed at line $LINENO with exit code $?" >&2; exit 1' ERR

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/scripts/sageattention.sh"

VENV_PATH="/workspace/ComfyUI/.venv"

# Detect WSL using the WSL_DISTRO_NAME variable (set by WSL on every session)
if [[ -n "${WSL_DISTRO_NAME:-}" ]]; then
    IS_WSL=true
else
    IS_WSL=false
fi

echo ""
echo "============================================="
if $IS_WSL; then
    echo " SageAttention ${SAGE_VERSION} Installer (WSL)"
else
    echo " SageAttention ${SAGE_VERSION} Installer (RunPod)"
fi
echo "============================================="
echo ""

if $IS_WSL; then
    echo ">>> Detected environment: WSL (${WSL_DISTRO_NAME})"
    echo ""
    echo ">>> Checking virtual environment..."

    if [[ -z "${VIRTUAL_ENV:-}" ]]; then
        echo -e "${RED}[ERROR] No virtual environment is active.${NC}"
        echo ""
        echo "On WSL, you must activate the venv before running this script:"
        echo "  source ${VENV_PATH}/bin/activate"
        echo ""
        exit 1
    fi

    echo -e "${GREEN}[OK] venv active: ${VIRTUAL_ENV}${NC}"
else
    echo ">>> Detected environment: RunPod (system Python)"
fi

echo ">>> Python: $(which python3)"
echo ""

sage_check_installed
sage_check_build_deps
sage_clone
sage_build_install
sage_test
sage_cleanup
sage_print_success
