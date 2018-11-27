#!/bin/bash

#-------------------------------------------------------------
#Script to install Docker in ubuntu 18.04
#-------------------------------------------------------------

sudo apt-get remove docker docker-engine docker.io
sudo apt-get update
sudo apt-get install \
     apt-transport-https \
     ca-certificates \
     curl \
     software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

#Verify the key fingerprint to be: 9DC8 5822 9FC7 DD38 854A E2D8 8D81 803C 0EBF CD88 using:
sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update

#Install latest version of docker.
sudo apt-get install docker-ce

#Verify that Docker CE is installed correctly by running the hello-world image
sudo docker run hello-world

#The Docker daemon binds to a Unix socket instead of a TCP port. 
#By default that Unix socket is owned by the user root and other users can only access it using sudo. 
#The Docker daemon always runs as the root user.
#If you don’t want to preface the docker command with sudo, create a Unix group called docker and add users to it. 
#When the Docker daemon starts, it creates a Unix socket accessible by members of the docker group.

#Configure Docker to start on boot
sudo systemctl enable docker

#To disable this behavior, use disable instead.
#sudo systemctl disable docker


#-------------------------------------------------------------
#How to Uninstall Docker CE?
#-------------------------------------------------------------
#sudo apt-get purge docker-ce

#Images, containers, volumes, or customized configuration files on your host are not automatically removed. 
#To delete all images, containers, and volumes:
#sudo rm -rf /var/lib/docker
#-------------------------------------------------------------