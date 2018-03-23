#!/bin/bash

ISOFILE=$1
KERNEL=$2
KERNELVERSION=$3

# KERNELARGS=" -u "

if [[ $KERNEL == "-k" ]] ; then
    echo "Setting kernel version..."
    KERNELARGS=" --kernel $KERNELVERSION "
fi

# If missing, download latest version of the script that will respin the ISO
if [ ! -f isorespin.sh ]; then
	echo "Isorespin script not found. Downloading it..."
	wget -O isorespin.sh "https://drive.google.com/uc?export=download&id=0B99O3A0dDe67S053UE8zN3NwM2c"
fi

installpackages=""
# Packages that will be installed:
# Thermal management stuff and packages
installpackages+="thermald "
installpackages+="tlp "
installpackages+="tlp-rdw  "
installpackages+="powertop "
# Nvidia
installpackages+="nvidia-390 "
installpackages+="nvidia-prime "
# Streaming and codecs for correct video encoding/play
installpackages+="va-driver-all "
installpackages+="vainfo "
installpackages+="gstreamer1.0-libav "
installpackages+="gstreamer1.0-vaapi "

# for ezgo
installpackages+="vim vim-gtk gksu kdesudo zenity im-switch chromium-browser language-pack-zh-hant firefox-locale-zh-hant language-pack-zh-hant-base language-pack-gnome-zh-hant language-pack-kde-zh-hant kde-l10n-zhtw firefox "
# hime
installpackages+="hime hime-qt5-immodule hime-gtk3-immodule hime-chewing hime-anthy "
# sigil, kazam, blender, and ffdiaporama
installpackages+="sigil kazam blender ffdiaporama "
# kdegames
installpackages+="supertux supertuxkart pingus tuxmath tuxtype "
# scribus
installpackages+="scribus "
installpackages+="tuxpaint mypaint inkscape gimp digikam gthumb "
installpackages+="openshot kdenlive vlc totem cheese guvcview brasero amarok audacious audacity tuxguitar musescore "
installpackages+="qtqr furiusisomount hydrogen winff qjackctl ardour filezilla pidgin remmina pcmanx-gtk2 stellarium kayali bkchem ghemical avogadro gchempaint pymol scratch "
# wine
installpackages+="wine-stable winetricks "

# Packages that will be removed:
removepackages="kmail kontact rekonq korganizer ubuntu-release-upgrader-qt update-manager-core muon-notifier "

chmod +x isorespin.sh
sync;sync;sync

./isorespin.sh -i $ISOFILE \
	$KERNELARGS \
	-r "ppa:graphics-drivers/ppa" \
	-p "$installpackages" \
	-f wrapper-network.sh \
	-f wrapper-nvidia.sh \
	-f ezgo \
	-c wrapper-network.sh \
	-c wrapper-nvidia.sh \
	-c ezgo/ezgo.sh
