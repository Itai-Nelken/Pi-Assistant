#!/bin/bash  

clear

read -p "this script will help you change your password and root password. Press [Ctrl-C] to cancel, or [Enter] to continue..."
PS3='Please enter the number above for operation you would like to run (1 - 2): '
options=("user-password" "root-password")
select opt in "${options[@]}"
do
    case $opt in


        "user-password")

passwd || error "error occured! couldn't complete operation"
echo user password changed
sleep 2
            break
            ;;



        "root-password")

echo you can use the same password as your user account if you wish
sleep 4
sudo passwd || error "error occured! couldn't complete operation"
echo root password changed
sleep 2
            break
            ;;


        *) echo "invalid option $REPLY";;
    esac
done

