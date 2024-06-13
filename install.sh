#!/bin/bash

# Update and install required packages
apt update
apt install wget docker.io docker-compose -y

# Download and extract ARL-Limited-Edition
wget https://github.com/huntingsec/ARL-Limited-Edition/releases/download/v0.0.1/ARL-Limited-Edition.zip
unzip ARL-Limited-Edition.zip

# Change directory to ARL-Limited-Edition/docker
cd ARL-Limited-Edition/docker

# Load Docker images
docker load -i arl_web.tar
docker load -i mongo.tar
docker load -i rabbitmq.tar

# Create a Docker volume for the database
docker volume create arl_db

# Start Docker containers in detached mode
docker-compose up -d

# Copy files to the Docker container
docker cp ../app/config.py $(docker ps|grep arl_worker|cut -d ' ' -f1):/code/app/
docker cp domain_2w.txt $(docker ps|grep arl_worker|cut -d ' ' -f1):/code/app/dicts
docker cp file_top_2000.txt $(docker ps|grep arl_worker|cut -d ' ' -f1):/code/app/dicts

# Run ARL-Finger-ADD
cd ARL-Finger-ADD
python3 ARL-Finger-ADD.py https://127.0.0.1:5003/ admin arlpass

systemctl restart docker.service
