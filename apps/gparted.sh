#!/bin/bash  

function error {
  echo -e "\e[91m$1\e[39m"
}

#variables
#DIRECTORY="$HOME/Pi-Assistant"
#APPS="$HOME/Pi-Assistant/apps"
DIRECTORY="$HOME/Documents/github/Pi-Assistant(test)" #for testing purposes only
APPS="$HOME/Documents/github/Pi-Assistant(test)/apps" #for testing purposes only

clear
echo "this script will help you install or remove gparted."
PS3='Please enter the number for install/remove (1 - 3): '
options=("install" "remove" "back to app installer")
select opt in "${options[@]}"
do
    case $opt in



        "install")

echo "$(tput setaf 3)installing gparted...$(tput sgr 0)"
sudo apt update || error "failed to update repositories (not critical)."
sudo apt install -y gparted || error "Failed to install gparted!"

            break
            ;;

 "remove")

echo "$(tput setaf 3)removing gparted...$(tput sgr 0)"
sudo apt purge -y gparted || error "Failed to remove gparted"
sleep 2
clear

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
