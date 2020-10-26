#!/bin/bash  

function error {
  echo -e "\\e[91m$1\\e[39m"
  exit 1
}

clear
echo more features coming soon..
echo "this script will help you remove system-tools (update still in development)."
PS3='Please enter the number for operation you want to perform (1 - 2): '
options=("update" "remove")
select opt in "${options[@]}"
do
    case $opt in


        "update")

./updater.sh|| error "error occured! can't start updater script"
clear
echo "$(tput setaf 6)you need to reopen the app. $(tput sgr 0)"
read -p "[Ctrl-C] to exit"

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

