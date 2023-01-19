#!/bin/bash

echo test terraform to run script > /home/ubuntu/test.txt

sudo apt update
sudo apt -y install nginx
sudo systemctl start nginx
sudo systemctl enable nginx