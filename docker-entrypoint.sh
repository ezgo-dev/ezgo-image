#!/bin/bash
set -e

echo $(ip r)

DEFAULT_GATEWAY=`ip r | grep default | cut -d ' ' -f 3`
echo "Gateway: $DEFAULT_GATEWAY"

if ( ! ping -q -w 1 -c 1 "${DEFAULT_GATEWAY}" > /dev/null 2>&1 ); then
	echo "Internet test failed."
	echo "RESULT:"
	ping -q -w 1 -c 1 "${DEFAULT_GATEWAY}"
else
	echo "Internet test passed."
fi

if [ "$1" = 'respin' ]; then

	if [ -z "$2" ]; then
		echo "An iso image must be selected!"
		exit 1
	else
		# If node is not present
		if [ -d /dev/loop0 ]; then
			# Make node for respin
			mknod /dev/loop0 b 7 0
		fi

		echo "Images found in folder:"
		ls /docker-input/

		echo "Starting process..."

		# argument setted?
		if [ -z "$3" ]; then
			echo "No special arguments..."
			./build.sh "/docker-input/$2" 
		else
			echo "Kernel arguments found!"
			echo "$@"
			echo "./build.sh /docker-input/$2 $3 $4"
			./build.sh "/docker-input/$2" $3 $4
		fi

		FILE=$2
		# Remove path from file
		FILECLEAN="${FILE##*/}"
		# Today date
		NOW=$(date +"%Y%m%d")

		rename -f -v -e s/linuxium/ezgo-$(date +%Y%m%d%H%M)/ *.iso
	    	mv ezgo-* "/docker-output/"
		cp isorespin.log "/docker-output/"
	fi
	
	exit 0
fi

exec "$@"
