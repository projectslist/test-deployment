#!/bin/bash

# Function to check if a command is available
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# Function to install Docker Compose if not already installed
install_docker_compose() {
  if ! command_exists docker-compose; then
    echo "Docker Compose is not installed. Installing Docker Compose..."
    sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
  fi
}

# Install Docker Compose if not already installed
install_docker_compose

# Change directory to the project directory with the full path
cd /home/ubuntu/test_project || exit 1

# Use the dynamically found docker-compose path to build Docker containers
docker-compose -f /home/ubuntu/test_project/docker_compose_prod.yml build --no-cache
