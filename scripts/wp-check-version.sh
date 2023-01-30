#!/bin/bash

LATEST_VERSION=`curl -s http://api.wordpress.org/core/version-check/1.5/ | head -n 4 | tail -n 1`
echo "Latest version of WordPress: $LATEST_VERSION"

# Prompt for the URL
read -p "Enter the URL of the WordPress site: " url

# Get the version of WordPress from the meta tag
version=$(curl -s "$url" | grep "generator" | awk -F 'content=' '{print $2}' | awk -F '"' '{print $2}')

# Print the version number
echo "WordPress version: $version"