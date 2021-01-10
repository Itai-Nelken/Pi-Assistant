#!/bin/bash 

function error {
  echo -e "\e[91m$1\e[39m"
}

#variables
#DIRECTORY="$HOME/Pi-Assistant"
#APPS="$HOME/Pi-Assistant/apps"
DIRECTORY="$HOME/Documents/github/Pi-Assistant(test)" #for testing purposes only
APPS="$HOME/Documents/github/Pi-Assistant(test)/apps" #for testing purposes only

echo "this script will help you install or remove GNOME system monitor."
PS3='Please enter the number for install or remove (1 - 3): '
options=("install" "remove" "back to app installer")
select opt in "${options[@]}"
do
    case $opt in



        "install")

sudo apt update || error "Failed to update repos (not critical)."
sudo apt install -y gnome-system-monitor || error "Failed to install gnome-system-monitor!"

            break
            ;;
   
   "remove")  
   
sudo apt purge -y gnome-system-monitor || error "failed to remove gnome-system-monitor!"
   
            break
            ;;

"back to app installer")
   
$APPS/appinstaller.sh

            break
            ;;

       *) echo "invalid option $REPLY";;
    esac
done     

sleep 2
clear
