#!/bin/bash

# Navigate to the project directory
cd /home/ubuntu/test_project || exit 1

# Download and install docker-compose in the project directory
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o docker-compose || exit 1
sudo chmod +x docker-compose || exit 1

# Source the environment variables
source /home/ubuntu/test_project/env/.env.prod

# Print the contents of the .env.prod file for debugging
echo "Contents of .env.prod:"
cat /home/ubuntu/test_project/env/.env.prod

# Build the Docker containers
./docker-compose -f docker_compose_prod.yml build --no-cache

# Check the exit status of the docker-compose command
if [ $? -eq 0 ]; then
    echo "Docker-compose build successful."
else
    echo "Error: Docker-compose build failed."
    exit 1
fi

# Make the script executable
chmod +x after-install.sh
