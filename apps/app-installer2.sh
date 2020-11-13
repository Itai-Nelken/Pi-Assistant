#!/bin/bash  

clear
echo more apps
PS3='Please enter the number for application you would like to install/update/remove (1 - 4): '
options=("kdenlive" "gnome-system-monitor" "flatpak" "Balena Etcher" "back-1-page")
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

./flatpak+flathub.sh
clear
            break
            ;;

       "Balena Etcher")

./balenaetcher.sh
clear
            break
            ;;


 "back-1-page")

clear
./app-installer.sh
            break
            ;;



        *) echo "invalid option $REPLY";;
    esac
done



