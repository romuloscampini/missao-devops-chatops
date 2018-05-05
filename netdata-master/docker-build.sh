#!/usr/bin/env bash

# COLOQUE AQUI SEU USUARIO DOCKERHUB
dockerhub_user=rodrigogrohl
image_version=1.0.0
image_name=netdata

docker build --no-cache \
    -t ${dockerhub_user}/${image_name}:${image_version} \
    -t ${dockerhub_user}/${image_name}:latest . 
