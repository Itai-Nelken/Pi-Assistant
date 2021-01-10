#!/bin/bash

echo "this script will help you do something"
PS3='Please enter the number above for operation you would like to perform (1 - 5): '
options=("operation 1" "operation 2" "operation 3" "operation 4" "operation 5")
select opt in "${options[@]}"
do
    case $opt in


        "operation 1")
        
echo "you selected option 1"
            break
            ;;


        "operation 2")

echo "you selected option 2"
            break
            ;;



 
        "operation 3")

echo "you selected option 3"
            break
            ;;



        "operation 4")

echo "you selected option 4"
            break
            ;;

     "operation 5")

echo "you selected option 5"

            break
            ;;




        *) echo "invalid option $REPLY";;
    esac
done
