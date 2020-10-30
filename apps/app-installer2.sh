#!/bin/bash  

echo more apps
PS3='Please enter the number for application you would like to install/update/remove (1 - 4): '
options=("kdenlive" "gnome-system-monitor" "flatpak" "back1p")
select opt in "${options[@]}"
do
    case $opt in



        "kdenlive")

./kdenlive.sh
clear
            break
            ;;

  "gnome-system-monitor")

./gsystem-monitor.sh
clear
            break
            ;;


        "flatpak")

./flatpak+flathub.sh.sh
clear
            break
            ;;


 ""back1p"")

./app-installer.sh
            break
            ;;



        *) echo "invalid option $REPLY";;
    esac
done

sleep 1
cd ..
./system-tools-v1.1.1.sh

