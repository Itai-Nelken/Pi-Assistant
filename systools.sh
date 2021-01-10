#!/bin/bash 

function error {
  echo -e "\e[91m$1\e[39m"
}

#variables
#DIRECTORY="$HOME/Pi-Assistant"
#APPS="$HOME/Pi-Assistant/apps"
DIRECTORY="$HOME/Documents/github/Pi-Assistant(test)" #for testing purposes only
APPS="$HOME/Documents/github/Pi-Assistant(test)/apps" #for testing purposes only

echo "this script will help you install or remove audacity."
PS3='Please enter the number for install or remove (1 - 3): '
options=("autoremove" "autoclean" "fix broken install" "clear swap" "back to main menu")
select opt in "${options[@]}"
do
    case $opt in



    "autoremove")

sudo apt autoremove -y || error "error occured!"

            break
            ;;
   
   "autoclean")  
   
sudo apt autoclean || error "error occured!"
sudo apt clean || error "error occured!"
   
            break
            ;;

  "fix broken install")

sudo apt install -f || error "error occured!"

            break
            ;;

 "clear swap")

echo checking space used.
free -m || error "error occured!"

read -p "is there enough free space in ram to move swap contents to it (y/n)?" choice
case "$choice" in 
  y|Y ) echo "clearing swap..."; sudo swapoff -a; sudo chmod 600 /var/swap; sudo mkswap /var/swap; sudo swapon -a;;
  n|N ) echo "$(tput setaf 1)aborting.$(tput sgr 0)"   ;;
  * ) echo "invalid";;
esac

echo "$(tput setaf 2)operation complete.$(tput sgr 0)" 

            break
            ;;

"back to main menu")
   
$DIRECTORY/main.sh

            break
            ;;

       *) echo "invalid option $REPLY";;
    esac
done     

sleep 2
clear
