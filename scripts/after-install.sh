#!/bin/bash

# Change directory to the project directory
cd /home/ubuntu/test_project || exit 1

# Find the full path to docker-compose dynamically
DOCKER_COMPOSE_PATH=$(which docker-compose)

# Check if docker-compose is found
if [ -z "$DOCKER_COMPOSE_PATH" ]; then
    echo "Error: docker-compose not found. Make sure it is installed and in your system's PATH."
    exit 1
fi

# Use the dynamically found docker-compose path to build Docker containers
$DOCKER_COMPOSE_PATH -f /home/ubuntu/test_project/docker_compose_prod.yml build --no-cache
