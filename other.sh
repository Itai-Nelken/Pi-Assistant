#!/bin/bash  

clear
echo more features coming soon..
echo "this script will help you remove system-tools (update still in development)."
PS3='Please enter the number for operation you want to perform (1 - 1): '
options=("remove")
select opt in "${options[@]}"
do
    case $opt in




        "remove")

./uninstall.sh|| error "error occured! can't start remove script"


            break
            ;;


      *) echo "invalid option $REPLY";;
    esac
done

sleep 1
clear
