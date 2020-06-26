#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script

export DOCKERDIR="dockerfiles"
export DOCKERFILE="Dockerfile.ansible"
export DOCKER_IMAGE="testimage"
export DOCKER_REPO="testrepo"

echo "=============================build============================================================="
docker build --build-arg OS_IMAGE=centos:8 -t centos8:ping-v1 . --file $DOCKERDIR/custom.dockerfile
docker build --build-arg OS_IMAGE=ubuntu:16.04 -t ubuntu1604:ping-v1 . --file $DOCKERDIR/custom.dockerfile
docker images
docker run -it centos8:ping-v1 -c 2 www.google.com

echo "=============================push============================================================="
docker build -t fabric2:bionic . --file $DOCKERDIR/$DOCKERDIR
# sudo docker build -t fabric2:bionic . --file $DOCKERDIR/Dockerfile.fabric2
docker image ls
docker build -t $DOCKER_IMAGE:$TRAVIS_COMMIT . --file=Dockerfile.nginx
echo $DOCKER_TOKEN | sudo docker login --username $DOCKER_USERNAME --password-stdin #Login Succeeded

export git_sha="${TRAVIS_COMMIT}"

docker tag $DOCKER_IMAGE:$TRAVIS_COMMIT "$DOCKER_USERNAME/$DOCKER_REPO:${git_sha}-${TRAVIS_BRANCH}"
docker push "$DOCKER_USERNAME/$DOCKER_REPO:${git_sha}-${TRAVIS_BRANCH}"
docker run -p 8000:80 "$DOCKER_USERNAME/$DOCKER_REPO:$DOCKER_IMAGE" &
docker image ls
docker container ls
sudo docker logout
