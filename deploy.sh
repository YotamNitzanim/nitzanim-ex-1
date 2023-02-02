#!/bin/bash

echo "Starting to deploy docker image.."
DOCKER_IMAGE=yotamnitzanim/nitzanim-ex-01
docker pull $DOCKER_IMAGE
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
docker run -d -p 5000:5000 $DOCKER_IMAGE