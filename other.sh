#!/bin/bash

#variables
DIRECTORY="$HOME/Pi-Assistant"
APPS="$HOME/Pi-Assistant/apps"


echo "this script will help you update or uninstall Pi-Assistant."
PS3='Please enter the number above for operation you would like to perform (1 - 5): '
options=("update Pi-Assistant" "uninstall Pi-Assistant" "back to main menu")
select opt in "${options[@]}"
do
    case $opt in


        "update Pi-Assistant")
        
$DIRECTORY/updater.sh
sleep 1
clear
echo "$(tput setaf 6)you need to relaunch Pi-Assistant to apply the update. $(tput sgr 0)"
read -p "[Ctrl-C] to exit"

            break
            ;;


        "uninstall Pi-Assistant")
        
$DIRECTORY/uninstall.sh

            break
            ;;



 
        "back to main menu")

$DIRECTORY/main.sh

            break
            ;;




        *) echo "invalid option $REPLY";;
    esac
done
