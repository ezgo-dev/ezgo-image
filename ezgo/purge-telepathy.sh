#!/bin/bash

dpkg -l | grep telepathy | awk ' { print $2; } ' | xargs apt-get -y purge
