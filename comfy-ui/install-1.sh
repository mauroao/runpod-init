#!/bin/bash
set -euo pipefail

trap 'echo "ERROR: Command failed at line $LINENO with exit code $?" >&2; exit 1' ERR

apt update -y
apt install -y ffmpeg aria2

echo "All commands executed successfully."
exit 0
