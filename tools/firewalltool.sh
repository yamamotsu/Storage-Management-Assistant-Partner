#!/bin/bash

CURRENT_DIR=$(cd $(dirname $0); pwd)
IP_ADDR=$(sh $CURRENT_DIR/ip_get.sh)
NETWORK_ADDR=$(bash $CURRENT_DIR/ip_get.sh network)
echo $NETWORK_ADDR
PORT=$1
DELETE=$2
if [ -z "$PORT" ]
then
	PORT=8080
fi
echo "$IP_ADDR:$PORT"

if [ "$DELETE" != "delete" ]; then
	if [ -z "$(sudo ufw status | grep ${PORT}.*ALLOW.*$NETWORK_ADDR)" ]; then
		echo "nothing the firewall rule"
		sudo ufw allow from $NETWORK_ADDR to any port $PORT
		sudo ufw reload
		sudo ufw status numbered
	else
		echo "the firewall rule has been existed."
		echo "nothing to do."
		sudo ufw status numbered
	fi
else
	
	if [ -z "$(sudo ufw status | grep ${PORT}.*ALLOW.*$NETWORK_ADDR)" ]; then
		echo "the firewall rule was not found."
		echo "nothing to do."
		sudo ufw status numbered
	else
		echo "delete the firewall rule"
		NUMBER=$(sudo ufw status numbered|grep ^.*${PORT}.*ALLOW.*${NETWORK_ADDR}.*\$|sed "s/^[^0-9]*\([0-9]*\).*/\1/")
		echo $NUMBER
		sudo ufw delete $NUMBER
	fi
fi

