#!/bin/bash  

clear
echo "this script will help you install or remove box86."
PS3='Please enter the number for install or remove (1 - 2): '
options=("install" "remove")
select opt in "${options[@]}"
do
    case $opt in



        "install")

if [ -d ~/box86 ];then
  read -p "box86 is already installed. Do you want to reinstall (recommended) (y/n)?" choice
case "$choice" in 
  y|Y ) echo "box86 will be installed" ;;
  n|N ) echo "box86 won't be installed" && exit   ;;
  * ) echo "invalid";;
esac
  
fi


echo "$(tput setaf 3)installing box86...$(tput sgr 0)"
#install dependencies for box86
sudo apt install cmake || error "failed to install cmake! are you connected to the internet?"

cd ~
git clone https://github.com/ptitSeb/box86 || error "failed to download repo!"
cd box86 || error "failed to enter directory!"
mkdir build; cd build
cmake .. -DRPI4=1 -DCMAKE_BUILD_TYPE=RelWithDebInfo || error "cmake failed!"
make -j24 || error "make failed!"
sudo make install || error "sudo make install failed!"
sudo systemctl restart systemd-binfmt

echo "$(tput setaf 2)box86 installed.$(tput sgr 0)"

            break
            ;;

 "remove")

echo "$(tput setaf 3)removing box86...$(tput sgr 0)"
sudo rm -rf ~/box86 || error "can't remove ~/box86"
sudo rm -f /usr/local/bin/box86 || error "can't remove /usr/local/bin/box86"

echo "$(tput setaf 2)box86 removed.$(tput sgr 0)"

            break
            ;;

      *) echo "invalid option $REPLY";;
    esac
done

sleep 2
clear









