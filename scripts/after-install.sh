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

# Print the PATH for debugging
echo "Current PATH: $PATH"

# Change directory to the project directory with the full path
cd /home/ubuntu/test_project || exit 1

# Run the entire script with an explicit PATH
PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/usr/local/bin:$PATH" ./scripts/after-install.sh
