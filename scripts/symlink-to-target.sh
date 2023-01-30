#!/bin/bash

# Prompt for the path to search in
read -p "Enter the path to search in: " search_path

# Check if the path exists
if [ ! -d "$search_path" ]; then
  echo "Error: $search_path is not a directory."
  exit 1
fi

# Find all symbolic links in the directory
for file in $(find $search_path -type l); do
  echo "Symbolic Link: $file"
  echo "Target: $(readlink $file)"
  echo ""
done