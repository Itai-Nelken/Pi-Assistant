#!/bin/bash  

clear
echo "this script will help you install or remove inkscape."
PS3='Please enter the number for install or remove (1 - 2): '
options=("install" "remove")
select opt in "${options[@]}"
do
    case $opt in



        "install")

echo "$(tput setaf 3)installing inkscape...$(tput sgr 0)"
sudo apt update || error "error occured! are you connected to the internet?"
sudo apt install -y inkscape || error "error occured! are you connected to the internet?"

            break
            ;;

 "remove")

echo "$(tput setaf 3)removing inkscape...$(tput sgr 0)"
sudo apt remove -y inkscape || error "error occured! can't remove inkscape"

            break
            ;;

      *) echo "invalid option $REPLY";;
    esac
done

sleep 1
clear
