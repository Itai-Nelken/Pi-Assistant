echo this script will help you install applications, update the system, and much more
echo press [Ctrl-C] to exit
PS3='Please enter the number above for operation you would like to perform (1 - 5): '
options=("update" "change-password" "install-applications" "system-tools" "other")
select opt in "${options[@]}"
do
    case $opt in


        "update")
        
./update.sh
            break
            ;;


        "change-password")

./change-password.sh

clear

            break
            ;;



 
        "install-applications")

clear

cd ~/Pi-Assistant/apps/
./app-installer.sh

clear

            break
            ;;



        "system-tools")

./apt-tools.sh
clear

            break
            ;;

     "other")

./other.sh
read -p "[Ctrl-C] to exit"


            break
            ;;




        *) echo "invalid option $REPLY";;
    esac
done
