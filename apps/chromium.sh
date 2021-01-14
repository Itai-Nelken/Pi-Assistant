#!/bin/bash

function error {
  echo -e "\e[91m$1\e[39m"
}

#variables
DIRECTORY="$HOME/Pi-Assistant"
APPS="$HOME/Pi-Assistant/apps"

echo "this script will help you install or remove the special optimize chromium version for the rpi."
PS3='Please enter the number for install/remove (1 - 3): '
options=("install" "remove" "back to app installer")
select opt in "${options[@]}"
do
    case $opt in

"install")
           
sudo apt update || error "Failed to update repos (not critical)."
sudo apt install -y chromium-browser chromium-chromedriver chromium-codecs-ffmpeg-extra rpi-chromium-mods || error "Failed to install chromium!"
sleep 2

            break
            ;;

"remove")
   
sudo apt purge -y chromium-browser || error "Failed to remove chromium!"
sleep 2

            break
            ;;

"back to app installer")
   
$APPS/appinstaller.sh

            break
            ;;
           
    *) echo "invalid option $REPLY";;
    esac
done
sleep 1
