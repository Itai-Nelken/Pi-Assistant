#!/bin/bash
#big thanks to ptitSeb for creating box86: https://github.com/ptitSeb/box86


#commands to remember
#1. find /where/to/look/up criteria action

#2.how to compile box86: https://github.com/ptitSeb/box86/blob/master/COMPILE.md

#git clone https://github.com/ptitSeb/box86
#cd box86
#mkdir build; cd build; cmake .. -DRPI4=1 -DCMAKE_BUILD_TYPE=RelWithDebInfo
#make -j24
#sudo make install
#sudo systemctl restart systemd-binfmt

#3.remove folder: (sudo) rm -rf /path/to/folder
#remove file: (sudo) rm -f /path/to/file

#4. echo -n "Do yo want to continue? [Y/n] "


#if box86 is installed then ask if you want to reinstall, if box86 isn't installed, proceed with compile.
if
	if
		#is box86 installed? (search for ~/box86 folder)
		
		
	then
		#ask if you want to reinstall, if no, exit both loops
	
	
	
then
	#compile box86 for raspberry pi
	
	
	

#create a zoom directory (~/zoom)
mkdir -p ~/zoom
#copy the desktop shortcut to the desktop and main menu
cp ~/system-tools/apps/zoom/zoom.desktop ~/Desktop || error "failed to create desktop shortcut"
sudo cp ~/system-tools/apps/zoom/zoom.desktop /usr/share/applications || error "failed to create menu shortcut!"

#go to the zoom directory
#cd ~/system-tools/apps/zoom

#extract libxcb-xtest.so.0 to ~/zoom
tar xvzf libxcb-xtest.so.0 -C ~/zoom




	