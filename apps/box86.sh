#!/bin/bash  

function error {
  echo -e "\e[91m$1\e[39m"
}

#variables
DIRECTORY="$HOME/Pi-Assistant"
APPS="$HOME/Pi-Assistant/apps"

clear
echo "this script will help you install or remove gparted."
PS3='Please enter the number for install/remove (1 - 3): '
options=("install" "remove" "back to app installer")
select opt in "${options[@]}"
do
    case $opt in



        "install")

cd $HOME

if [ ! -z "$(file "$(readlink -f "/sbin/init")" | grep 64)" ];then
echo "Installing arm64 etcher..."
  echo "unfortunately 64bit support isn't here yet, I'm still working on it." && sleep 5 && $DIRECTORY/main.sh
elif [ ! -z "$(file "$(readlink -f "/sbin/init")" | grep 32)" ];then
  echo "OS is 32bit..."
else
  error "Failed to detect OS CPU architecture! Something is very wrong."
fi

sudo apt update || error "Failed to update repos (not critical)."
echo "$(tput setaf 3)box86 wont be installed if you are on TwisterOS$(tput sgr 0)"
sleep 5
#if box86 folder exists
if [ -d box86 ];then
  # if OS is not twisteros, then ask
  if [ ! -f /usr/local/bin/twistver ];then
    echo -n "Box86 already exists on your system. Do you want it overwritten with the latest version? [Y/n] "
    read answer
    if [ ! -z "$answer" ] && [ "$answer" == 'n' ];then
      echo -e "using your pre-existing version of box86.\nBEWARE: It may be out of date and \e[1m\e[97may not run Zoom successfully!\e[0m"
      #os is not twister, and box86 exists, but user declined overwrite
      compile=0
    else
      #not twisteros, box86 does exist, and user confirmed overwrite
      compile=1
    fi
  else
    #os is twisteros and box86 folder exists
    compile=0
  fi
else
  #os may or may not be twisteros, but box86 does not exist
  compile=1
fi

if [ $compile == 1 ];then
  gio trash ~/box86
  cd $HOME
  git clone https://github.com/ptitSeb/box86.git || error 'Failed to clone box86 repository!'
  cd box86 || error 'Failed to enter ~box86!'
  mkdir build || error 'Failed to make build directory!'
  cd build || error 'Failed to enter build directory!'
  cmake .. -DRPI4=1 -DCMAKE_BUILD_TYPE=RelWithDebInfo || error 'Failed to run cmake!'
  echo "Compiling box86..."
  make -j4 || error 'Failed to compile!'
  echo "Installing box86 on your system..."
  sudo make install || error "Failed to run sudo make install!"
  sudo systemctl restart systemd-binfmt
elif [ $compile == 0 ];then
echo "box86 wont be installed."
fi

            break
            ;;

 "remove")

echo "$(tput setaf 3)removing box86...$(tput sgr 0)"
cd $HOME/box86/build
sudo make uninstall
sudo rm -rf $HOME/box86 || error "can't remove ~/box86"
#sudo rm -f /usr/local/bin/box86 || error "can't remove /usr/local/bin/box86"

            break
            ;;

  "back to app installer")

$APPS/appinstaller.sh
          break
          ;; 

      *) echo "invalid option $REPLY";;
    esac
done

sleep 1
