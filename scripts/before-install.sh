#!/bin/bash

# Install Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# Add the ubuntu user to the docker group to run docker commands without sudo
sudo usermod -aG docker ubuntu

# Remove any existing test_project directory
rm -rf /home/ubuntu/test_project
