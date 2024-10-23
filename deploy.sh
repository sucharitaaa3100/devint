#!/bin/bash

CONTAINER_NAME="my-nodejs"

if [ $(docker ps -q -f name=$CONTAINER_NAME) ]; then
    echo "Stopping and removing the existing container..."
    docker stop $CONTAINER_NAME
    docker rm $CONTAINER_NAME
fi

if [ $(docker images -q $CONTAINER_NAME) ]; then
    echo "Removing the existing image"
    docker rmi $CONTAINER_NAME
fi

echo "Building a new Docker image"
docker build -t $CONTAINER_NAME .

echo "Running the new container"
docker run -d -p 3000:3000 --name $CONTAINER_NAME $CONTAINER_NAME
