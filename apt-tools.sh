#!/bin/bash  

clear
echo "this script will help you run apt tools."
PS3='Please enter the number for operation you want to perform (1 - 2): '
options=("autoremove" "autoclean")
select opt in "${options[@]}"
do
    case $opt in



        "autoremove")

sudo apt autoremove || error "error occured!"

            break
            ;;

 "autoclean")

sudo apt autoclean|| error "error occured!"


            break
            ;;

      *) echo "invalid option $REPLY";;
    esac
done

sleep 1
clear
