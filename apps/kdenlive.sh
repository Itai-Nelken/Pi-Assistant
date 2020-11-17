#!/bin/bash  

clear
echo "this script will help you install or remove kdenlive video editor."
PS3='Please enter the number for install or remove (1 - 2): '
options=("install" "remove")
select opt in "${options[@]}"
do
    case $opt in



        "install")

echo "$(tput setaf 3)installing kdenlive...$(tput sgr 0)"
sudo apt update || error "error occured! are you connected to the internet?"
sudo apt install -y kdenlive || error "error occured! are you connected to the internet?"
echo "$(tput setaf 2)kdenlive installed$(tput sgr 0)"

            break
            ;;

 "remove")

echo "$(tput setaf 3)removing kdenlive...$(tput sgr 0)"
sudo apt remove -y kdenlive || error "error occured! can't remove kdenlive"
clear
echo "$(tput setaf 2)kdenlive removed$(tput sgr 0)"

            break
            ;;

      *) echo "invalid option $REPLY";;
    esac
done

sleep 1
clear
