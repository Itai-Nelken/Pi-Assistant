#!/bin/bash

#start updater

#while true; do
#	case $yn in
#		[Yy]* ) ./updater.sh; break;;
#	    [Nn]* ) echo skipping updater
#	    * ) echo "please answer yes or no.";;
#	esac
#done


#about & credits
echo "$(tput setaf 3)system-tools v1.1.1 $(tput sgr 0)" 
echo "$(tput setaf 3)by Itai Nelken $(tput sgr 0)"
sleep 1 

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

cd ~/Desktop/system-tools-beta/apps/
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
clear
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
./system-tools-v1.1-beta.sh

