#!/bin/bash

# Change directory to the project directory with the full path
cd /home/ubuntu/test_project || exit 1

# Ensure the script has execute permissions
chmod +x /opt/codedeploy-agent/deployment-root/79e5729e-d804-48b6-bae7-d6c0818b25fb/d-KUT35NR61/deployment-archive/scripts/after-install.sh

# Function to install Docker Compose if not already installed
install_docker_compose() {
  if [ ! -x /usr/local/bin/docker-compose ]; then
    echo "Docker Compose is not installed. Installing Docker Compose..."
    sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
  fi
}

# Install Docker Compose if not already installed
install_docker_compose

# Explicitly set the PATH before running docker-compose
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/usr/local/bin:$PATH"

# Print the PATH for debugging
echo "Current PATH: $PATH"

# Use the dynamically found docker-compose path to build Docker containers
docker-compose -f /home/ubuntu/test_project/docker_compose_prod.yml build --no-cache
