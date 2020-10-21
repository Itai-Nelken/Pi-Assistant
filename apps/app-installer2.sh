#!/bin/bash  

echo more apps
PS3='Please enter the number for application you would like to install/update/remove (1 - 2): '
options=("kdenlive" "gnome-system-monitor")
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


        *) echo "invalid option $REPLY";;
    esac
done

sleep 1
cd ..
./system-tools-v1.1-beta.sh

