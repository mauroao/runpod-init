# RunPod-Init

## Copy files from server

Example command to copy files from server to local machine:
```
scp -P 17351 -i "C:\Users\mauro\.ssh\id_rsa" -r "root@38.147.83.15:/workspace/ComfyUI/output/" "C:\Users\mauro\Downloads\"
```

Example command to copy files from local machine to server:
```
scp -P 17351 -i "C:\Users\mauro\.ssh\id_rsa" "E:\stable_diffusion\nsfw-ai-files\diffusion-pipe-training\poetry\*.*" "root@38.147.83.15:/workspace/diffusion-pipe/dataset/"
```


