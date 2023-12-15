#!/bin/bash

# Function to check if a command is available
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# Function to install Docker if not already installed
install_docker() {
  if ! command_exists docker; then
    echo "Docker is not installed. Installing Docker..."
    # Add Docker installation commands here
    # For example, on Ubuntu:
    # sudo apt-get update
    # sudo apt-get install -y docker-ce docker-ce-cli containerd.io
  fi
}

# Install Docker if not already installed
install_docker

# Change directory to the project directory with the full path
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
