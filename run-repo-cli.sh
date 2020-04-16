#!/usr/bin/env bash
[[ $(command -v docker) ]] || (echo this client require docker && exit 1)
[[ $(docker image ls | grep -c 'repoclient.*v1') -ge 1 ]] || \
    docker build -t repoclient:v1 -f Dockerfile docker

drun () {
    docker run --rm -ti --name repocli --hostname repocli repoclient:v${1:-1} 
}

drun 

