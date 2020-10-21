#!/bin/bash  

clear
echo "this script will help you update or remove system-tools."
PS3='Please enter the number for operation you want to perform (1 - 3): '
options=("update" "remove" "recovery")
select opt in "${options[@]}"
do
    case $opt in



        "update")
git pull || error "error occured! are you connected to the internet?"

            break
            ;;

        "remove")

./uninstall.sh|| error "error occured! can't start remove script"


            break
            ;;

"recovery")

./recovery.sh|| error "error occured! can't start recovery script"


            break
            ;;

      *) echo "invalid option $REPLY";;
    esac
done

sleep 1
clear
