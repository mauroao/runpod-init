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
cd /workspace/models
download_file_v2 "bigLove_xl1.safetensors" "https://civitai.com/api/download/models/1147588?type=Model&format=SafeTensor&size=pruned&fp=fp16&token=${RP_TOKEN}"

mkdir -p /workspace/reg
cd /workspace/reg
download_file_v2 "womanXLREGULARISATIONPHOTO_v50.zip" "https://civitai.com/api/download/models/305100?type=Archive&format=Other&token=${RP_TOKEN}"

# Unzip the archive and remove it if successful
if [ -f "womanXLREGULARISATIONPHOTO_v50.zip" ]; then
    echo "Unzipping womanXLREGULARISATIONPHOTO_v50.zip..."
    if unzip -o "womanXLREGULARISATIONPHOTO_v50.zip"; then
        echo "Successfully unzipped. Removing zip file..."
        rm "womanXLREGULARISATIONPHOTO_v50.zip"
    else
        echo "Error: Failed to unzip womanXLREGULARISATIONPHOTO_v50.zip"
    fi
fi

echo "Download completed."
