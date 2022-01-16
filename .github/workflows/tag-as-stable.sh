#!/usr/bin/env bash

docker pull baseartifacts.azurecr.io/php:8.1-test
docker tag baseartifacts.azurecr.io/php:8.1-test baseartifacts.azurecr.io/php:8.1-stable
docker push baseartifacts.azurecr.io/php:8.1-stable
