#!/bin/bash

# modify grub
sed -i 's/OS=.*/OS=\"ezgo 14(kde-amd64)\"/' /etc/grub.d/10_linux

# add ezgo ppa
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4CD565B5
echo "deb http://free.nchc.org.tw/ezgo-core ezgo13 main" | tee /etc/apt/sources.list.d/ezgo.list
apt update 2>&1

# install ezgo package
apt install -y ezgo-artwork ezgo-menu ezgo-kde5 ezgo-phet ezgo-usgs ezgo-npa ezgo-chem ezgo-gsyan ezgo-wordtest ezgo-misc-arduino-rules ezgo-misc-decompress ezgo-misc-desktop-files ezgo-misc-furiusisomount ezgo-misc-inkscape ezgo-misc-installer ezgo-misc-kdenlive ezgo-misc-klavaro ezgo-misc-ktuberling ezgo-misc-qtqr ezgo-misc-winff 2>&1

apt purge -y akonadi-backend-mysql mysql-server kmail konversation ktnef kontact rekonq korganizer ubuntu-release-upgrader-qt update-manager-core muon-notifier

# ezgo wallpaper theme
sed -i 's/defaultWallpaperTheme=.*/defaultWallpaperTheme=ezgo/' /usr/share/plasma/desktoptheme/*/metadata.desktop
sed -i 's/defaultWallpaperWidth=.*/defaultWallpaperWidth=1920/' /usr/share/plasma/desktoptheme/*/metadata.desktop
sed -i 's/defaultWallpaperHeight=.*/defaultWallpaperHeight=1080/' /usr/share/plasma/desktoptheme/*/metadata.desktop

cp /usr/share/ezgo/ezgo-kde5/defaultPanel.layout.js /usr/share/plasma/layout-templates/org.kde.plasma.desktop.defaultPanel/contents/layout.js
# ezgo-kde5 did the below line
# ln -s /usr/share/ezgo/ezgo-artwork/default-dm/1920x1080.png /usr/share/plasma/look-and-feel/org.kde.breeze.desktop/contents/components/artwork/background.png
cp /usr/share/ezgo/ezgo-kde5/desktop.layout.js /usr/share/plasma/shells/org.kde.plasma.desktop/contents/layout.js

ln -s /etc/xdg/menus/kf5-applications.menu /etc/xdg/menus/ezgo-applications.menu

# add plasmarc in /etc/skel/.config
cat <<EOT >> /etc/skel/.config/plasmarc
[Theme]
name=ezgo

kdeglobals
[KDE]
LookAndFeelPackage=org.kde.ezgo.desktop
EOT

