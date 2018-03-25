#!/bin/bash

sudo sed -i 's/LANG=\(.*\)/LANG=\"zh_TW.UTF-8\"/g' /etc/default/locale
sudo sed -i 's/LANGUAGE=\(.*\)/LANGUAGE=\"zh_TW\"/g' /etc/default/locale
