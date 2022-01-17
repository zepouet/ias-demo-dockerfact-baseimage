#!/usr/bin/env bash

REGISTRY=$1
IMAGE=$2
DOCKERFILE_LOCATION=$3

pwd
ls -la .

docker pull ${REGISTRY}/${IMAGE}-test || true
docker build -t ${IMAGE} -f Dockerfile ${DOCKERFILE_LOCATION}

DIGEST1=$(docker images --no-trunc --quiet ${REGISTRY}/${IMAGE}-test)
DIGEST2=$(docker images --no-trunc --quiet ${IMAGE})

echo "DIGEST1(${REGISTRY}/${IMAGE}-test)="$DIGEST1
echo "DIGEST2(${IMAGE})="$DIGEST2

if [ "$DIGEST1" != "$DIGEST2" ]; then
  echo DIFF DETECTED. SHOW MUST GO ON
  docker rmi ${REGISTRY}/${IMAGE}-test || true
  docker tag ${IMAGE} ${REGISTRY}/${IMAGE}-test
  docker push ${REGISTRY}/${IMAGE}-test
  echo PUSHED for test for ${IMAGE}
  echo ::set-output name=image::updated
else
  echo SKIPPED found for ${IMAGE}
  echo ::set-output name=image::skipped
fi
