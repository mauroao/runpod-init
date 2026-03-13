# syntax=docker/dockerfile:1
FROM runpod/pytorch:1.0.2-cu1281-torch280-ubuntu2404

RUN mkdir -p /comfy/runpod-init/

WORKDIR /comfy/runpod-init/

COPY --exclude=workflows/ . .

RUN ./clone.sh

RUN ./install-pip-requirements.sh

COPY workflows/ ./workflows/

RUN ./link-workflows.sh


