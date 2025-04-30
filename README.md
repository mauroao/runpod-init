# RunPod-Init

## Copy files from server

Copy files from server to local:
```
scp -P 51082 -i "C:\Users\mauro\.ssh\id_rsa" -r "root@195.26.233.92:/workspace/ComfyUI/output/" "C:\Users\mauro\Downloads\"
```

Copy files from local to server:
```
scp -P 17351 -i "C:\Users\mauro\.ssh\id_rsa" "E:\stable_diffusion\nsfw-ai-files\diffusion-pipe-training\poetry\*.*" "root@38.147.83.15:/workspace/diffusion-pipe/dataset/"
```



