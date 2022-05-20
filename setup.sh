#!/bin/bash

source functions.sh
##########################
#install necessary packages

# clean apt

echo -e "\e[1;32m Step 1: Updating packages \e[0m"
sudo apt-get update

echo

echo -e "\e[1;32m Step 2: Upgrading packages \e[0m" 
sudo apt-get upgrade -y
sudo apt-get dist upgrade -y 
sudo apt-get update

echo 

echo -e "\e[1;32m Step 3: Cleaning up \e[0m"
sudo apt-get clean
sudo apt-get autoclean
sudo apt-get autoremove



# bash:

sudo apt install pv
sudo apt install macchanger
sudo apt install mdk3
sudo apt install nmcli


# python

sudo apt install os
sudo apt install python3


##########################
#create custom script files if they dont exist already
if [ ! -d custom_scripts ]; then
  mkdir -p custom_scripts;
fi

if [ ! -f customScripts.txt ]; then
  touch customScripts.txt;
fi

if [ ! -f customIfs.sh ]; then
  touch customIfs.sh;
  echo "#!/bin/bash" > customIfs.sh
  echo "
function customIFs() {
  :
}" >> customIfs.sh
fi

if [ ! -f settings.tropx ]; then
  touch settings.tropx;
  echo "Wireless Interface : wlan0 | mon0
Animations : (ON) | MINIMAL | OFF
Default Scripts : (SHOW) | HIDE
Breadcrumbs : (ON) | OFF
Primary Color : (WHITE) | RED | BLUE | GREEN | CYAN | PINK | YELLOW | GRAY
Secondary Color : (RED) | WHITE | BLUE | GREEN | CYAN | PINK | YELLOW | GRAY
Text Folding : (ON) | OFF" >> settings.tropx
fi

##########################
#explain usage
title
echo -e "$PRIMARY  Check https://github.com/troopek/TropX for usage and startup instructions! $SECONDARY"
read -rsp $'  Press any key to continue...\n' -n1 key


##########################
#make them select their wireless interface using changeOption 
optionToChange=$(grep -n "Wireless Interface" settings.tropx | cut -d: -f1)
setting=$(sed ${optionToChange}!d settings.tropx)
    setting=$(echo $setting | sed 's/ :.*//')
    changeOption "$setting" setup

# bash main.sh