#!/bin/bash

if [[ -e /tmp/flag ]]; then
	echo "file exists, now reading from it"
	read -r flag < /tmp/flag
else
	echo "file doesn't exist, touching it ;)"
	touch /tmp/flag
fi 
	
if [[ "$flag" -eq 1 ]]; then
	#echo "flag == 1"
	wpctl status | grep 'Audio Source' | awk '{print $2}' | while read -r node; do
	    wpctl set-mute "$node" 1
	done
	truncate -s 0 /tmp/flag
	#echo "echo 0 >/tmp/flag"
	echo "0" >/tmp/flag
elif [[ "$flag" -eq 0 ]]; then
	#echo "flag == 0"
	wpctl status | grep 'Audio Source' | awk '{print $2}' | while read -r node; do
	    wpctl set-mute "$node" 0
	done
	truncate -s 0 /tmp/flag
	#echo "echo 1 >/tmp/flag"
	echo "1" >/tmp/flag
fi
