#!/usr/bin/env bash

# COLOQUE AQUI SEU USUARIO DOCKERHUB
dockerhub_user=rodrigogrohl
image_version=0.4.0
image_name=bender

docker build --no-cache \
    -t ${dockerhub_user}/${image_name}:${image_version} \
    -t ${dockerhub_user}/${image_name}:latest . 
