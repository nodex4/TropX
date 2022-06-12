#!/usr/bin/env bash

source main.sh


PRIMARY=$"\033[1;37m"
SECONDARY=$"\033[1;31m"




##########################
#install necessary packages

# clean apt

echo -e "$PRIMARY Step 1: Updating packages \e[0m"
sudo apt update
echo
echo -e "$PRIMARY Step 2: Upgrading packages \e[0m" 
sudo apt upgrade -y
sudo apt dist upgrade -y 
sudo apt update -y
echo 
echo -e "$PRIMARY Step 3: Cleaning up \e[0m"
sudo apt clean -y
sudo apt autoclean -y
sudo apt autoremove -y



# bash:

sudo apt install pv -y
sudo apt install macchanger -y
sudo apt install mdk3 -y
sudo apt install nmcli -y
sudo apt install aircrack-ng -y


# python

sudo apt install os -y
sudo apt install python3 -y

# # create update repo

# if [ ! -d "TropX/" ]; then
#   git clone https://github.com/troopek/TropX
# fi

directory=$(pwd)
##########################
#create custom script files if they dont exist already
if [ ! -d custom_scripts ]; then
  mkdir -p custom_scripts;
fi

if [ ! -f "script_names/customScripts.txt" ]; then
  touch script_names/customScripts.txt;
fi

if [ ! -f "settings.tropx" ]; then
  touch settings.tropx;
  echo "Wireless Interface : (wlan0) | wlan1 | mon0 | mon1
Animations : ON | MINIMAL | (OFF)
Default Scripts : (SHOW) | HIDE
Breadcrumbs : (ON) | OFF
Primary Color : (WHITE) | RED | BLUE | GREEN | CYAN | PINK | YELLOW | GRAY
Secondary Color : RED | WHITE | (BLUE) | GREEN | CYAN | PINK | YELLOW | GRAY
Text Folding : ON | (OFF)
Developer Mode : ON | (OFF)" >> settings.tropx
fi

##########################
#explain usage
clear
echo -e "$PRIMARY  Check https://github.com/troopek/TropX for usage and startup instructions! $SECONDARY"
read -rsp $'  Press any key to continue...\n' -n1 key


##########################
#make them select their wireless interface using changeOption 
clear
echo -e "$PRIMARY  You can change your Wireless Interface name in settings! $SECONDARY"
read -rsp $'  Press any key to continue...\n' -n1 key


# create desktop shortcut\
clear
echo -e "$PRIMARY  Would you like to create a shortcut for TropX? $SECONDARY(y/n)"
read ans
until [[ $ans == "y" ]] || [[ $ans == "n" ]]; do
  clear
  echo -e "$PRIMARY  Would you like to create a shortcut for TropX? $SECONDARY(y/n)"
  read ans
done

if [[ $ans == "y" ]]; then
  clear
  echo -e "$PRIMARY  What is the directory of where you want the shortcut saved? (${SECONDARY}specify full path!${PRIMARY})$SECONDARY"
  read desktop
  echo "[Desktop Entry]
Type=Application
Terminal=true
Name=TropX
Icon="$directory"/images/logo.png
Exec=bash -c 'cd "$directory"; bash "$directory"/main.sh'" > "$desktop/TropX.desktop"
  chmod +x "$desktop/TropX.desktop"
  gio set "$desktop/TropX.desktop" metadata::trusted true
fi

clear
echo -e "$PRIMARY  Setup Complete $SECONDARY"
read -rsp $'  Press any key to run TropX...\n' -n1 key

# bash main.sh