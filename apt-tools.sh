#!/bin/bash  

function error {
  echo -e "\\e[91m$1\\e[39m"
  exit 1
}

clear
echo "this script will help you run apt tools."
PS3='Please enter the number for operation you want to perform (1 - 3): '
options=("autoremove" "autoclean" "clear swap")
select opt in "${options[@]}"
do
    case $opt in



        "autoremove")

sudo apt autoremove || error "error occured!"

            break
            ;;

 "autoclean")

sudo apt autoclean || error "error occured!"
sudo apt clean || error "error occured!"


            break
            ;;


        "clear swap")
echo checking space used.
free -m || error "error occured!"

read -p "is there enough free space in ram to move swap contents to it (y/n)?" choice
case "$choice" in 
  y|Y ) echo "clearing swap..." && sudo swapoff -a && sudo swapon -a;;
  n|N ) echo "$(tput setaf 1)aborting.$(tput sgr 0)"   ;;
  * ) echo "invalid";;
esac

echo "$(tput setaf 2)operation complete.$(tput sgr 0)" 
           
           break
            ;;

      *) echo "invalid option $REPLY";;
    esac
done

sleep 1
clear
