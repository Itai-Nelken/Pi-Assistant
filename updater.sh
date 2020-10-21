#!/bin/bash  
echo checking for updates...
cd ~/system-tools
git pull || error "error occured! can't look for updates are you connected to the internet?" 
sleep 1
clear
