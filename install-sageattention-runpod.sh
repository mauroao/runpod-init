#!/bin/bash
# =============================================================================
# Install SageAttention 2.2.0 from source
# Target: RunPod, Python 3.12, no venv (system pip)
# =============================================================================

set -euo pipefail
trap 'echo "ERROR: Command failed at line $LINENO with exit code $?" >&2; exit 1' ERR

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/scripts/sageattention.sh"

echo ""
echo "============================================="
echo " SageAttention ${SAGE_VERSION} Installer (RunPod)"
echo "============================================="
echo ""

echo ">>> Python: $(which python3)"
echo ""

# -----------------------------------------------------------------------------
# Steps: Shared installation routines (no venv needed on RunPod)
# -----------------------------------------------------------------------------
sage_check_installed
sage_check_build_deps
sage_clone
sage_build_install
sage_test
sage_cleanup
sage_print_success
