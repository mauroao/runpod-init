docker-build:
	docker build -t mauroao/runpod-comfy:0.1.0 .

docker-push:
	docker push docker.io/mauroao/runpod-comfy:0.1.0

docker-run:
	docker run --rm -it --gpus all --shm-size=8g mauroao/runpod-comfy:0.1.0 /bin/bash
