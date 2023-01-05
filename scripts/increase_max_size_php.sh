#!/bin/bash

upload=$1
post=$2

sed -i \
-e "s/\(upload_max_filesize = \).*/\1$1/" \
-e "s/\(post_max_size = \).*/\1$2/" \
php.ini