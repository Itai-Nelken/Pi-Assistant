#!/bin/bash
#big thanks to ptitSeb for creating box86: https://github.com/ptitSeb/box86

function error {
  echo -e "\\e[91m$1\\e[39m"
  exit 1
 }

cd ~

sudo apt update || error "failed to update! are you connected to the internet?"

#install dependencies for box86
sudo apt install cmake || error "failed to install cmake! are you connected to the internet?"

mkdir zoom 
#compile and install box86
if [ -d ~/box86 ];then
  read -p "box86 is already installed. Do you want to reinstall (recommended) (y/n)?" choice
case "$choice" in 
  y|Y ) echo "box86 will be installed" && gio trash ~/box86 && ./box86.sh;;
  n|N ) echo "box86 won't be installed"   ;;
  * ) echo "invalid";;
esac
  
fi


#Download zoom
cd ~/zoom
echo "Downloading Zoom..."
cd ~ && cd zoom
wget https://zoom.us/client/latest/zoom_i686.tar.xz -O zoomx86.tar.xz || error 'Failed to download Zoom!'
echo "extracting zoom"
tar -xf zoomx86.tar.xz || error 'Failed to extract Zoom!'
cp zoom ~
rm -f zoomx86.tar.xz 
rm -rf zoom


if $(uname -m | grep '64'); then

  #64 bit
  echo "unfortunately 64bit support isn't here yet, I'm still working on it." && sleep 5 && exit

else
  #32 bit installation
  #install dependencies for zoom
  sudo apt install libxcb-xtest0 libxcb-xfixes0 cmake pulseaudio-utils pulseaudio

fi

#copy the desktop shortcut to the desktop and main menu and a dependency to the zoom directory
read -p "Do you want to create a shortcut on your Desktop (y/n)?" choice
case "$choice" in 
  y|Y ) echo "creating desktop shortcut" && cp ~/Pi-Assistant/apps/zoom/files/zoom.desktop ~/Desktop && sudo chmod +x ~/Desktop/zoom.desktop || error "failed to copy desktop shortcut";;
  n|N ) echo "skipping desktop shortcut"   ;;
  * ) echo "invalid";;
esac
sudo cp ~/Pi-Assistant/apps/zoom/files/zoom.desktop /usr/share/applications || error "failed to copy menu shortcut!"
cp ~/Pi-Assistant/apps/zoom/files/libxcb-xtest.so.0 ~/zoom || error "failed to copy libxcb-xtest.so.0 to ~/zoom"

echo installation complete!
