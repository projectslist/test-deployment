#!/bin/bash

# Change directory to the project directory with the full path
cd /home/ubuntu/test_project || exit 1

# Ensure the script has execute permissions
chmod +x /opt/codedeploy-agent/deployment-root/79e5729e-d804-48b6-bae7-d6c0818b25fb/d-KUT35NR61/deployment-archive/scripts/after-install.sh

# Print the PATH for debugging
echo "Current PATH: $PATH"

# Use the explicitly set full path to docker-compose to build Docker containers
/usr/bin/docker-compose -f /home/ubuntu/test_project/docker_compose_prod.yml build --no-cache
