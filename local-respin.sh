#!/bin/bash

# Find current directory
SCRIPTPATH=$( cd $(dirname $0) ; pwd -P )
INPUTDIR="$SCRIPTPATH""/origin"
OUTPUTDIR="$SCRIPTPATH""/destination"
ORIGINDIR="origin/"
ISO=${1#$ORIGINDIR} # Remove 'origin/' prefix path if found
PAR1=$2
PAR2=$3

# If missing, download latest version of the script that will respin the ISO
if [ ! -f isorespin.sh ]; then
	echo "Isorespin script not found. Downloading it..."
	wget -O isorespin.sh "https://drive.google.com/uc?export=download&id=0B99O3A0dDe67S053UE8zN3NwM2c"
fi

echo "Iso: $ISO"
echo "Input dir: $INPUTDIR"
echo "Output dir: $OUTPUTDIR"

if [ -z "$1" ]; then
	echo "An iso image must be selected!"
	exit 1
fi

# If node is not present
if [ -d /dev/loop0 ]; then
	# Make node for respin
	mknod /dev/loop0 b 7 0
fi

echo "Images found in folder:"
ls $INPUTDIR/

echo "Starting process..."

# argument setted?
if [ -z "$2" ]; then
	echo "No special arguments..."
	echo "./build.sh $1"
	./build.sh $1 
else
	echo "Kernel arguments found!"
	echo "$@"
	echo "./build.sh $1 $2 $3"
	./build.sh $1 $2 $3
fi

FILE=$1
# Remove path from file
FILECLEAN="${FILE##*/}"
# Today date
NOW=$(date +"%Y%m%d")

rename -f -v -e s/linuxium/ezgo-$(date +%Y%m%d%H%M)/ *.iso
mv ezgo-* "$OUTPUTDIR/"
cp isorespin.log "$OUTPUTDIR/"
