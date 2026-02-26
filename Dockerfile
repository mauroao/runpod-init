FROM runpod/pytorch:1.0.2-cu1281-torch280-ubuntu2404

WORKDIR /comfy

COPY . .

RUN ./clone.sh

RUN ./install-pip-requirements.sh


