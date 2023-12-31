#!/bin/bash

# Change directory to the project directory with the full path
cd /home/ubuntu/test_project || exit 1

# Ensure the script has execute permissions
chmod +x /opt/codedeploy-agent/deployment-root/79e5729e-d804-48b6-bae7-d6c0818b25fb/d-57361TR61/deployment-archive/scripts/after-install.sh

# Function to install Docker Compose if not already installed
install_docker_compose() {
  if [ ! -x /usr/bin/docker-compose ]; then
    echo "Docker Compose is not installed. Installing Docker Compose..."
    sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/bin/docker-compose
    sudo chmod +x /usr/bin/docker-compose
  fi
}

# Install Docker Compose if not already installed
install_docker_compose

# Add the user to the docker group
sudo usermod -aG docker $USER

# Print the PATH for debugging
echo "Current PATH: $PATH"

# Run Docker Compose with sudo
sudo /usr/bin/docker-compose -f /home/ubuntu/test_project/docker_compose_prod.yml build --no-cache
