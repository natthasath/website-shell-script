#!/bin/bash

find /var/www | grep "wp-includes/version.php" > /tmp/wp-list.txt

for f in $(cat /tmp/wp-list.txt); do

  ver=$(grep "wp_version =" $f | cut -d\' -f2);

  if [ "$ver" != "$LATEST_WORDPRESS" ]; then

   echo "$ver - $f";

  fi;

done