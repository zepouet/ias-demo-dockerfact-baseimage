#!/usr/bin/env bash

docker pull baseartifacts.azurecr.io/php:8.1-stable || true
docker pull php:8.1
DIGEST1=$(docker images --no-trunc --quiet baseartifacts.azurecr.io/php:8.1-stable)
DIGEST2=$(docker images --no-trunc --quiet php:8.1)
echo "DIGEST1="$DIGEST1
echo "DIGEST2="$DIGEST2
if [ "$DIGEST1" != "$DIGEST2" ]; then
  echo DIFF DETECTED. SHOW MUST GO ON
  docker rmi baseartifacts.azurecr.io/php:8.1-test || true
  docker tag php:8.1 baseartifacts.azurecr.io/php:8.1-test
  docker push baseartifacts.azurecr.io/php:8.1-test
  echo PUSHED for test
else
  echo NO UPDATE found for php:8.1
fi
