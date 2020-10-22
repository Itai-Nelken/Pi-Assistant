#!/bin/bash
#big thanks to ptitSeb for creating box86: https://github.com/ptitSeb/box86

#download file
#wget https://example/file.??

#don't think is needed
#cd ~/system-tools/apps/zoom

sudo dpkg -i box86-armhf.deb

#download some tools needed
sudo apt install xz-utils

#download zoom (other linux OS>32 bit>Download)

#extract zoom to /home/Pi/zoom and then delete the .tar.xz



#copy the desktop shortcut to the desktop and main menu
cp ~/system-tools/apps/zoom/zoom.desktop ~/Desktop || error "failed to create desktop shortcut"
sudo cp ~/system-tools/apps/zoom/zoom.desktop /usr/share/applications || error "failed to create menu shortcut!"
cp ~/system-tools/apps/zoom/libxcb-xtest.so.0 ~/zoom || error "failed to copy libxcb-xtest.so.0 to ~/zoom"


