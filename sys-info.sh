#!/bin/bash

#clear the screen
clear

#print "loading screen"
echo -e "$(tput setaf 2)$(tput bold)GETTING INFO...$(tput sgr0)"

#loading bar
echo '  '

#clear the screen again
#clear

#print another message
#echo -e "$(tput setaf 2)FORMATING INFO...$(tput sgr 0)"

#variables
DE="`env | grep DESKTOP_SESSION`"
USER="`env | grep USER`"
KERNEL="`uname -r`"
KARCH="`uname -m`"
NETNAME="`uname -n`"
KRELEASE="`uname -v`"
sleep 0.1
echo -ne '(0%)[###                       ](100%)\r'
CPU="`lscpu | grep "Model name:"`"
MEM="`echo $(($(getconf _PHYS_PAGES) * $(getconf PAGE_SIZE) / (1024 * 1024)))`"
MODEL="`cat /proc/cpuinfo | grep Model`"
sleep 0.1
echo -ne '(0%)[#####                     ](100%)\r'
CSPEED="`lscpu | grep "CPU max" | cut -c22-25`"
OS="`cat /etc/*-release | grep PRETTY | cut -c14-43`"
sleep 0.1
echo -ne '(0%)[########                  ](100%)\r'
SOC="`cat /proc/cpuinfo | grep Hardware | cut -c12-18`"
CORES="`nproc`"
SOCREV="`cat /proc/cpuinfo | grep Revision | cut -c12-18`"
sleep 0.1
echo -ne '(0%)[##############            ](100%)\r'
LOCALIP="`hostname -I | awk '{print $1}'`"
PUBLICIP="`wget -qO- ipinfo.io/ip`"
FREEMEM="`free -h -m --si| awk '{ print $7}'|sed '/^$/d'`"
sleep 0.1
echo -ne '(0%)[####################      ](100%)\r'
DRES="`neofetch | grep Resolution | cut -c50-70 | cut -c4-21`"
CPUTEMP="`cat /sys/class/thermal/thermal_zone*/temp | cut -c1-2`"
sleep 0.1
echo -ne '(0%)[##########################](100%)\r'
sleep 0.5
echo -ne '\n'

#determine if OS is TwisterOS or not
if [ ! -f "/usr/local/bin/twistver" ]; then
    TWISTER=0
else
    TWISTER=1
fi


#determine GPU model
if [[ "$MODEL" == *"Raspberry Pi 4"* ]]; then
	GPU="Broadcom® VideoCore® VI"
elif [[ "$MODEL" == *"Raspberry Pi 3"* ]]; then
	GPU="Broadcom® VideoCore® IV"
elif [[ "$MODEL" == *"Raspberry Pi 2"* ]]; then
	GPU="Broadcom® VideoCore® IV"
else
	GPU="0"
fi

#get gpu 3d block (v3d) clock speed
if [ -f "/opt/vc/bin/vcgencmd" ]; then
    GPUSPEED="`/opt/vc/bin/vcgencmd measure_clock v3d | cut -c15-23 | cut -c1-3`"
else
	GPUSPEED=0
fi

#get GPU memory
if [ -f "/opt/vc/bin/vcgencmd" ]; then
    GPUMEM="`vcgencmd get_mem gpu`"
else
	GPUMEM=0
fi


#determine if host system is 64 bit arm64 or 32 bit armhf
if [ ! -z "$(file "$(readlink -f "/sbin/init")" | grep 64)" ];then
  OSARCH=64
elif [ ! -z "$(file "$(readlink -f "/sbin/init")" | grep 32)" ];then
  OSARCH=32
else
  OSARCH=e
fi

#clear screen again
clear

############### DISPLAY EVERYTHING ################

printf "$(tput bold)\\e[3;4;37mBasic information:\\n\\e[0m$(tput sgr 0)"

#display username
echo "Username is: ${USER:5}"
#display model name
echo "Device model name is: ${MODEL:9}"
#display network name
echo "Device network name is: $NETNAME"
#display IP address
echo "Your local IP address is: $LOCALIP"
echo "Your public IP address is: $PUBLICIP"


echo -e " "

printf "$(tput bold)\\e[3;4;37mSystem architectures:\\n\\e[0m$(tput sgr 0)"
#display OS arch
if [[ "$OSARCH" == 32 ]]; then
	echo "OS architecture is: 32bit ARM"
elif [[ "$OSARCH" == 64 ]]; then
	echo "OS architecture is: 64bit ARM"
elif [[ "$OSARCH" == e ]]; then
	echo "Can't detect OS architecture, something is very very wrong!"
fi
#display kernel arch
echo "Kernel architecture is: $KARCH"

echo -e " "

printf "$(tput bold)\\e[3;4;37mHardware information:\\n\\e[0m$(tput sgr 0)"
#display CPU info
printf "\\e[3;4;37mCPU:\\n\\e[0m"
echo "System on Chip (SOC): $SOC, Revision $SOCREV"
echo "Number of CPU cores is: $CORES"
echo "Processor (CPU) core/s name is: ${CPU:21}"
echo "Processor maximum clock speed is: $CSPEED mhz"
echo "CPU temperature is: $CPUTEMP °C"
#display GPU info
printf "\\e[3;4;37mGPU:\\n\\e[0m"
if [[ "$GPU" != 0 ]]; then
	echo "GPU model is: $GPU"
fi
if [[ "$GPUSPEED" != 0 ]]; then
	echo "Current GPU clock speed is: $GPUSPEED mhz"
fi
#display memory info
if [[ "$GPUMEM" != 0 ]]; then
	echo "GPU memory is: ${GPUMEM:4}"
fi
echo "Memory (RAM) size is $MEM mb"
echo "amount of free Memory: $FREEMEM"
echo "Display resolution and refresh rate: $DRES"

echo " "

printf "$(tput bold)\\e[3;4;37mSoftware information:\\n\\e[0m$(tput sgr 0)"
printf "\\e[3;4;37mOperating system:\\n\\e[0m"
#display OS
echo "OS name is: $OS"
if [[ "$TWISTER" == 1 ]]; then
	TWISTVER="`twistver | cut -c20-24`"
	echo "OS mod is: TwisterOS version $TWISTVER"
fi
printf "\\e[3;4;37mKernel:\\n\\e[0m"
#display kernel
echo "Kernel: $KERNEL, release: $KRELEASE"

echo "                        "
#display DE
if [[ $DE == *"xfce"* ]]; then
	echo "Desktop Environment is: XFCE"
elif [[ $DE == *"LXDE"* ]]; then
	echo "Desktop Environment is: LXDE"
elif [[ $DE == *"gnome"* ]]; then
	echo "Desktop Environment is: GNOME"
else
	echo "Unknown Desktop Environment!"
fi

echo -e "----------------------------"

#display "press any key to exit"
echo -e "$(tput setaf 6)you can scroll up and down using the mouse or scrollbar (if present).$(tput sgr 0)"
read -n 1 -s -r -p "Press any key to exit"
echo -e "\n"
