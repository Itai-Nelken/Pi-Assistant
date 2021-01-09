#!/bin/bash  

echo this script will help you install, and remove applications.
PS3='Please enter the number for application you would like to install/update/remove (1 - 9): '
options=("gparted" "chromium-web-browser" "firefox-esr" "blender" "audacity" "snapd & snap-store" "inkscape" "SimpleScreenRecorder" "more-apps")
select opt in "${options[@]}"
do
    case $opt in



        "gparted")

./gparted.sh
clear
            break
            ;;

  "chromium-web-browser")

./chromium.sh
clear
            break
            ;;

      "firefox-esr")

./firefox-esr.sh
clear

            break
            ;;
            
          
 "blender")

./blender.sh
clear

            break
            ;;

"audacity")

./audacity.sh
clear

            break
            ;;

"snapd & snap-store")

./snapd-snap-store.sh
clear

            break
            ;;

"inkscape")

./inkscape.sh
clear

            break
            ;;

"SimpleScreenRecorder")

./SSR.sh
clear

            break
            ;;

"more-apps")

./app-installer2.sh
clear

            break
            ;;


        *) echo "invalid option $REPLY";;
    esac
done

sleep 1
cd ..

