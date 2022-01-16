#!/usr/bin/env bash

docker tag baseartifacts.azurecr.io/php:8.1-test baseartifacts.azurecr.io/php:8.1-stable
docker push baseartifacts.azurecr.io/php:8.1-stable
