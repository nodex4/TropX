#!/bin/bash

source functions.sh
##########################
#install necessary packages

# sudo apt install pv
# sudo apt install macchanger
# sudo apt install mdk3
# sudo apt install nmcli


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