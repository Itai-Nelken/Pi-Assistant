#!/bin/bash

function error() {
  echo -e "\e[91m$1\e[39m"
}

#variables
DIRECTORY="$HOME/Pi-Assistant"
APPS="$HOME/Pi-Assistant/apps"

echo "this script will help you execute system maintenance tasks"
PS3='Please enter the number above for task you would like to perform (1 - 5): '
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

sudo apt -f install || error "error occured!"

            break
            ;;



        "clear swap")

echo -e "$(tput setaf 3)$(tput bold)WARNING: clearing swap isn't recommended!$(tput sgr 0)"
echo "Do you want to continue? [y/n]"
read answer
if [[ "$answer" == y ]]; then
    echo "clearing swap..."
    sudo systemctl restart dphys-swapfile
    echo -ne '(0%)[##                        ](100%)\r'
    sleep 0.1
    echo -ne '(0%)[######                    ](100%)\r'
    sleep 0.5
    echo -ne '(0%)[###############           ](100%)\r'
    sleep 0.3
    echo -ne '(0%)[########################  ](100%)\r'
    sleep 0.1
    echo -ne '(0%)[##########################](100%)\r'
    sleep 0.8
    clear
    echo -e "$(tput bold)DONE!$(tput sgr 0)"
else
    $DIRECTORY/main.sh --no-internet
fi

            break
            ;;



     "back to main menu")

sleep 0.0001

            break
            ;;




        *) echo "invalid option $REPLY";;
    esac
done
