#!/bin/bash

function error {
  echo -e "\e[91m$1\e[39m"
}

#check main.sh $APPVER for a list of everything to change
APPVER="v1.3.4"

#variables
DIRECTORY="$HOME/Pi-Assistant"
APPS="$HOME/Pi-Assistant/apps"

cd $DIRECTORY
#variables containing the command for each app
gparted="$APPS/gparted.sh"
chromium="$APPS/chromium.sh"
firefox="$APPS/firefox.sh"
blender="$APPS/blender.sh"
audacity="$APPS/audacity.sh"
snap="$APPS/snap.sh"
inkscape="$APPS/inkscape.sh"
ssr="$APPS/ssr.sh"
kdenlive="$APPS/kdenlive.sh"
gsysmon="$APPS/gsysmon.sh"
flatpak="$APPS/flatpak.sh"
etcher="$APPS/etcher.sh"
zoom="$APPS/zoom.sh"
box86="$APPS/box86.sh"
flowblade="$APPS/flowblade.sh"
back="$APPS/appinstaller.sh"
main="sleep 0.00001"


#dialog variables
HEIGHT=18
WIDTH=130
CHOICE_HEIGHT=20
BACKTITLE="Pi-Assistant $APPVER:::Itai Nelken:::"
TITLE="Application Installer"
MENU="Choose one of the following apps to install/uninstall:"

OPTIONS=(1 "back to main menu"
         2 "Gparted - Partiton editor."
         3 "Chromium - The open source version of google chrome."
         4 "Firefox-esr - firefox-esr web browser."
         5 "Blender - free and open source 3D creation suite."
         6 "audacity - free and open-source digital audio editor and recording application software."
         7 "snap & snap-store - app packages Linux that are secure, cross‐platform and dependency‐free."
         8 "inkscape - free and open-source vector graphics editor."
         9 "SimpleScreenRecorder - Qt-based screencast software made for Linux."
         10 "Kdenlive - free, open-source, and powerful video editing software"
         11 "Flowblade - multitrack non-linear video editor released under GPL3 license. performs slightly better the kdenlive on a pi4"
         12 "GNOME system monitor - powerful system monitor with an easy-to-use interface."
         13 "flatpak - app packaging system that runs each app isolated from the rest of the system."
         14 "Balena Etcher - Flash OS images to SD cards & USB drives, safely and easily. (arm versions compiled by me)"
         15 "Zoom - the popular video conferencing software. Linux x86 version running with box86."
         16 "box86 -  Linux Userspace x86 Emulator with a twist.")

CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear
case $CHOICE in
        1)
            $main
            ;;
        2)
            $gparted; $back
            ;;
        3)
            $chromium; $back
            ;;
        4)
            $firefox; $back
            ;;
        5)
            $blender; $back
            ;;
        6)
            $audacity; $back
            ;;
        7)
            $snap; $back
            ;;
        8)
            $inkscape; $back
            ;;
        9)
            $ssr; $back
            ;;
        10) 
            $kdenlive; $back
            ;;
        11)
            $flowblade; $back
            ;;
        12)
            $gsysmon; $back
            ;;
        13)
            $flatpak; $back
            ;;
        14)
            $etcher; $back
            ;;
        15)
            $zoom; $back
            ;;
        16)
            $box86; $back
            ;;
esac
