#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script

# export DOCKERDIR="dockerfiles"
# export DOCKERFILE="Dockerfile.alpine.fio"
# export DOCKER_IMAGE="fio"
# export DOCKERTAG="alpine"
# export DOCKER_REPO="testrepo"

export DOCKERDIR="dockerfiles"
export DOCKERFILE="Dockerfile.alpine.fio"
export DOCKER_IMAGE="alpine"
export DOCKER_REPO="fio"

echo "=============================build============================================================="
docker build -t $DOCKER_IMAGE:$TRAVIS_COMMIT . --file $DOCKERDIR/$DOCKERFILE
docker images ls
echo "=============================push============================================================="
echo $DOCKER_TOKEN | sudo docker login --username $DOCKER_USERNAME --password-stdin #Login Succeeded

export git_sha="${TRAVIS_COMMIT}"
# docker tag "$DOCKER_IMAGE:$TRAVIS_COMMIT" "$DOCKER_USERNAME/$DOCKER_REPO:${git_sha}-${TRAVIS_BRANCH}"
# docker push "$DOCKER_USERNAME/$DOCKER_REPO:${git_sha}-${TRAVIS_BRANCH}"
docker tag "$DOCKER_IMAGE:$TRAVIS_COMMIT" "$DOCKER_USERNAME/$DOCKER_REPO:$DOCKER_IMAGE"
docker push "$DOCKER_USERNAME/$DOCKER_REPO:$DOCKER_IMAGE"
docker image ls


sudo docker logout
# echo "=============================pull && smoke tests============================================================="
# docker image rm --force "$DOCKER_IMAGE:$TRAVIS_COMMIT"
# docker image rm --force "$DOCKER_USERNAME/$DOCKER_REPO:${git_sha}-${TRAVIS_BRANCH}"
# docker pull "$DOCKER_USERNAME/$DOCKER_REPO:${git_sha}-${TRAVIS_BRANCH}"
# docker image ls
