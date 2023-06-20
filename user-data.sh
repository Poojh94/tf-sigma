#!/bin/bash
sudo su
cd
apt-get update -y
apt-get install apache2 -y
echo "<h1> Welcome to AWS Infra Using Terraform </h1>" > /var/www/html/check.html