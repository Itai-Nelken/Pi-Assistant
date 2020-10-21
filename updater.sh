#!/bin/bash  
echo checking for updates...
git pull || error "error occured! can't look for updates are you connected to the internet?" 
sleep 2
clear
