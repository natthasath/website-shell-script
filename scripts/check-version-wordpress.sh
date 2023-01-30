#!/bin/bash

url=$1

# Get the version of WordPress from the meta tag
version=$(curl -s "$1" | grep "generator" | awk -F 'content=' '{print $2}' | awk -F '"' '{print $2}')

# Print the version number
echo "WordPress version: $version"