#!/bin/bash

# Download WP-CLI package
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# Make WP-CLI package executable
chmod +x wp-cli.phar

# Move WP-CLI package to PATH
sudo mv wp-cli.phar /usr/local/bin/wp

# Verify installation
wp --version