#!/bin/bash

# Step 1: Obtain an SSL certificate
# TODO: Replace with commands to obtain or generate SSL certificate files

# Prompt for the file to certificate
read -p "Enter the path to the file to certificate: " certificate_file

# Prompt for the file to private key
read -p "Enter the path to the file to private key: " private_key_file

# Step 2: Copy the SSL certificate files to the server
# TODO: Replace with commands to copy the files to the server

# Step 3: Install Nginx web server
sudo apt-get update -y
sudo apt-get install nginx -y

# Step 4: Configure SSL for Nginx
sudo mkdir /etc/nginx/ssl
sudo cp $certificate_file /etc/nginx/ssl/
sudo cp $private_key_file /etc/nginx/ssl/
sudo chmod 600 /etc/nginx/ssl/*
sudo chown root:root /etc/nginx/ssl/*

# Step 5: Configure Nginx to use SSL
sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/example.com
sudo sed -i '/^}/i \
    \tlisten 443 ssl;\n\
    \tssl_certificate /etc/nginx/ssl/'"$certificate_file"';\n\
    \tssl_certificate_key /etc/nginx/ssl/'"$private_key_file"';' /etc/nginx/sites-available/example.com
sudo ln -s /etc/nginx/sites-available/example.com /etc/nginx/sites-enabled/example.com

# Step 6: Test Nginx configuration and restart Nginx
sudo nginx -t
sudo systemctl restart nginx
