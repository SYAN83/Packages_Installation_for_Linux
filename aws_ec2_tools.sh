#!/bin/bash
# Amazon EC2 package installation (tested on Ubuntu 16.04)
# Update the apt package index
sudo apt-get update
# Install python3 virtualenv
echo "Installing python3 virtualenv..."
sudo apt-get -y install python3-venv
