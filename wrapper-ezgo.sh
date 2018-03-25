#!/bin/bash
# run all scripts in this folder

for i in `ls /usr/local/bin/ezgo/*.sh`
do
	/bin/bash $i
done

rm -rf /usr/local/bin/ezgo
rm -f wrapper-ezgo.sh
