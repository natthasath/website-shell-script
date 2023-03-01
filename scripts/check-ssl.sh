#!/bin/bash

# Get the domain name from user input
read -p "Enter the domain name: " domain

# Run the curl command and save the output to a variable
output=$(curl -Iv "https://$domain" 2>&1)

# Check if the SSL certificate is valid
if echo "$output" | grep -q "SSL certificate verify ok."
then
    echo "SSL certificate is valid:"
    echo "$output" | grep "Server certificate"
else
    echo "SSL certificate is invalid or could not be verified."
fi