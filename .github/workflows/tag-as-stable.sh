#!/usr/bin/env bash

REGISTRY=$1
IMAGE=$2

docker pull ${REGISTRY}/${IMAGE}-test
docker tag ${REGISTRY}/${IMAGE}-test ${REGISTRY}/${IMAGE}-stable
docker push ${REGISTRY}/${IMAGE}-stable
