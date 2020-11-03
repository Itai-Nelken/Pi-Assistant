#!/bin/bash

clear

#main menu
echo this script will help you install applications, update the system, and much more
echo press [Ctrl-C] to exit
PS3='Please enter the number above for operation you would like to perform (1 - 5): '
options=("update" "change-password" "install-applications" "apt-tools" "other")
select opt in "${options[@]}"
do
    case $opt in


        "update")
        
./update.sh
            break
            ;;


        "change-password")

./change-password.sh

clear

            break
            ;;



 
        "install-applications")

clear

cd ~/Pi-Assistant/apps/
./app-installer.sh

clear

            break
            ;;



        "apt-tools")

./apt-tools.sh
clear

            break
            ;;

     "other")

./other.sh
read -p "[Ctrl-C] to exit"


            break
            ;;




        *) echo "invalid option $REPLY";;
    esac
done


clear
sleep 1
echo operation complete. When ready, 
read -p "press [Enter] to return to main menu or [Ctrl-C] to exit"
./main2.sh
