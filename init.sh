#! /bin/bash

sudo apt update -y &> /dev/null
sudo apt install -y git &> /dev/null

curl https://get.docker.com &> /dev/null | sudo bash &> /dev/null
sudo curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose &> /dev/null
sudo chmod +x /usr/local/bin/docker-compose &> /dev/null

export DB_HOST=mysql:3306

git clone https://github.com/jordan-grindrod/flask-sfia-2-example flask-sfia-2-example &> /dev/null && cd $_ &> /dev/null

docker-compose up -d &> /dev/null

cd .. && rm -rf flask-sfia-2-example &> /dev/null

echo "Application is running on localhost"
