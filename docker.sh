#!/bin/sh
sudo docker build -t="ezgo-image" .
sudo docker run -privileged -i -t ezgo-image ./ezgo-image --package="kubuntu-desktop"

