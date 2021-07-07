#!/usr/bin/bash

sudo yum install -y yum-utils

# Add docker yum repo
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

# install RPM packages
PACKAGES=$(cat rpm-packages.txt | sed ':a;N;$!ba;s/\n/ /g')
sudo yum install -y $(echo $PACKAGES)

# install pip packages
sudo pip install -U pip
sudo pip install -r requirements.txt