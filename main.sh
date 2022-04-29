#!/bin/bash

#  ____          _______                         _     
# |  _ \        |__   __|                       | |    
# | |_) |_   _     | |_ __ ___   ___  _ __   ___| | __ 
# |  _ <| | | |    | | '__/ _ \ / _ \| '_ \ / _ \ |/ / 
# | |_) | |_| |    | | | | (_) | (_) | |_) |  __/   <  
# |____/ \__, |    |_|_|  \___/ \___/| .__/ \___|_|\_\ 
#         __/ |                      | |               
#        |___/                       |_|               
# Github: https://github.com/TroopekYT/



#Terminal Colors
NO_COLOR="\e[0m"

WHITE="\e[0;17m"
BOLD_WHITE="\e[1;37m"

CYAN="\e[0;36m"
BOLD_CYAN="\e[1;36m"

BLUE="\e[0;34m"
BOLD_BLUE="\e[1;34m"

RED="\e[0;31m"
BOLD_RED="\e[1;31m"

#Temporary test function
function testColors() {
clear
echo -e "$NO_COLOR none ★"
echo -e "$WHITE white"
echo -e "$BOLD_WHITE bold white"
echo -e "$CYAN cyan"
echo -e "$BOLD_CYAN bold cyan ★"
echo -e "$BLUE cyan"
echo -e "$BOLD_BLUE bold cyan ★"
echo -e "$RED red"
echo -e "$BOLD_RED bold red"
echo -e "$NO_COLOR -------------------------------"
}


function end() {
clear
echo -e "$BOLD_CYAN ★ $BOLD_BLUE Have a nice day! $BOLD_CYAN★"
echo -e "$BOLD_BLUE My GitHub:$WHITE https://github.com/TroopekYT"
exit
}



function title() {
clear
echo -e "$WHITE ▄▄▄█████▓ ██▀███   ▒█████   ██▓███   $RED  ▒██   ██▒
$WHITE▓  ██▒ ▓▒▓██ ▒ ██▒▒██▒  ██▒▓██░  ██▒  $RED ▒▒ █ █ ▒░
$WHITE▒ ▓██░ ▒░▓██ ░▄█ ▒▒██░  ██▒▓██░ ██▓▒  $RED ░░  █   ░
$WHITE░ ▓██▓ ░ ▒██▀▀█▄  ▒██   ██░▒██▄█▓▒ ▒  $RED  ░ █ █ ▒ 
$WHITE  ▒██▒ ░ ░██▓ ▒██▒░ ████▓▒░▒██▒ ░  ░  $RED ▒██▒ ▒██▒
$WHITE  ▒ ░░   ░ ▒▓ ░▒▓░░ ▒░▒░▒░ ▒▓▒░ ░  ░  $RED ▒▒ ░ ░▓ ░
$WHITE    ░      ░▒ ░ ▒░  ░ ▒ ▒░ ░▒ ░      $RED  ░░   ░▒ ░
$WHITE  ░        ░░   ░ ░ ░ ░ ▒  ░░        $RED   ░    ░  
$WHITE            ░         ░ ░            $RED   ░    ░  "
                                                
                                 
echo -e "$WHITE                                   By$RED Troopek  "
echo " "
}

function containsElement() {
  local e match="$1"
  shift
  for e; do [[ "$e" == "$match" ]] && return 0; done
  return 1
}



function getScript() {
title

echo -e "$BOLD_RED  Available Scripts: "
echo -e -n "$BOLD_WHITE"
echo " "

#Add custom script option

echo -e "$BOLD_WHITE    (\e[1;31m0$BOLD_WHITE) Add Custom Script"
echo "    ------------------"
#List out scripts
echo -e "$BOLD_WHITE    (\e[1;31m1$BOLD_WHITE) ScriptOne"
sleep 0.1  
echo -e "$BOLD_WHITE    (\e[1;31m2$BOLD_WHITE) ScriptTwo"
sleep 0.1 
echo -e "$BOLD_WHITE    (\e[1;31m3$BOLD_WHITE) ScriptThree"
sleep 0.1
echo -e "$BOLD_WHITE    (\e[1;31m4$BOLD_WHITE) ScriptFour"
sleep 0.1
echo -e "$BOLD_WHITE    (\e[1;31m5$BOLD_WHITE) ScriptFive"



export default_scripts=5
awk '{ print "    (\033[1;31m" NR+ENVIRON["default_scripts"] "\033[1;37m) " $0 }' < customScripts.txt




echo -e " "

if [ "$1" == "error" ]
then
echo -n -e "$BOLD_RED  Choose a number like \e[3m\e[1m1 \e[0m> "
else
echo -n -e "$BOLD_RED  Select desired script > "
fi

echo -n -e "$WHITE"
read SS
}




getScript

clear
title




#check if settings is selcted
if [ $SS == "settings" ] || [ $SS == "Settings" ] [$SS == "s"] || [ $SS == "S" ]; then
  echo heyther78
fi


if [ $SS == 0 ]; then
  clear
	echo [Under Construction]
fi


if [ $SS == 1 ]; then
  clear
	echo This will activate the first script
fi

######################
#check if the input is valid
options=("settings" "Settings" "S" "s")
containsElement "s" "${optiony[@]}"

echo 
#if 
#getScript error

