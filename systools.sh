#!/bin/bash

function error() {
  echo -e "\e[91m$1\e[39m"
}

function error-sleep() {
  echo -e "\e[91m$1\e[39m"
  echo "press [CTRL+C] to exit."
  sleep $2
}

#variables
DIRECTORY="$HOME/Pi-Assistant"
APPS="$HOME/Pi-Assistant/apps"

echo "this script will help you execute system maintenance tasks"
PS3='Please enter the number above for task you would like to perform (1 - 6): '
options=("autoremove" "autoclean" "fix broken install" "clear swap" "fix duplicates in sources.list" "back to main menu")
select opt in "${options[@]}"
do
    case $opt in


        "autoremove")
        
sudo apt autoremove -y || error-sleep "error occured!" 10

            break
            ;;


        "autoclean")

sudo apt autoclean || error-sleep "error occured!" 10
sudo apt clean || error "error occured!"

            break
            ;;



 
        "fix broken install")

sudo apt -f install || error-sleep "error occured!" 10
sudo dpkg --configure -a || error "error occured!"

            break
            ;;



        "clear swap")
while true; do
    echo -e "$(tput setaf 3)$(tput bold)WARNING: clearing swap isn't recommended!$(tput sgr 0)"
    read -p "Do you want to continue? [y/n]" answer
    if [[ "$answer" == "y" ]]; then
    echo "clearing swap..."
    sudo systemctl restart dphys-swapfile || error-sleep "Failed to clear swap!" 10
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
    clear -x
    echo -e "$(tput bold)DONE!$(tput sgr 0)"
    break
elif [[ "$answer" == "n" ]]; then
    #echo "$DIRECTORY/main.sh --no-internet"
    break
else
    echo "invalid option '$answer'."
fi
done

            break
            ;;

     "fix duplicates in sources.list")
while true; do
    echo -e "$(tput setaf 3)$(tput bold)WARNING: this option is experimental and isn't recommended! if your sources.list\ngets messed up because of this script, you can delete it\nand replace it with the backup this script creates at '/etc/apt/sources.list.bak'.$(tput sgr 0)"
    read -p "Do you want to continue? [y/n]" answer
    if [[ "$answer" == "y" ]]; then
        echo "deleting duplicates in '/etc/apt/sources.list'..."
        echo -ne '(0%)[#                         ](100%)\r'
        sudo rm -f ~/sources.list /etc/apt/sources.list.bak
        sleep 0.3
        #the part that actually deletes the dupicates
        awk '/^$/ {print; next} {if ($1 in a) next; a[$1]=$0; print}' /etc/apt/sources.list > ~/sources.list
        echo -ne '(0%)[#########                 ](100%)\r'
        sleep 0.2
        sudo mv /etc/apt/sources.list /etc/apt/sources.list.bak
        echo -ne '(0%)[###################       ](100%)\r'
        sleep 0.1
        sudo mv ~/sources.list /etc/apt/sources.list
        echo -ne '(0%)[########################  ](100%)\r'
        sleep 0.1
        echo -ne '(0%)[######################### ](100%)\r'
        sleep 0.1
        echo -ne '(0%)[##########################](100%)\r'
        sleep 0.7
        echo -e "$(tput bold)DONE!$(tput sgr 0)"
        echo "there is a backup of your previous sources.list in $(tput bold)/etc/apt/sources.list.bak$(tput sgr 0)"
        sleep 10
        break
    elif [[ "$answer" == "n" ]]; then
        sleep 0.001
        break
    else
        echo "invalid option '$answer'."
    fi
done

     "back to main menu")

sleep 0.0001

            break
            ;;




        *) echo "invalid option $REPLY";;
    esac
done
