#!/bin/bash
echo "------ Docker Installing ----"
sudo apt-get update
sudo apt-get --yes install curl
sudo apt --yes install docker.io
echo "------ Docker Compose Installing ------"
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
echo "******Docker & Docker Compose Installed Successfully****** "
