#!/bin/bash
set -euo pipefail

trap 'echo "ERROR: Command failed at line $LINENO with exit code $?" >&2; exit 1' ERR

sudo apt update -y
sudo apt install -y aria2
sudo apt install -y ffmpeg

echo "All commands executed successfully."
exit 0
