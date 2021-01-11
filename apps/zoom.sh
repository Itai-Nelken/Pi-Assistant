#!/bin/bash 

function error {
  echo -e "\e[91m$1\e[39m"
}

#variables
DIRECTORY="$HOME/Pi-Assistant"
APPS="$HOME/Pi-Assistant/apps"

echo "this script will help you install or remove GNOME system monitor."
PS3='Please enter the number for install or remove (1 - 3): '
options=("install" "remove" "back to app installer")
select opt in "${options[@]}"
do
    case $opt in



        "install")

cd $HOME

if $(uname -m | grep '64'); then

  #64 bit
  echo "unfortunately 64bit support isn't here yet, I'm still working on it." && sleep 5 && $DIRECTORY/main.sh

else
  #32 bit 
  echo "OS is 32bit"
fi

sudo apt update || error "Failed to update repos (not critical)."

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

#check if ~/zoom folde exists (check if zoom is already installed)
if [ -d "${HOME}/zoom" ];then
  echo -ne "${HOME}/zoom already exists on your system. Do you want it overwritten with the latest version? [Y/n] "
  read answer
  if [ ! -z "$answer" ] && [ "$answer" == 'n' ];then
    dlzoom=0
  else
    download=1
  fi
else
  download=1
fi

echo "installing dependencies..."
sudo apt install -y -f libxcb-xtest0 libxcb-xfixes0 cmake
#refresh lib list
sudo ldconfig
if [ $download == 1 ];then
   echo "Downloading zoom..."
   rm -rf "${HOME}/zoom" ~/zoomx86.tar.xz
   wget https://github.com/Itai-Nelken/Pi-Assistant-files/raw/main/files/zoom.tar.xz -O zoomx86.tar.xz || error 'Failed to download Zoom!'
   echo "extracting zoom..."
   tar -xf zoomx86.tar.xz || error 'Failed to extract Zoom!'
   rm -f zoomx86.tar.xz 
fi

echo "Creating zoom launcher script..."
echo "#!/bin/bash
function error {
  echo -e "\\e[91m$1\\e[39m"
  exit 1
}

if [ -d ~/box86 ]; then

  echo "box86 installed..."

else
  echo "Box86 missing! please install"
  exit 1 

fi

if [ -d ~/zoom ]; then

  echo "zoom folder exists..."

else
  echo "zoom folder is missing! please reinstall zoom"
  exit 1 

fi

#go to zoom directory (~/zoom)
cd $HOME/zoom || error 'Failed to change directory to ~/zoom!'
echo "$(tput setaf 3)close this window to exit zoom$(tput sgr 0)"
sleep 1
echo "$(tput setaf 2)starting zoom...$(tput sgr 0)"
sleep 1
#start zoom with box86
pulseaudio --start
box86 zoom || error "can't start zoom!"
echo "$(tput setaf 2)exiting in 5 seconds:($(tput sgr 0)"
sleep 5' > "${HOME}/zoom/startzoom.sh"
sudo chmod +x "${HOME}/zoom/startzoom.sh"

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
fi

echo "Restarting systemd-binfmt service..."
sudo systemctl restart systemd-binfmt || error "Failed to restart systemd-binfmt service! please reboot before running zoom"

echo "Creating Menu shortcut..."
echo '[Desktop Entry]
Name=Zoom
Exec="$HOME/zoom/startzoom.sh"
Icon="${DIRECTORY}/icons/64x64/zoom-64.png"
Path="${HOME}/zoom/"
Type=Application
Terminal=true
StartupNotify=true
Comment="Linux x86 version of Zoom clud meetings client using Box86"
Categories=Network;
StartupNotify=true' > ~/.local/share/applications/zoom.desktop

read -p "Do you want to create a shortcut on your Desktop (y/n)?" choice
case "$choice" in 
  y|Y ) echo "creating desktop shortcut" && cp ~/.local/share/applications/zoom.desktop ~/Desktop && sudo chmod +x ~/Desktop/zoom.desktop || error "failed to copy desktop shortcut";;
  n|N ) echo "skipping desktop shortcut"   ;;
  * ) echo "invalid";;
esac

echo "installation complete!"
sleep 5

            break
            ;;
   
   "remove")  

rm  ~/.local/share/applications/zoom.desktop
rm $HOME/Desktop/zoom.desktop || error "failed to remove Desktop shortcut, probably doesn't exist. (not critical)"
read -p "Do you want to remove box86 (y/n)?" choice
case "$choice" in 
  y|Y ) cd $HOME/box86/build && sudo make uninstall && rm -rf $HOME/box86;;
  n|N ) echo "box86 won't be removed"   ;;
  * ) echo "invalid";;
esac
read -p "Do you want to remove dependencies (libxcb-xtest0 libxcb-xfixes0 cmake) (y/n)?" choice
case "$choice" in 
  y|Y ) sudo apt purge -y libxcb-xtest0 libxcb-xfixes0 cmake || error "failed to remove gnome-system-monitor!";;
  n|N ) echo "dependencies wont be removed."   ;;
  * ) echo "invalid";;
esac
   
            break
            ;;

"back to app installer")
   
$APPS/appinstaller.sh

            break
            ;;

       *) echo "invalid option $REPLY";;
    esac
done     

sleep 2
clear
