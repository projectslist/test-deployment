#!/bin/bash

# Navigate to the project directory
cd /home/ubuntu/test_project || exit 1

# Check if docker-compose is available in the PATH
if command -v docker-compose >/dev/null 2>&1; then
    DOCKER_COMPOSE_CMD="docker-compose"
    echo "docker-compose is installed, proceeding with build."
else
    # If docker-compose is not found, install it in the project directory
    echo "docker-compose not found. Installing..."

    # Download docker-compose to the project directory
    sudo curl -L "https://github.com/docker/compose/releases/download/{version}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose || exit 1
    sudo chmod +x /usr/local/bin/docker-compose || exit 1
    DOCKER_COMPOSE_CMD="/usr/local/bin/docker-compose"
fi

# Build the Docker containers
${DOCKER_COMPOSE_CMD} -f docker_compose_prod.yml build --no-cache

# Check the exit status of the docker-compose command
if [ $? -eq 0 ]; then
    echo "Docker-compose build successful."
else
    echo "Error: Docker-compose build failed."
    exit 1
fi

# Make the script executable
chmod +x after-install.sh
