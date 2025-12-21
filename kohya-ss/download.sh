#!/bin/bash

apt update && apt install aria2 unzip -y

# Check if the RP_TOKEN variable is set and not empty
if [ -z "$RP_TOKEN" ]; then
    echo "Error: RP_TOKEN is not set. Aborting."
    exit 1
fi

download_file() {
    local target_path=$1
    local url=$2

    if [ -f "$target_path" ]; then
        echo "Removing existing file: $target_path"
        rm "$target_path"
    fi

    echo "Downloading: $url"
    aria2c -x 16 -s 16 -o "$target_path" "$url"
}

download_file_v2() {
    local target_path=$1
    local url=$2

    if [ -f "$target_path" ]; then
        echo "Removing existing file: $target_path"
        rm "$target_path"
    fi

    echo "Downloading: $url"
    wget -O "$target_path" "$url"
}

mkdir -p /workspace/models

cd /workspace/
download_file_v2 "file.zip" "https://github.com/mauroao/runpod-init/releases/download/filesv1/train_data.zip"

# Unzip the archive and remove it if successful
if [ -f "file.zip" ]; then
    echo "Unzipping file.zip..."
    if unzip -o "file.zip"; then
        echo "Successfully unzipped. Removing zip file..."
        rm "file.zip"
    else
        echo "Error: Failed to unzip file.zip"
    fi
fi

cd /workspace/models
download_file_v2 "juggernautXL_ragnarokBy.safetensors" "https://civitai.com/api/download/models/1759168?type=Model&format=SafeTensor&size=full&fp=fp16&token=${RP_TOKEN}"

echo "Download completed."
