#!/bin/bash
echo "Read git version: $1"
echo "Updating staging Server"
echo "stopping node-web-demo.service"
sudo systemctl stop node-web-demo.service
# remove all outdated images and containers
echo "removing outdated/dangling images and containers"
sudo docker rmi yedda/node-web-demo:latest
# create new image for node-web-demo
echo "create new image for node-web-demo"
cd /home/yedda/node-web-demo
#sudo git pull origin master
sudo git fetch
sudo git checkout $1
sudo docker build -t="yedda/node-web-demo" .
# restart service which will use the newly pulled image
echo "restarting node-web-demo service"
sudo systemctl start node-web-demo.service
