#!/bin/bash  

clear
echo "this script will help you update or remove system-tools."
PS3='Please enter the number for operation you want to perform (1 - 2): '
options=("update" "remove")
select opt in "${options[@]}"
do
    case $opt in



        "update")

clear
git pull || error "error occured! are you connected to the internet?"

            break
            ;;

        "remove")

./uninstall.sh|| error "error occured! can't start remove script"


            break
            ;;

      *) echo "invalid option $REPLY";;
    esac
done

sleep 1
clear
