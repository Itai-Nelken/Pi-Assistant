#!/bin/bash  

clear
echo "this script will help you install or remove gnome-system-monitor."
PS3='Please enter the number for operation you want to perform (1 - 2): '
options=("install" "remove")
select opt in "${options[@]}"
do
    case $opt in



        "install")

sudo apt update || error "error occured! are you connected to the internet?"
sudo apt install -y gnome-system-monitor || error "error occured! are you connected to the internet?"

            break
            ;;

 "remove")

sudo apt remove -y gnome-system-monitor|| error "error occured! can't remove gnome-system-monitor"


            break
            ;;

      *) echo "invalid option $REPLY";;
    esac
done

sleep 1
clear
