#!/usr/bin/env bash

REGISTRY=$1
IMAGE=$2

docker pull baseartifacts.azurecr.io/php:8.1-test || true
docker pull php:8.1
DIGEST1=$(docker images --no-trunc --quiet baseartifacts.azurecr.io/php:8.1-test)
DIGEST2=$(docker images --no-trunc --quiet php:8.1)
echo "DIGEST1="$DIGEST1
echo "DIGEST2="$DIGEST2
if [ "$DIGEST1" != "$DIGEST2" ]; then
  echo DIFF DETECTED. SHOW MUST GO ON
  docker rmi baseartifacts.azurecr.io/php:8.1-test || true
  docker tag php:8.1 baseartifacts.azurecr.io/php:8.1-test
  docker push baseartifacts.azurecr.io/php:8.1-test
  echo PUSHED for test
  echo ::set-output name=image::updated
else
  echo SKIPPED found for php:8.1
  echo ::set-output name=image::skipped
fi
