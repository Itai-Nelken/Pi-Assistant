#!/bin/bash

function error {
  echo -e "\e[91m$1\e[39m"
}

#variables
DIRECTORY="$HOME/Pi-Assistant"
APPS="$HOME/Pi-Assistant/apps"

echo "this script will help you update or uninstall Pi-Assistant."
PS3='Please enter the number above for operation you would like to perform (1 - 3): '
options=("update Pi-Assistant" "uninstall Pi-Assistant" "back to main menu")
select opt in "${options[@]}"
do
    case $opt in


        "update Pi-Assistant")
        
source $DIRECTORY/updater.sh

            break
            ;;


        "uninstall Pi-Assistant")
        
$DIRECTORY/uninstall.sh

            break
            ;;



 
        "back to main menu")

$DIRECTORY/main.sh --no-internet

            break
            ;;




        *) echo "invalid option $REPLY";;
    esac
done
