#!/bin/bash
#
# SourceForge release upload 
#

REMOTE_PATH='/home/frs/project/h2non/frontstack/releases'
MAYORVERSION=$1
LOCALFILE="$2"

if [ -z $MAYORVERSION ] || [ -z $LOCALFILE ]; then
  echo 'Missing required arguments. Cannot continue'
  exit 1
fi

if [ ! -f $LOCALFILE ]; then
  echo "Cannot find the local file..."
  exit 1
fi

echo 'Publishing the release...'
scp $LOCALFILE h2non@frs.sourceforge.net:"$REMOTE_PATH/$MAYORVERSION/"