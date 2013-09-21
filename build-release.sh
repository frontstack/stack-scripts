#!/bin/bash

env_path="$(echo `dirname $0`)/../frontstack-env-x64" #`dirname $(readlink -f "$0")`"/../frontstack-env-x64"
output_path="../releases"

read -p "Generate new release? (y/N): " input

case $input in n|N|No|NO)
  echo "Exiting."
  exit 0
;;
esac

read -p "Enter the version number? (e.g: 1.0.0): " version

if [ -z $version ]; then
  echo "You must enter the release version number. Exiting"
  exit 0
fi

if [ ! -d $output_path ]; then
  mkdir $output_path
fi

echo "Generating the release file in: $output_path"
sleep 1

cd "$env_path"

tar cvzf "$output_path/frontstack-$version-x64.tar.gz" \
--exclude .git \
--exclude "*.a" \
--exclude "packages/" \
--exclude .DS_Store \
*

