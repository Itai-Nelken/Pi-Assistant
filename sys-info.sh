#!/bin/bash

#variables
DE="`env | grep DESKTOP_SESSION`"
USER="`env | grep USER`"
KERNEL="`uname -rm`"

#display everything
echo "${USER:5}"
if [[ $DE == *"xfce"* ]]; then
	echo "Desktop Environment is: XFCE"
elif [[ $DE == *"lxde"* ]]; then
	echo "Desktop Environment is: LXDE"
elif [[ $DE == *"gnome"* ]]; then
	echo "Desktop Environment is: GNOME"
else
	echo "Cant detect Desktop Environment!"
fi
echo "kernel: $KERNEL"

read -n 1 -s -r -p "Press any key to go back to main menu"
