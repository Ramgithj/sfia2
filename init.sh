#! /bin/bash

sudo apt update -y
sudo apt install -y git

curl https://get.docker.com | sudo bash
sudo curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

export DB_HOST=mysql:3306

git clone https://github.com/jordan-grindrod/flask-sfia-2-example flask-sfia-2-example && cd $_

docker-compose up -d > /dev/null

cd .. && rm -rf flask-sfia-2-example

echo "Application is running on localhost"
