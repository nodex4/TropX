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

# create update repo

if [ ! -d "TropX/" ]; then
  git clone https://github.com/troopek/TropX
fi


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
  echo -e "$PRIMARY  What is the directory of where you want the shortcut saved? (specify full path!)$SECONDARY"
  read dekstop
  if [ ! -f "$desktop"/main.sh ]; then
    ln -s main.sh "$desktop"
  fi
fi

clear
echo -e "$PRIMARY  Setup Complete $SECONDARY"
read -rsp $'  Press any key to run TropX...\n' -n1 key

# bash main.sh