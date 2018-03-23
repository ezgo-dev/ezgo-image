#!/bin/bash

# Find current directory
SCRIPTPATH=$( cd $(dirname $0) ; pwd -P )
INPUTDIR="$SCRIPTPATH""/origin"
OUTPUTDIR="$SCRIPTPATH""/destination"
ORIGINDIR="origin/"
ISO=${1#$ORIGINDIR} # Remove 'origin/' prefix path if found
PAR1=$2
PAR2=$3

if $(docker image inspect ezgo-image-respin >/dev/null 2>&1); then
	echo "Found local image!"
	IMAGENAME="ezgo-image-respin"
else
	echo "Build docker image first!"
	exit 1
fi

echo "Iso: $ISO"
echo "Input dir: $INPUTDIR"
echo "Output dir: $OUTPUTDIR"

# Refresh container
docker rm $(docker ps -aq --filter name=ezgo-image-respin-container)
# Run command
docker run -t --cap-add MKNOD -v "$INPUTDIR":/docker-input -v "$OUTPUTDIR":/docker-output --privileged --name ezgo-image-respin-container "$IMAGENAME" respin $ISO $PAR1 $PAR2
