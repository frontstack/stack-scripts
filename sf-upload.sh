#!/bin/bash
#
# SourceForge release upload 
#

remote_path='/home/frs/project/frontstack/releases'
mayor_version=$1
local_file="$2"

if [ -z $mayor_version ] || [ -z $local_file ]; then
  echo 'Missing required arguments. Cannot continue'
  exit 1
fi

if [ ! -f $local_file ]; then
  echo "Cannot find the local file..."
  exit 1
fi

echo 'Publishing the release...'
scp "$local_file" "h2non@frs.sourceforge.net:$remote_path/$mayor_version/"