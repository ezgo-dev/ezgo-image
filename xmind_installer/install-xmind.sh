#!/bin/bash

user=`whoami`
(cd .xmind_installer;sudo ./xmind-installer.sh $user)
