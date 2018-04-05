#!/bin/bash

CURRENT_DIR=$(cd $(dirname $0); pwd)
if [ -z "$1" ]
then
	/sbin/ifconfig 						|
	grep inet[^6]						|
	sed 's/.*inet[^6][^0-9]*\([0-9.]*\)[^0-9]*.*/\1/'	|
	grep -v '^127\.'
elif [ $1 = "netmask" ]
then
	/sbin/ifconfig									|
	grep inet[^6]									|
	grep -v '127\.'									|
	sed 's/.*inet[^6][^0-9]*[0-9.]*[^0-9]*netmask[^0-9]*\([0-9.]*\).*/\1/'
elif [ $1 = "network" ]
then
	ADDR_STR=$(sh $CURRENT_DIR/ip_get.sh)
	ADDR[0]=$(echo $ADDR_STR|sed 's/^\([0-9]*\)\..*$/\1/')
	ADDR[1]=$(echo $ADDR_STR|sed 's/^[0-9]*\.\([0-9]*\)\..*$/\1/')
	ADDR[2]=$(echo $ADDR_STR|sed 's/^[0-9]*\.[0-9]*\.\([0-9]*\)\..*$/\1/')
	ADDR[3]=$(echo $ADDR_STR|sed 's/^[0-9]*\.[0-9]*\.[0-9]*\.\([0-9]*\).*$/\1/')
	NETMASK=$(sh $CURRENT_DIR/ip_get.sh netmask)
	MASK[0]=$(echo $NETMASK|sed 's/^\([0-9]*\)\..*$/\1/')
	MASK[1]=$(echo $NETMASK|sed 's/^[0-9]*\.\([0-9]*\)\..*$/\1/')
	MASK[2]=$(echo $NETMASK|sed 's/^[0-9]*\.[0-9]*\.\([0-9]*\)\..*$/\1/')
	MASK[3]=$(echo $NETMASK|sed 's/^[0-9]*\.[0-9]*\.[0-9]*\.\([0-9]*\).*$/\1/')
	#echo "${MASK[0]},${MASK[1]},${MASK[2]},${MASK[3]}"

	COUNT=0
	for i in {0..3}; do
		for j in {0..7}; do
			if [ $(($((${MASK[i]}>>j))&1)) = 1 ]; then
				COUNT=$(($COUNT+1))
		       	fi
	 	done
	done
	#echo $COUNT

	for i in {0..3}
	do
		NETADDR[$i]=$((${ADDR[$i]}&${MASK[$i]}))
	done

	NETWORK="${NETADDR[0]}.${NETADDR[1]}.${NETADDR[2]}.${NETADDR[3]}"
	#echo $NETWORK

	NETWORK_ADDRESS="$NETWORK/$COUNT"

	echo $NETWORK_ADDRESS
fi
