#!/bin/bash

# Prompt for the url of your site
read -p "Enter the URL of your site: " site

# Prompt for the url of the page to check
read -p "Enter the URL of the page to check: " url

# Send a GET request to the URL
response=$(curl -Ls "$url")

# Search the response for a link pointing to your site
if echo "$response" | grep -q "$site"; then
  echo "Link found!"
else
  echo "Link not found."
fi
