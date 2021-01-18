##!/bin/bash

#variables
DE="`env | grep DESKTOP_SESSION`"
USER="`env | grep USER`"
KERNEL="`uname -r`"
KARCH="`uname -m`"
NETNAME="`uname -n`"
KRELEASE="`uname -v`"
CPU="`lscpu | grep "Model name:"`"
MEM="`echo $(($(getconf _PHYS_PAGES) * $(getconf PAGE_SIZE) / (1024 * 1024)))`"
MODEL="`cat /proc/cpuinfo | grep Model`"
CSPEED="`lscpu | grep "CPU max" | cut -c22-25`"

#determine if host system is 64 bit arm64 or 32 bit armhf
if [ ! -z "$(file "$(readlink -f "/sbin/init")" | grep 64)" ];then
  OSARCH=64
elif [ ! -z "$(file "$(readlink -f "/sbin/init")" | grep 32)" ];then
  OSARCH=32
else
  OSARCH=e
fi


### DISPLAY EVERYTHING ###

printf "$(tput bold)\\e[3;4;37mBasic information:\\n\\e[0m$(tput sgr 0)"

#display username
echo "username is: ${USER:5}"
#display model name
echo "Device model name is: ${MODEL:9}"
#display network name
echo "device network name is: $NETNAME"


echo -e " "

printf "$(tput bold)\\e[3;4;37mSystem architectures:\\n\\e[0m$(tput sgr 0)"
#display OS arch
if [[ "$OSARCH" == 32 ]]; then
	echo "OS architecture is: 32bit ARM"
elif [[ "$OSARCH" == 64 ]]; then
	echo "OS architecture is: 64bit ARM"
elif [[ "$OSARCH" == e ]]; then
	echo "can't detect OS architecture, something is very very wrong!"
fi
#display kernel arch
echo "kernel architecture is: $KARCH"

echo -e " "

printf "$(tput bold)\\e[3;4;37mHardware information:\\n\\e[0m$(tput sgr 0)"
#display CPU name and speed
echo "Processor (CPU) model name is: ${CPU:21}"
echo "Processor clock speed is: $CSPEED mhz"
#display memory
echo "memory (RAM) size is $MEM mb"

echo " "

printf "$(tput bold)\\e[3;4;37mSoftware information:\\n\\e[0m$(tput sgr 0)"
printf "\\e[3;4;37mKernel:\\n\\e[0m"
#display kernel
echo "kernel: $KERNEL, release: $KRELEASE"
echo "                        "
#display DE
if [[ $DE == *"xfce"* ]]; then
	echo "Desktop Environment is: XFCE"
elif [[ $DE == *"lxde"* ]]; then
	echo "Desktop Environment is: LXDE"
elif [[ $DE == *"gnome"* ]]; then
	echo "Desktop Environment is: GNOME"
else
	echo "Unknown Desktop Environment!"
fi

echo -e "----------------------------"

#display "press any key to exit"
read -n 1 -s -r -p "Press any key to go back to main menu"
echo -e "\n"
