#!/bin/bash

# Prompt for the URL
read -p "Enter the URL of the WordPress site: " url

# Get the version of WordPress from the meta tag
version=$(curl -s "$url" | grep "generator" | awk -F 'content=' '{print $2}' | awk -F '"' '{print $2}')

# Print the version number
echo "WordPress version: $version"