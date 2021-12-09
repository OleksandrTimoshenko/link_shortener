#!/bin/bash

USER=$1
IMAGE_NAME=$2

IMAGE_NAME=ghcr.io/$USER/$IMAGE_NAME
IMAGE_NAME=$(echo $IMAGE_NAME | tr '[A-Z]' '[a-z]')
trivy image $IMAGE_NAME
# number of critical vulnerabilities in container OS +  installed python-pkg
number_of_critical_vulnerabilities=$(trivy image  --format json ${IMAGE_NAME} | grep CRITICAL | wc -l)
echo "Founded $number_of_critical_vulnerabilities critical security vulnerabilities."
if [ $(($number_of_critical_vulnerabilities)) -gt 0 ]; then exit 1; fi