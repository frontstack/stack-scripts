#!/bin/bash
#
# SourceForge release upload 
#

$REMOTE_PATH='/home/frs/project/h2non/frontstack/releases/'
$PASSWORD=$1
$MAYORVERSION=$2
$FILENAME=$3
$LOCALFILE="$4"

if [ -z $password ] || [ -z $MAYORVERSION ] || [ -z $FILENAME ]; then
  echo 'Missing required arguments. Cannot continue'
  exit 1
fi

if [ ! -f $LOCALFILE ]; then
  echo "Cannot find the local file..."
  exit 1
fi

echo 'Publishing the release...'
scp h2non:$PASSWORD@frs.sourceforce.net:$REMOTE_PATH