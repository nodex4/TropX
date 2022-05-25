#!/usr/bin/env bash

source main.sh
##########################
#install necessary packages

# clean apt

echo -e "\e[1;32m Step 1: Updating packages \e[0m"
sudo apt update

echo

echo -e "\e[1;32m Step 2: Upgrading packages \e[0m" 
sudo apt upgrade -y
sudo apt dist upgrade -y 
sudo apt update -y

echo 

echo -e "\e[1;32m Step 3: Cleaning up \e[0m"
sudo apt clean -y
sudo apt autoclean -y
sudo apt autoremove -y



# bash:

sudo apt install pv -y
sudo apt install macchanger -y
sudo apt install mdk3 -y
sudo apt install nmcli -y


# python

sudo apt install os -y
sudo apt install python3 -y


##########################
#create custom script files if they dont exist already
if [ ! -d custom_scripts ]; then
  mkdir -p custom_scripts;
fi

if [ ! -f script_names/customScripts.txt ]; then
  touch script_names/customScripts.txt;
fi

if [ ! -f customIfs.sh ]; then
  touch customIfs.sh;
  echo "#!/usr/bin/env bash" > customIfs.sh
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






# create desktop shortcut

# bash main.sh