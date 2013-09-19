#!/bin/bash

ENV_PATH="$(echo `dirname $0`)/../frontstack-env-x64" #`dirname $(readlink -f "$0")`"/../frontstack-env-x64"
OUTPUT_PATH="../releases" #`dirname $(readlink -f "$0")`"/../releases/"

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

if [ ! -d $OUTPUT_PATH ]; then
  mkdir $OUTPUT_PATH
fi

echo "Generating the release file in: $OUTPUT_PATH"
sleep 1

cd "$ENV_PATH"

tar cvzf "$OUTPUT_PATH/frontstack-$version-x64.tar.gz" \
--exclude .git \
--exclude "*.a" \
*

