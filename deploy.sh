#!/bin/bash
echo “Updating staging Server”
echo “stopping nodeWebDemo.service”
sudo systemctl stop nodeWebDemo.service
# remove all outdated images and containers
echo “removing outdated/dangling images and containers”
sudo docker rmi yedda/nodeWebDemo:latest
# create new image for nodeWebDemo
echo “create new image for nodeWebDemo”
cd /home/yedda/nodeWebDemo
git pull origin master
sudo docker build -t=”yedda/nodeWebDemo” .
# restart service which will use the newly pulled image
echo “restarting nodeWebDemo service”
sudo systemctl start nodeWebDemo.service