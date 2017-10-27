#!/bin/bash
# A init file for Ubuntu (tested on 16.04)
# Update the apt package index
sudo apt-get update
# Install git
sudo apt install git
# Optional: git configuration
# git config --global user.email "you@example.com"
# git config --global user.name "Your Name"
# Install packages to allow apt to use a repository over HTTPS
sudo apt-get install \
  apt-transport-https \
  ca-certificates \
  curl \
  software-properties-common
# Add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# Use the following command to set up the stable repository.
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
# Update the apt package index
sudo apt-get update
# Install the latest version of Docker CE
sudo apt-get -y install docker-ce
# Add the current user to docker group
sudo usermod -aG docker $USER
