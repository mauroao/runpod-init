#!/bin/bash
set -euo pipefail

trap 'echo "ERROR: Command failed at line $LINENO with exit code $?" >&2; exit 1' ERR

SUDO=""
if command -v sudo &>/dev/null; then
    SUDO="sudo"
fi

$SUDO apt update -y
$SUDO apt install -y aria2
$SUDO apt install -y ffmpeg

echo "All commands executed successfully."
exit 0
