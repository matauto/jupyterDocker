#!/bin/bash
#check if docker is installed if not prompt the user to install it
if [ -x "$(command -v docker)" ]; then
    echo "[OK] Docker is installed"
else
    echo "[ERR] Docker is not installed. Please install it."
    exit
fi
#build the container from dockerfile
echo "Create docker container..."
sudo docker image build --tag jupyter/base-notebook:pznd .

#download repository with notebooks
echo "Download repository with notebooks..."
git clone https://github.com/piona/pznd

#run created docker container
sudo docker run -p 8888:8888 -v ./pznd:/home/jovyan/work jupyter/base-notebook:pznd
