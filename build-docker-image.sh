#!/usr/bin/env bash

set -e

IMAGE_TAG="mender-convert:$(date +%Y%m%d_%H%M%S)_$(git rev-parse HEAD | cut -b -7)"
echo "image tag is $IMAGE_TAG"
DOCKER_CONTEXT_ROOT=.
IMAGE_SAVE_DIR=../build

docker build --tag "${IMAGE_TAG}" "${DOCKER_CONTEXT_ROOT}"
save_path="${IMAGE_SAVE_DIR}/$(echo "${IMAGE_TAG}"  | tr ':' '_').docker_image.tar"
echo "saving image archive to $save_path"
docker image save "${IMAGE_TAG}" > "${save_path}"