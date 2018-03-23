#!/bin/bash
# run all scripts in this folder

for i in `ls ezgo/*.sh`
do
	if [ "$i" != "ezgo/ezgo.sh" ] ; then
		/bin/bash $i
	fi
done
