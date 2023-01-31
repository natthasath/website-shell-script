#!/bin/bash

# Prompt for the wordpress url sitemap.xml
read -p "Enter the url of sitemap.xml: " url

# Get a list of all pages and posts on the website
pages=$(curl $url 2>/dev/null | grep -oP '<loc>\K[^<]+')

# Loop through each page and post
for page in $pages; do
  # Get the HTML content of the page or post
  html=$(curl -L $page 2>/dev/null)

  # Extract all links from the HTML content
  links=$(echo $html | grep -oP '<a[^>]+href="\K[^"]+')

  # Loop through each link
  for link in $links; do
    # Check if the link is dead (returns a 404 status code)
    status=$(curl -I -L $link 2>/dev/null | head -n 1 | awk '{print $2}')
    if [[ $status == "404" ]]; then
      # Print the dead link
      echo $link
    fi
  done
done