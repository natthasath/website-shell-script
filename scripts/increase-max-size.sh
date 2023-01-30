#!/bin/bash

# Prompt for the upload max filesize
read -p "Enter the new maximum size for upload_max_filesize (in MB): " upload_max_filesize

# Prompt for the post max size
read -p "Enter the new maximum size for post_max_size (in MB): " post_max_size

# Prompt for the path to php.ini
read -p "Enter the path to php.ini: " file_path

# Check if the file exists
if [ ! -f $file_path ]; then
  echo "Error: $file_path does not exist."
  exit 1
fi

# Create a backup of the file with a timestamp
backup_file="$file_path-$(date +%Y%m%d%H%M%S).bak"
cp $file_path $backup_file

# Set the new maximum size in php.ini
sed -i \
-e "s/^\(\s*upload_max_filesize\s*=\s*\).*$/\1${upload_max_filesize}M/" \
-e "s/^\(\s*post_max_size\s*=\s*\).*$/\1${post_max_size}M/" \
$php_ini_path

# Restart Apache to apply the changes
service apache2 restart