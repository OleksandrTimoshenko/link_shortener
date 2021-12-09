#!/bin/bash

USER=$1
IMAGE_NAME=$2

IMAGE_ID=ghcr.io/$USER/$IMAGE_NAME
# Change all uppercase to lowercase
IMAGE_ID=$(echo $IMAGE_ID | tr '[A-Z]' '[a-z]')
docker tag $IMAGE_NAME $IMAGE_ID:latest
docker push $IMAGE_ID:latest