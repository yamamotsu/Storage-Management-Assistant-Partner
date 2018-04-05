#!/bin/bash

CURRENT_DIR=$(cd $(dirname $0); pwd)
IPADDR=`sh $CURRENT_DIR/tools/ip_get.sh`
PORT=$1
if [ -z "$PORT" ]
then
	PORT=8080
fi
URL="http://$IPADDR:$PORT"

echo "Starting SMAP Server at $IPADDR:$PORT"
node $CURRENT_DIR/server.js $PORT
